import 'package:freezed_annotation/freezed_annotation.dart';

import 'menu_option.dart';

part 'menu.freezed.dart';

@freezed
class Menu with _$Menu {
  const factory Menu({
    required String id,
    required String categoryId,
    required String name,
    String? nameEn,
    String? description,
    required int price,
    int? calories,
    String? imageUrl,
    @Default(false) bool isPopular,
    @Default(false) bool isRecommended,
    @Default(true) bool isAvailable,
    @Default(0) int sortOrder,
    @Default([]) List<MenuOption> options,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Menu;

  const Menu._();

  String get displayName => nameEn ?? name;
  
  String get formattedPrice => '₩${price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}';
  
  String? get formattedCalories => calories != null ? '${calories}kcal' : null;
  
  bool get hasImage => imageUrl != null && imageUrl!.isNotEmpty;
  
  List<MenuOption> optionsByType(OptionType type) {
    return options.where((option) => option.optionType == type).toList();
  }
  
  MenuOption? get defaultOption {
    return options.where((option) => option.isDefault).firstOrNull;
  }
}