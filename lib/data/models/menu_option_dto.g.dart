// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_option_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MenuOptionDtoImpl _$$MenuOptionDtoImplFromJson(Map<String, dynamic> json) =>
    _$MenuOptionDtoImpl(
      id: json['id'] as String,
      menuId: json['menu_id'] as String,
      optionType: json['option_type'] as String,
      optionValue: json['option_value'] as String,
      extraPrice: (json['extra_price'] as num?)?.toInt() ?? 0,
      isAvailable: json['is_available'] as bool? ?? true,
      sortOrder: (json['sort_order'] as num?)?.toInt() ?? 0,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$MenuOptionDtoImplToJson(_$MenuOptionDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'menu_id': instance.menuId,
      'option_type': instance.optionType,
      'option_value': instance.optionValue,
      'extra_price': instance.extraPrice,
      'is_available': instance.isAvailable,
      'sort_order': instance.sortOrder,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
