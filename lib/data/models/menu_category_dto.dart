import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/menu_category.dart';

part 'menu_category_dto.freezed.dart';
part 'menu_category_dto.g.dart';

@freezed
class MenuCategoryDto with _$MenuCategoryDto {
  const factory MenuCategoryDto({
    required String id,
    required String name,
    @JsonKey(name: 'name_en') String? nameEn,
    String? description,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'sort_order') @Default(0) int sortOrder,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _MenuCategoryDto;

  const MenuCategoryDto._();

  factory MenuCategoryDto.fromJson(Map<String, dynamic> json) => _$MenuCategoryDtoFromJson(json);

  MenuCategory toEntity() => MenuCategory(
        id: id,
        name: name,
        nameEn: nameEn,
        description: description,
        imageUrl: imageUrl,
        sortOrder: sortOrder,
        isActive: isActive,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}