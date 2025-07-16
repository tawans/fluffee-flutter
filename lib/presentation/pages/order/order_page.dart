import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../cart/cart_page.dart';

// 선택된 매장 상태 관리
final selectedStoreProvider = StateProvider<Map<String, dynamic>?>((ref) => {
  'id': '1',
  'name': 'Fluffee 강남점',
  'address': '서울특별시 강남구 테헤란로 123',
  'distance': 0.3,
});

// 결제 방법 상태 관리
final selectedPaymentProvider = StateProvider<String>((ref) => 'card');

class OrderPage extends ConsumerStatefulWidget {
  const OrderPage({super.key});

  @override
  ConsumerState<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends ConsumerState<OrderPage> {
  final TextEditingController _requestController = TextEditingController();

  @override
  void dispose() {
    _requestController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cartItems = ref.watch(cartItemsProvider);
    final selectedStore = ref.watch(selectedStoreProvider);
    final selectedPayment = ref.watch(selectedPaymentProvider);
    final totalPrice = _calculateTotalPrice(cartItems);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text(
          '주문하기',
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 픽업 매장 선택
            _buildStoreSelection(selectedStore),
            // 주문 내역
            _buildOrderSummary(cartItems),
            // 요청사항
            _buildRequestSection(),
            // 결제 방법
            _buildPaymentMethod(selectedPayment),
            // 결제 정보
            _buildPaymentSummary(totalPrice),
            const SizedBox(height: 100), // 하단 버튼 공간
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(context, totalPrice),
    );
  }

  Widget _buildStoreSelection(Map<String, dynamic>? selectedStore) {
    return Container(
      margin: const EdgeInsets.all(16),
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
            Row(
              children: [
                Icon(Icons.store, color: AppColors.primary),
                const SizedBox(width: 8),
                Text(
                  '픽업 매장',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    context.go('/storeLocator');
                  },
                  child: Text(
                    '변경',
                    style: TextStyle(
                      color: AppColors.secondary,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (selectedStore != null) ...[
              Text(
                selectedStore['name'],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.accent,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                selectedStore['address'],
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.accent.withValues(alpha: 0.7),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 16,
                    color: AppColors.secondary,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${selectedStore['distance']}km',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.secondary,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.green.withValues(alpha: 0.5)),
                    ),
                    child: const Text(
                      '영업중',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildOrderSummary(List<Map<String, dynamic>> cartItems) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
            Row(
              children: [
                Icon(Icons.receipt_outlined, color: AppColors.primary),
                const SizedBox(width: 8),
                Text(
                  '주문 내역',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                const Spacer(),
                Text(
                  '${cartItems.length}개 상품',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.accent.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...cartItems.map((item) => _buildOrderItem(item)),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderItem(Map<String, dynamic> item) {
    final totalItemPrice = (item['price'] + item['optionPrice']) * item['quantity'];

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['menuName'],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.accent,
                  ),
                ),
                if (item['options'] != null) ...[
                  const SizedBox(height: 4),
                  ...item['options'].entries.map((entry) {
                    return Text(
                      '${entry.key}: ${entry.value}',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.accent.withValues(alpha: 0.7),
                      ),
                    );
                  }).toList(),
                ],
              ],
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${item['quantity']}개',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.accent.withValues(alpha: 0.7),
                ),
              ),
              Text(
                '₩${totalItemPrice.toString()}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRequestSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
            Row(
              children: [
                Icon(Icons.edit_note, color: AppColors.primary),
                const SizedBox(width: 8),
                Text(
                  '요청사항',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _requestController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: '매장에 전달할 요청사항을 입력해주세요',
                hintStyle: TextStyle(
                  color: AppColors.accent.withValues(alpha: 0.5),
                ),
                filled: true,
                fillColor: AppColors.background,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: AppColors.accent.withValues(alpha: 0.2),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: AppColors.primary,
                    width: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethod(String selectedPayment) {
    final paymentMethods = [
      {'id': 'card', 'name': '신용/체크카드', 'icon': Icons.credit_card},
      {'id': 'kakao', 'name': '카카오페이', 'icon': Icons.account_balance_wallet},
      {'id': 'samsung', 'name': '삼성페이', 'icon': Icons.payment},
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
            Row(
              children: [
                Icon(Icons.payment, color: AppColors.primary),
                const SizedBox(width: 8),
                Text(
                  '결제 방법',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...paymentMethods.map((method) {
              final isSelected = selectedPayment == method['id'];
              return GestureDetector(
                onTap: () {
                  ref.read(selectedPaymentProvider.notifier).state = method['id'] as String;
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isSelected 
                        ? AppColors.primary.withValues(alpha: 0.1)
                        : AppColors.background,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected 
                          ? AppColors.primary
                          : AppColors.accent.withValues(alpha: 0.2),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        method['icon'] as IconData,
                        color: isSelected ? AppColors.primary : AppColors.accent,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        method['name'] as String,
                        style: TextStyle(
                          fontSize: 16,
                          color: isSelected ? AppColors.primary : AppColors.accent,
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                        ),
                      ),
                      const Spacer(),
                      if (isSelected)
                        Icon(Icons.check_circle, color: AppColors.primary),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentSummary(int totalPrice) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '상품금액',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.accent,
                  ),
                ),
                Text(
                  '₩${totalPrice.toString()}',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.accent,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '할인금액',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.accent,
                  ),
                ),
                Text(
                  '-₩0',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.accent,
                  ),
                ),
              ],
            ),
            const Divider(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '최종 결제금액',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
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
          ],
        ),
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
      child: ElevatedButton(
        onPressed: () {
          _processPayment(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          minimumSize: const Size(double.infinity, 0),
        ),
        child: Text(
          '₩${totalPrice.toString()} 결제하기',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  int _calculateTotalPrice(List<Map<String, dynamic>> cartItems) {
    return cartItems.fold(0, (total, item) {
      return total + ((item['price'] + item['optionPrice']) * item['quantity'] as int);
    });
  }

  void _processPayment(BuildContext context) {
    // 결제 처리 로직
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(color: AppColors.primary),
              const SizedBox(height: 16),
              Text(
                '결제 처리 중...',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.accent,
                ),
              ),
            ],
          ),
        );
      },
    );

    // 2초 후 주문 완료 처리
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.of(context).pop(); // 로딩 다이얼로그 닫기
        
        // 장바구니 비우기
        ref.read(cartItemsProvider.notifier).state = [];
        
        // 주문 추적 페이지로 이동
        context.go('/order/tracking/1');
      }
    });
  }
}