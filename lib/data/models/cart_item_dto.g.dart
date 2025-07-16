// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartItemDtoImpl _$$CartItemDtoImplFromJson(Map<String, dynamic> json) =>
    _$CartItemDtoImpl(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      menuId: json['menu_id'] as String,
      menu: MenuDto.fromJson(json['menu'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num).toInt(),
      unitPrice: (json['unit_price'] as num).toInt(),
      totalPrice: (json['total_price'] as num).toInt(),
      selectedOptions: json['selected_options'] as Map<String, dynamic>?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$CartItemDtoImplToJson(_$CartItemDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'menu_id': instance.menuId,
      'menu': instance.menu,
      'quantity': instance.quantity,
      'unit_price': instance.unitPrice,
      'total_price': instance.totalPrice,
      'selected_options': instance.selectedOptions,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
