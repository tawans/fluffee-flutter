// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderItemDtoImpl _$$OrderItemDtoImplFromJson(Map<String, dynamic> json) =>
    _$OrderItemDtoImpl(
      id: json['id'] as String,
      orderId: json['order_id'] as String,
      menuId: json['menu_id'] as String,
      menu: MenuDto.fromJson(json['menu'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num).toInt(),
      unitPrice: (json['unit_price'] as num).toInt(),
      totalPrice: (json['total_price'] as num).toInt(),
      selectedOptions: json['selected_options'] as Map<String, dynamic>?,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$OrderItemDtoImplToJson(_$OrderItemDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_id': instance.orderId,
      'menu_id': instance.menuId,
      'menu': instance.menu,
      'quantity': instance.quantity,
      'unit_price': instance.unitPrice,
      'total_price': instance.totalPrice,
      'selected_options': instance.selectedOptions,
      'created_at': instance.createdAt.toIso8601String(),
    };
