import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/order.dart';
import 'order_item_dto.dart';
import 'store_dto.dart';

part 'order_dto.freezed.dart';
part 'order_dto.g.dart';

@freezed
class OrderDto with _$OrderDto {
  const factory OrderDto({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'store_id') required String storeId,
    required StoreDto store,
    @JsonKey(name: 'order_number') required String orderNumber,
    @JsonKey(name: 'status', fromJson: _orderStatusFromJson, toJson: _orderStatusToJson)
    @Default(OrderStatus.received) OrderStatus status,
    @JsonKey(name: 'total_amount') required int totalAmount,
    @JsonKey(name: 'pickup_time') DateTime? pickupTime,
    String? notes,
    @Default([]) List<OrderItemDto> items,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _OrderDto;

  const OrderDto._();

  factory OrderDto.fromJson(Map<String, dynamic> json) => _$OrderDtoFromJson(json);

  Order toEntity() => Order(
        id: id,
        userId: userId,
        storeId: storeId,
        store: store.toEntity(),
        orderNumber: orderNumber,
        status: status,
        totalAmount: totalAmount,
        pickupTime: pickupTime,
        notes: notes,
        items: items.map((dto) => dto.toEntity()).toList(),
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}

OrderStatus _orderStatusFromJson(String status) {
  switch (status) {
    case 'received':
      return OrderStatus.received;
    case 'preparing':
      return OrderStatus.preparing;
    case 'ready':
      return OrderStatus.ready;
    case 'completed':
      return OrderStatus.completed;
    case 'cancelled':
      return OrderStatus.cancelled;
    default:
      return OrderStatus.received;
  }
}

String _orderStatusToJson(OrderStatus status) {
  return status.name;
}