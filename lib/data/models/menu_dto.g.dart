// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MenuDtoImpl _$$MenuDtoImplFromJson(Map<String, dynamic> json) =>
    _$MenuDtoImpl(
      id: json['id'] as String,
      categoryId: json['category_id'] as String,
      name: json['name'] as String,
      nameEn: json['name_en'] as String?,
      description: json['description'] as String?,
      price: (json['price'] as num).toInt(),
      calories: (json['calories'] as num?)?.toInt(),
      imageUrl: json['image_url'] as String?,
      isPopular: json['is_popular'] as bool? ?? false,
      isRecommended: json['is_recommended'] as bool? ?? false,
      isAvailable: json['is_available'] as bool? ?? true,
      sortOrder: (json['sort_order'] as num?)?.toInt() ?? 0,
      options:
          (json['options'] as List<dynamic>?)
              ?.map((e) => MenuOptionDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$MenuDtoImplToJson(_$MenuDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_id': instance.categoryId,
      'name': instance.name,
      'name_en': instance.nameEn,
      'description': instance.description,
      'price': instance.price,
      'calories': instance.calories,
      'image_url': instance.imageUrl,
      'is_popular': instance.isPopular,
      'is_recommended': instance.isRecommended,
      'is_available': instance.isAvailable,
      'sort_order': instance.sortOrder,
      'options': instance.options,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
