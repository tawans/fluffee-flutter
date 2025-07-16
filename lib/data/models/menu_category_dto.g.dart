// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MenuCategoryDtoImpl _$$MenuCategoryDtoImplFromJson(
  Map<String, dynamic> json,
) => _$MenuCategoryDtoImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  nameEn: json['name_en'] as String?,
  description: json['description'] as String?,
  imageUrl: json['image_url'] as String?,
  sortOrder: (json['sort_order'] as num?)?.toInt() ?? 0,
  isActive: json['is_active'] as bool? ?? true,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$$MenuCategoryDtoImplToJson(
  _$MenuCategoryDtoImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'name_en': instance.nameEn,
  'description': instance.description,
  'image_url': instance.imageUrl,
  'sort_order': instance.sortOrder,
  'is_active': instance.isActive,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};
