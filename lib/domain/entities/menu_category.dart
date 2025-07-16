import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_category.freezed.dart';

@freezed
class MenuCategory with _$MenuCategory {
  const factory MenuCategory({
    required String id,
    required String name,
    String? nameEn,
    String? description,
    String? imageUrl,
    @Default(0) int sortOrder,
    @Default(true) bool isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _MenuCategory;

  const MenuCategory._();

  String get displayName => nameEn ?? name;
}