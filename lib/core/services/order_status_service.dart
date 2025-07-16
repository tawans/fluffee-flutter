import 'dart:async';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/entities/order.dart';
import '../../domain/repositories/order_repository.dart';

/// 주문 상태 자동 업데이트 서비스
/// 5-10분 간격으로 주문 상태를 자동으로 업데이트하고
/// 실시간 구독을 통해 주문 상태 변경을 모니터링합니다.
class OrderStatusService {
  final OrderRepository _orderRepository;
  final SupabaseClient _supabaseClient;
  
  Timer? _autoUpdateTimer;
  StreamSubscription? _realtimeSubscription;
  
  // 주문 상태 스트림 컨트롤러들
  final Map<String, StreamController<OrderStatus>> _statusControllers = {};
  
  OrderStatusService(this._orderRepository, this._supabaseClient);

  /// 주문 상태 자동 업데이트 시작
  void startAutoUpdate() {
    // 5분마다 진행 중인 주문들의 상태를 자동 업데이트
    _autoUpdateTimer = Timer.periodic(const Duration(minutes: 5), (timer) {
      _updateActiveOrders();
    });
  }

  /// 주문 상태 자동 업데이트 정지
  void stopAutoUpdate() {
    _autoUpdateTimer?.cancel();
    _autoUpdateTimer = null;
  }

  /// 실시간 주문 상태 구독 시작
  void startRealtimeSubscription() {
    _realtimeSubscription = _supabaseClient
        .from('orders')
        .stream(primaryKey: ['id'])
        .listen((data) {
          for (final orderData in data) {
            final orderId = orderData['id'] as String;
            final status = OrderStatus.values.firstWhere(
              (s) => s.toString().split('.').last == orderData['status'],
              orElse: () => OrderStatus.received,
            );
            
            // 해당 주문의 스트림 컨트롤러에 상태 변경 알림
            _statusControllers[orderId]?.add(status);
          }
        });
  }

  /// 실시간 구독 정지
  void stopRealtimeSubscription() {
    _realtimeSubscription?.cancel();
    _realtimeSubscription = null;
  }

  /// 특정 주문의 상태 스트림 구독
  Stream<OrderStatus> getOrderStatusStream(String orderId) {
    if (!_statusControllers.containsKey(orderId)) {
      _statusControllers[orderId] = StreamController<OrderStatus>.broadcast();
    }
    return _statusControllers[orderId]!.stream;
  }

  /// 특정 주문의 상태 스트림 해제
  void disposeOrderStatusStream(String orderId) {
    _statusControllers[orderId]?.close();
    _statusControllers.remove(orderId);
  }

  /// 모든 스트림 정리
  void dispose() {
    stopAutoUpdate();
    stopRealtimeSubscription();
    
    for (final controller in _statusControllers.values) {
      controller.close();
    }
    _statusControllers.clear();
  }

  /// 진행 중인 주문들의 상태를 자동으로 업데이트
  Future<void> _updateActiveOrders() async {
    try {
      // 진행 중인 주문들 조회 (received, preparing, ready 상태)
      final activeStatuses = [
        OrderStatus.received,
        OrderStatus.preparing,
        OrderStatus.ready,
      ];

      for (final status in activeStatuses) {
        final result = await _orderRepository.getOrdersByStatus(status);
        result.fold(
          (failure) {
            // 에러 처리 - 로그 기록 등
            // print('Failed to get orders by status: ${failure.message}');
          },
          (orders) {
            for (final order in orders) {
              _simulateStatusProgress(order);
            }
          },
        );
      }
    } catch (e) {
      // print('Error in auto update: $e');
    }
  }

  /// 주문 상태 진행 시뮬레이션
  /// 실제 환경에서는 매장 시스템과 연동하여 실제 주문 진행 상황을 반영
  Future<void> _simulateStatusProgress(Order order) async {
    final now = DateTime.now();
    final orderTime = order.createdAt;
    final elapsedMinutes = now.difference(orderTime).inMinutes;

    OrderStatus? nextStatus;

    switch (order.status) {
      case OrderStatus.received:
        // 주문 접수 후 5-8분 경과시 제작 중으로 변경
        if (elapsedMinutes >= 5) {
          nextStatus = OrderStatus.preparing;
        }
        break;
      case OrderStatus.preparing:
        // 제작 시작 후 10-15분 경과시 픽업 가능으로 변경
        if (elapsedMinutes >= 12) {
          nextStatus = OrderStatus.ready;
        }
        break;
      case OrderStatus.ready:
        // 픽업 가능 상태는 자동으로 변경하지 않음 (고객이 직접 픽업 완료 처리)
        break;
      case OrderStatus.completed:
      case OrderStatus.cancelled:
        // 완료/취소된 주문은 더 이상 처리하지 않음
        break;
    }

    if (nextStatus != null) {
      await _updateOrderStatus(order.id, nextStatus);
    }
  }

  /// 주문 상태 업데이트
  Future<void> _updateOrderStatus(String orderId, OrderStatus newStatus) async {
    try {
      final result = await _orderRepository.updateOrderStatus(
        orderId: orderId,
        status: newStatus,
      );
      result.fold(
        (failure) {
          // print('Failed to update order status: ${failure.message}');
        },
        (success) {
          // 성공적으로 업데이트된 경우 스트림에 알림
          _statusControllers[orderId]?.add(newStatus);
          // print('Order $orderId status updated to $newStatus');
        },
      );
    } catch (e) {
      // print('Error updating order status: $e');
    }
  }

  /// 특정 주문의 현재 상태 조회
  Future<OrderStatus?> getCurrentOrderStatus(String orderId) async {
    try {
      final result = await _orderRepository.getOrder(orderId);
      return result.fold(
        (failure) => null,
        (order) => order.status,
      );
    } catch (e) {
      // print('Error getting current order status: $e');
      return null;
    }
  }

  /// 예상 완료 시간 계산
  Duration getEstimatedCompletionTime(Order order) {
    final now = DateTime.now();
    final elapsed = now.difference(order.createdAt);
    
    switch (order.status) {
      case OrderStatus.received:
        // 주문 접수 후 총 15-20분 예상
        return const Duration(minutes: 15) - elapsed;
      case OrderStatus.preparing:
        // 제작 중일 때 10-15분 예상
        return const Duration(minutes: 12) - elapsed;
      case OrderStatus.ready:
        // 픽업 가능 상태
        return Duration.zero;
      case OrderStatus.completed:
      case OrderStatus.cancelled:
        return Duration.zero;
    }
  }

  /// 주문 진행률 계산 (0.0 ~ 1.0)
  double getOrderProgress(Order order) {
    switch (order.status) {
      case OrderStatus.received:
        return 0.25;
      case OrderStatus.preparing:
        return 0.75;
      case OrderStatus.ready:
        return 1.0;
      case OrderStatus.completed:
        return 1.0;
      case OrderStatus.cancelled:
        return 0.0;
    }
  }
}