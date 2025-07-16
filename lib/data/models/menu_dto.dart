import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/menu.dart';
import 'menu_option_dto.dart';

part 'menu_dto.freezed.dart';
part 'menu_dto.g.dart';

@freezed
class MenuDto with _$MenuDto {
  const factory MenuDto({
    required String id,
    @JsonKey(name: 'category_id') required String categoryId,
    required String name,
    @JsonKey(name: 'name_en') String? nameEn,
    String? description,
    required int price,
    int? calories,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'is_popular') @Default(false) bool isPopular,
    @JsonKey(name: 'is_recommended') @Default(false) bool isRecommended,
    @JsonKey(name: 'is_available') @Default(true) bool isAvailable,
    @JsonKey(name: 'sort_order') @Default(0) int sortOrder,
    @Default([]) List<MenuOptionDto> options,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _MenuDto;

  const MenuDto._();

  factory MenuDto.fromJson(Map<String, dynamic> json) => _$MenuDtoFromJson(json);

  Menu toEntity() => Menu(
        id: id,
        categoryId: categoryId,
        name: name,
        nameEn: nameEn,
        description: description,
        price: price,
        calories: calories,
        imageUrl: imageUrl,
        isPopular: isPopular,
        isRecommended: isRecommended,
        isAvailable: isAvailable,
        sortOrder: sortOrder,
        options: options.map((dto) => dto.toEntity()).toList(),
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}