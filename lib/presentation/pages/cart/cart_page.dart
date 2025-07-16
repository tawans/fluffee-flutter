import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';

// 장바구니 상태 관리
final cartItemsProvider = StateProvider<List<Map<String, dynamic>>>((ref) => [
  {
    'id': '1',
    'menuName': '알파카 라떼',
    'price': 5500,
    'quantity': 2,
    'options': {
      '사이즈': 'Large',
      '온도': 'HOT',
      '샷 추가': '1샷 추가',
      '시럽': '바닐라 시럽',
    },
    'optionPrice': 1000,
  },
  {
    'id': '2',
    'menuName': '카라멜 마키아토',
    'price': 6000,
    'quantity': 1,
    'options': {
      '사이즈': 'Regular',
      '온도': 'ICED',
      '샷 추가': '샷 추가 안함',
      '시럽': '시럽 추가 안함',
    },
    'optionPrice': 0,
  },
]);

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartItemsProvider);
    final totalPrice = _calculateTotalPrice(cartItems);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text(
          '장바구니',
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        actions: [
          if (cartItems.isNotEmpty)
            TextButton(
              onPressed: () {
                _showClearCartDialog(context, ref);
              },
              child: Text(
                '전체삭제',
                style: TextStyle(
                  color: AppColors.accent,
                  fontSize: 14,
                ),
              ),
            ),
        ],
      ),
      body: cartItems.isEmpty ? _buildEmptyCart(context) : _buildCartList(context, ref, cartItems),
      bottomNavigationBar: cartItems.isNotEmpty 
          ? _buildBottomBar(context, totalPrice)
          : null,
    );
  }

  Widget _buildEmptyCart(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 80,
            color: AppColors.accent.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 16),
          Text(
            '장바구니가 비어있습니다',
            style: TextStyle(
              fontSize: 18,
              color: AppColors.accent,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '맛있는 메뉴를 담아보세요!',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.accent.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              // 메뉴 탭으로 이동
              context.go('/menu');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              '메뉴 보러가기',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartList(BuildContext context, WidgetRef ref, List<Map<String, dynamic>> cartItems) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        final item = cartItems[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: _buildCartItem(context, ref, item, index),
        );
      },
    );
  }

  Widget _buildCartItem(BuildContext context, WidgetRef ref, Map<String, dynamic> item, int index) {
    final totalItemPrice = (item['price'] + item['optionPrice']) * item['quantity'];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 메뉴명과 삭제 버튼
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    item['menuName'],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.close,
                    color: AppColors.accent.withValues(alpha: 0.5),
                    size: 20,
                  ),
                  onPressed: () {
                    _removeItem(ref, index);
                  },
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // 옵션 정보
            if (item['options'] != null)
              _buildOptionsDisplay(item['options']),
            const SizedBox(height: 12),
            // 가격과 수량 조절
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '개당 ₩${(item['price'] + item['optionPrice']).toString()}',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.accent.withValues(alpha: 0.7),
                      ),
                    ),
                    Text(
                      '총 ₩${totalItemPrice.toString()}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                _buildQuantityControl(ref, item, index),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionsDisplay(Map<String, dynamic> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: options.entries.map((entry) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Row(
            children: [
              Text(
                '${entry.key}:',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.accent.withValues(alpha: 0.7),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.secondary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  entry.value.toString(),
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.secondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildQuantityControl(WidgetRef ref, Map<String, dynamic> item, int index) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.accent.withValues(alpha: 0.3),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: item['quantity'] > 1
                ? () {
                    _updateQuantity(ref, index, item['quantity'] - 1);
                  }
                : null,
            icon: Icon(
              Icons.remove,
              color: item['quantity'] > 1
                  ? AppColors.primary
                  : AppColors.accent.withValues(alpha: 0.3),
              size: 20,
            ),
            constraints: const BoxConstraints(
              minWidth: 36,
              minHeight: 36,
            ),
          ),
          Container(
            constraints: const BoxConstraints(minWidth: 30),
            child: Text(
              item['quantity'].toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              _updateQuantity(ref, index, item['quantity'] + 1);
            },
            icon: Icon(
              Icons.add,
              color: AppColors.primary,
              size: 20,
            ),
            constraints: const BoxConstraints(
              minWidth: 36,
              minHeight: 36,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context, int totalPrice) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 주문 요약
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '총 주문금액',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.accent,
                  ),
                ),
                Text(
                  '₩${totalPrice.toString()}',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // 주문하기 버튼
          ElevatedButton(
            onPressed: () {
              context.go('/order');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              minimumSize: const Size(double.infinity, 0),
            ),
            child: const Text(
              '주문하기',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  int _calculateTotalPrice(List<Map<String, dynamic>> cartItems) {
    return cartItems.fold(0, (total, item) {
      return total + ((item['price'] + item['optionPrice']) * item['quantity'] as int);
    });
  }

  void _updateQuantity(WidgetRef ref, int index, int newQuantity) {
    final cartItems = ref.read(cartItemsProvider);
    final updatedItems = [...cartItems];
    updatedItems[index]['quantity'] = newQuantity;
    ref.read(cartItemsProvider.notifier).state = updatedItems;
  }

  void _removeItem(WidgetRef ref, int index) {
    final cartItems = ref.read(cartItemsProvider);
    final updatedItems = [...cartItems];
    updatedItems.removeAt(index);
    ref.read(cartItemsProvider.notifier).state = updatedItems;
  }

  void _showClearCartDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            '장바구니 비우기',
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            '장바구니의 모든 상품을 삭제하시겠습니까?',
            style: TextStyle(
              color: AppColors.accent,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                '취소',
                style: TextStyle(
                  color: AppColors.accent,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(cartItemsProvider.notifier).state = [];
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.highlight,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                '삭제',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}