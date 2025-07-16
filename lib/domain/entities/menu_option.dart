import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_option.freezed.dart';

enum OptionType {
  size,
  temperature,
  extras,
}

@freezed
class MenuOption with _$MenuOption {
  const factory MenuOption({
    required String id,
    required String menuId,
    required OptionType optionType,
    required String optionName,
    @Default(0) int priceAdjustment,
    @Default(false) bool isDefault,
    required DateTime createdAt,
  }) = _MenuOption;

  const MenuOption._();

  String get formattedPrice {
    if (priceAdjustment == 0) return '';
    return priceAdjustment > 0 ? '+₩${priceAdjustment.toString()}' : '-₩${(-priceAdjustment).toString()}';
  }
}