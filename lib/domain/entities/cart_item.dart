import 'package:freezed_annotation/freezed_annotation.dart';

import 'menu.dart';

part 'cart_item.freezed.dart';

@freezed
class CartItem with _$CartItem {
  const factory CartItem({
    required String id,
    required String userId,
    required String menuId,
    required Menu menu,
    @Default(1) int quantity,
    required int unitPrice,
    required int totalPrice,
    Map<String, dynamic>? selectedOptions,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _CartItem;

  const CartItem._();

  int get calculatedUnitPrice {
    int basePrice = menu.price;
    
    if (selectedOptions == null) return basePrice;
    
    // 선택된 옵션들의 추가 요금 계산
    int optionPrice = 0;
    for (final option in menu.options) {
      final selectedValue = selectedOptions![option.optionType.toString()];
      if (selectedValue == option.optionName) {
        optionPrice += option.priceAdjustment;
      }
    }
    
    return basePrice + optionPrice;
  }

  int get calculatedTotalPrice {
    return calculatedUnitPrice * quantity;
  }
  
  String get formattedTotalPrice {
    return '₩${totalPrice.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}';
  }
  
  String getSelectedOptionText(String optionType) {
    if (selectedOptions == null) return '';
    return selectedOptions![optionType] ?? '';
  }
}