import 'package:freezed_annotation/freezed_annotation.dart';

import 'order_item.dart';
import 'store.dart';

part 'order.freezed.dart';

enum OrderStatus {
  received,
  preparing,
  ready,
  completed,
  cancelled,
}

@freezed
class Order with _$Order {
  const factory Order({
    required String id,
    required String userId,
    required String storeId,
    required Store store,
    required String orderNumber,
    @Default(OrderStatus.received) OrderStatus status,
    required int totalAmount,
    DateTime? pickupTime,
    String? notes,
    @Default([]) List<OrderItem> items,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Order;

  const Order._();

  String get statusText {
    switch (status) {
      case OrderStatus.received:
        return '주문 접수';
      case OrderStatus.preparing:
        return '제작 중';
      case OrderStatus.ready:
        return '픽업 가능';
      case OrderStatus.completed:
        return '완료';
      case OrderStatus.cancelled:
        return '취소';
    }
  }
  
  String get formattedTotalAmount {
    return '₩${totalAmount.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}';
  }
  
  String get formattedPickupTime {
    if (pickupTime == null) return '';
    return '${pickupTime!.hour.toString().padLeft(2, '0')}:${pickupTime!.minute.toString().padLeft(2, '0')}';
  }
  
  String get formattedCreatedAt {
    return '${createdAt.year}.${createdAt.month.toString().padLeft(2, '0')}.${createdAt.day.toString().padLeft(2, '0')} ${createdAt.hour.toString().padLeft(2, '0')}:${createdAt.minute.toString().padLeft(2, '0')}';
  }
  
  int get totalItemCount {
    return items.fold(0, (sum, item) => sum + item.quantity);
  }
  
  bool get canCancel {
    return status == OrderStatus.received || status == OrderStatus.preparing;
  }
  
  bool get isCompleted {
    return status == OrderStatus.completed || status == OrderStatus.cancelled;
  }
  
  Duration get estimatedWaitTime {
    switch (status) {
      case OrderStatus.received:
        return const Duration(minutes: 10);
      case OrderStatus.preparing:
        return const Duration(minutes: 5);
      case OrderStatus.ready:
        return Duration.zero;
      case OrderStatus.completed:
      case OrderStatus.cancelled:
        return Duration.zero;
    }
  }
}