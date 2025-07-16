// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderDtoImpl _$$OrderDtoImplFromJson(Map<String, dynamic> json) =>
    _$OrderDtoImpl(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      storeId: json['store_id'] as String,
      store: StoreDto.fromJson(json['store'] as Map<String, dynamic>),
      orderNumber: json['order_number'] as String,
      status: json['status'] == null
          ? OrderStatus.received
          : _orderStatusFromJson(json['status'] as String),
      totalAmount: (json['total_amount'] as num).toInt(),
      pickupTime: json['pickup_time'] == null
          ? null
          : DateTime.parse(json['pickup_time'] as String),
      notes: json['notes'] as String?,
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => OrderItemDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$OrderDtoImplToJson(_$OrderDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'store_id': instance.storeId,
      'store': instance.store,
      'order_number': instance.orderNumber,
      'status': _orderStatusToJson(instance.status),
      'total_amount': instance.totalAmount,
      'pickup_time': instance.pickupTime?.toIso8601String(),
      'notes': instance.notes,
      'items': instance.items,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
