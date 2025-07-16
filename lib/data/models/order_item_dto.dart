import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/order_item.dart';
import 'menu_dto.dart';

part 'order_item_dto.freezed.dart';
part 'order_item_dto.g.dart';

@freezed
class OrderItemDto with _$OrderItemDto {
  const factory OrderItemDto({
    required String id,
    @JsonKey(name: 'order_id') required String orderId,
    @JsonKey(name: 'menu_id') required String menuId,
    required MenuDto menu,
    required int quantity,
    @JsonKey(name: 'unit_price') required int unitPrice,
    @JsonKey(name: 'total_price') required int totalPrice,
    @JsonKey(name: 'selected_options') Map<String, dynamic>? selectedOptions,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _OrderItemDto;

  const OrderItemDto._();

  factory OrderItemDto.fromJson(Map<String, dynamic> json) => _$OrderItemDtoFromJson(json);

  OrderItem toEntity() => OrderItem(
        id: id,
        orderId: orderId,
        menuId: menuId,
        menu: menu.toEntity(),
        quantity: quantity,
        unitPrice: unitPrice,
        totalPrice: totalPrice,
        selectedOptions: selectedOptions,
        createdAt: createdAt,
      );
}