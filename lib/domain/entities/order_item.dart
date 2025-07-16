import 'package:freezed_annotation/freezed_annotation.dart';

import 'menu.dart';

part 'order_item.freezed.dart';

@freezed
class OrderItem with _$OrderItem {
  const factory OrderItem({
    required String id,
    required String orderId,
    required String menuId,
    required Menu menu,
    required int quantity,
    required int unitPrice,
    required int totalPrice,
    Map<String, dynamic>? selectedOptions,
    required DateTime createdAt,
  }) = _OrderItem;

  const OrderItem._();

  String get formattedUnitPrice {
    return '₩${unitPrice.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}';
  }
  
  String get formattedTotalPrice {
    return '₩${totalPrice.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}';
  }
  
  String getSelectedOptionText(String optionType) {
    if (selectedOptions == null) return '';
    return selectedOptions![optionType] ?? '';
  }
  
  String get optionsSummary {
    if (selectedOptions == null || selectedOptions!.isEmpty) return '';
    
    final options = selectedOptions!.entries
        .where((entry) => entry.value != null && entry.value.toString().isNotEmpty)
        .map((entry) => entry.value.toString())
        .join(', ');
    
    return options.isNotEmpty ? '($options)' : '';
  }
}