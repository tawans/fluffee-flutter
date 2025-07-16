import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/services/order_status_service.dart';
import '../../domain/entities/order.dart';
import '../../domain/repositories/order_repository.dart';
import '../../di/injection.dart';

/// 주문 상태 서비스 프로바이더
final orderStatusServiceProvider = Provider<OrderStatusService>((ref) {
  final orderRepository = getIt<OrderRepository>();
  final supabaseClient = Supabase.instance.client;
  
  final service = OrderStatusService(orderRepository, supabaseClient);
  
  // 서비스 시작
  service.startAutoUpdate();
  service.startRealtimeSubscription();
  
  // 프로바이더가 dispose될 때 서비스 정리
  ref.onDispose(() {
    service.dispose();
  });
  
  return service;
});

/// 특정 주문의 실시간 상태 스트림 프로바이더
final orderStatusStreamProvider = StreamProvider.family<OrderStatus, String>((ref, orderId) {
  final service = ref.watch(orderStatusServiceProvider);
  
  // 프로바이더가 dispose될 때 스트림 정리
  ref.onDispose(() {
    service.disposeOrderStatusStream(orderId);
  });
  
  return service.getOrderStatusStream(orderId);
});

/// 특정 주문의 현재 상태 프로바이더
final currentOrderStatusProvider = FutureProvider.family<OrderStatus?, String>((ref, orderId) async {
  final service = ref.watch(orderStatusServiceProvider);
  return await service.getCurrentOrderStatus(orderId);
});

/// 주문 진행률 계산 프로바이더
final orderProgressProvider = Provider.family<double, Order>((ref, order) {
  final service = ref.watch(orderStatusServiceProvider);
  return service.getOrderProgress(order);
});

/// 예상 완료 시간 계산 프로바이더
final estimatedCompletionTimeProvider = Provider.family<Duration, Order>((ref, order) {
  final service = ref.watch(orderStatusServiceProvider);
  return service.getEstimatedCompletionTime(order);
});

/// 주문 상태별 텍스트 변환 프로바이더
final orderStatusTextProvider = Provider.family<String, OrderStatus>((ref, status) {
  switch (status) {
    case OrderStatus.received:
      return '주문 접수';
    case OrderStatus.preparing:
      return '제작 중';
    case OrderStatus.ready:
      return '픽업 가능';
    case OrderStatus.completed:
      return '픽업 완료';
    case OrderStatus.cancelled:
      return '주문 취소';
  }
});

/// 주문 상태별 색상 프로바이더
final orderStatusColorProvider = Provider.family<String, OrderStatus>((ref, status) {
  switch (status) {
    case OrderStatus.received:
      return '#2196F3'; // 파란색
    case OrderStatus.preparing:
      return '#FF9800'; // 주황색
    case OrderStatus.ready:
      return '#4CAF50'; // 초록색
    case OrderStatus.completed:
      return '#9E9E9E'; // 회색
    case OrderStatus.cancelled:
      return '#F44336'; // 빨간색
  }
});