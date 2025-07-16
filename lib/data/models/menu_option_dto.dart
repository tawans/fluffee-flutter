import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/menu_option.dart';

part 'menu_option_dto.freezed.dart';
part 'menu_option_dto.g.dart';

@freezed
class MenuOptionDto with _$MenuOptionDto {
  const factory MenuOptionDto({
    required String id,
    @JsonKey(name: 'menu_id') required String menuId,
    @JsonKey(name: 'option_type') required String optionType,
    @JsonKey(name: 'option_value') required String optionValue,
    @JsonKey(name: 'extra_price') @Default(0) int extraPrice,
    @JsonKey(name: 'is_available') @Default(true) bool isAvailable,
    @JsonKey(name: 'sort_order') @Default(0) int sortOrder,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _MenuOptionDto;

  const MenuOptionDto._();

  factory MenuOptionDto.fromJson(Map<String, dynamic> json) => _$MenuOptionDtoFromJson(json);

  MenuOption toEntity() => MenuOption(
        id: id,
        menuId: menuId,
        optionType: _stringToOptionType(optionType),
        optionName: optionValue,
        priceAdjustment: extraPrice,
        isDefault: false,
        createdAt: createdAt,
      );

  OptionType _stringToOptionType(String type) {
    switch (type.toLowerCase()) {
      case 'size':
        return OptionType.size;
      case 'temperature':
        return OptionType.temperature;
      case 'extras':
        return OptionType.extras;
      default:
        return OptionType.extras;
    }
  }
}