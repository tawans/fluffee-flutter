// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoreDtoImpl _$$StoreDtoImplFromJson(Map<String, dynamic> json) =>
    _$StoreDtoImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      detailedAddress: json['detailed_address'] as String?,
      phone: json['phone'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      openingHours: json['opening_hours'] as String,
      isOpen: json['is_open'] as bool? ?? true,
      isActive: json['is_active'] as bool? ?? true,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$StoreDtoImplToJson(_$StoreDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'detailed_address': instance.detailedAddress,
      'phone': instance.phone,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'opening_hours': instance.openingHours,
      'is_open': instance.isOpen,
      'is_active': instance.isActive,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
