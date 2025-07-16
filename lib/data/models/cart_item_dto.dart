import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/cart_item.dart';
import 'menu_dto.dart';

part 'cart_item_dto.freezed.dart';
part 'cart_item_dto.g.dart';

@freezed
class CartItemDto with _$CartItemDto {
  const factory CartItemDto({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'menu_id') required String menuId,
    required MenuDto menu,
    required int quantity,
    @JsonKey(name: 'unit_price') required int unitPrice,
    @JsonKey(name: 'total_price') required int totalPrice,
    @JsonKey(name: 'selected_options') Map<String, dynamic>? selectedOptions,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _CartItemDto;

  const CartItemDto._();

  factory CartItemDto.fromJson(Map<String, dynamic> json) => _$CartItemDtoFromJson(json);

  CartItem toEntity() => CartItem(
        id: id,
        userId: userId,
        menuId: menuId,
        menu: menu.toEntity(),
        quantity: quantity,
        unitPrice: unitPrice,
        totalPrice: totalPrice,
        selectedOptions: selectedOptions,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}