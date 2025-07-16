import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';

// 선택된 옵션들을 관리하는 Provider
final selectedOptionsProvider = StateProvider<Map<String, String>>((ref) => {});
final quantityProvider = StateProvider<int>((ref) => 1);

class MenuDetailPage extends ConsumerStatefulWidget {
  final String menuId;

  const MenuDetailPage({
    super.key,
    required this.menuId,
  });

  @override
  ConsumerState<MenuDetailPage> createState() => _MenuDetailPageState();
}

class _MenuDetailPageState extends ConsumerState<MenuDetailPage> {
  // 임시 메뉴 데이터
  final Map<String, dynamic> menuData = {
    'id': '1',
    'name': '알파카 라떼',
    'description': 'Fluffee 시그니처 스페셜티 커피. 안데스의 구름처럼 포근한 알파카에서 영감을 받은 부드러운 라떼입니다.',
    'price': 5500,
    'calories': 250,
    'category': '커피',
    'imageUrl': null,
    'isPopular': true,
    'options': [
      {
        'type': '사이즈',
        'required': true,
        'items': [
          {'name': 'Regular', 'price': 0},
          {'name': 'Large', 'price': 500},
        ],
      },
      {
        'type': '온도',
        'required': true,
        'items': [
          {'name': 'HOT', 'price': 0},
          {'name': 'ICED', 'price': 0},
        ],
      },
      {
        'type': '샷 추가',
        'required': false,
        'items': [
          {'name': '샷 추가 안함', 'price': 0},
          {'name': '1샷 추가', 'price': 500},
          {'name': '2샷 추가', 'price': 1000},
        ],
      },
      {
        'type': '시럽',
        'required': false,
        'items': [
          {'name': '시럽 추가 안함', 'price': 0},
          {'name': '바닐라 시럽', 'price': 500},
          {'name': '헤이즐넛 시럽', 'price': 500},
          {'name': '카라멜 시럽', 'price': 500},
        ],
      },
    ],
  };

  @override
  void initState() {
    super.initState();
    // 필수 옵션들의 기본값 설정
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final defaultOptions = <String, String>{};
      for (final option in menuData['options']) {
        if (option['required'] == true) {
          defaultOptions[option['type']] = option['items'][0]['name'];
        }
      }
      ref.read(selectedOptionsProvider.notifier).state = defaultOptions;
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedOptions = ref.watch(selectedOptionsProvider);
    final quantity = ref.watch(quantityProvider);
    final totalPrice = _calculateTotalPrice(selectedOptions, quantity);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          // 앱바 및 이미지
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: AppColors.background,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: AppColors.primary),
              onPressed: () => context.pop(),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primary.withValues(alpha: 0.2),
                      AppColors.secondary.withValues(alpha: 0.2),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Icon(
                        Icons.local_cafe,
                        size: 120,
                        color: AppColors.primary.withValues(alpha: 0.5),
                      ),
                    ),
                    if (menuData['isPopular'] == true)
                      Positioned(
                        top: 60,
                        right: 16,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.highlight,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'BEST',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          // 메뉴 정보 및 옵션
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 메뉴 이름 및 가격
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          menuData['name'],
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                      Text(
                        '₩${menuData['price'].toString()}',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.accent,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // 설명
                  Text(
                    menuData['description'],
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.accent,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // 칼로리 정보
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.secondary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${menuData['calories']} kcal',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.secondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // 옵션 선택
                  ...menuData['options'].map<Widget>((option) {
                    return _buildOptionSection(
                      option['type'],
                      option['items'],
                      option['required'],
                    );
                  }).toList(),
                  const SizedBox(height: 24),
                  // 수량 선택
                  _buildQuantitySelector(),
                  const SizedBox(height: 100), // 하단 버튼 공간
                ],
              ),
            ),
          ),
        ],
      ),
      // 하단 장바구니 담기 버튼
      bottomNavigationBar: Container(
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
        child: Row(
          children: [
            // 총 가격
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '총 금액',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.accent,
                    ),
                  ),
                  Text(
                    '₩${totalPrice.toString()}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
            // 장바구니 담기 버튼
            Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: () {
                  _addToCart();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  '장바구니 담기',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionSection(String optionType, List<dynamic> items, bool required) {
    final selectedOptions = ref.watch(selectedOptionsProvider);
    final selectedOption = selectedOptions[optionType];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 옵션 타이틀
        Row(
          children: [
            Text(
              optionType,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            if (required)
              Container(
                margin: const EdgeInsets.only(left: 8),
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: AppColors.highlight,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  '필수',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 12),
        // 옵션 아이템들
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: items.map<Widget>((item) {
            final isSelected = selectedOption == item['name'];
            return GestureDetector(
              onTap: () {
                ref.read(selectedOptionsProvider.notifier).update((state) {
                  return {...state, optionType: item['name']};
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : Colors.white,
                  border: Border.all(
                    color: isSelected
                        ? AppColors.primary
                        : AppColors.accent.withValues(alpha: 0.3),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      item['name'],
                      style: TextStyle(
                        color: isSelected ? Colors.white : AppColors.accent,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    if (item['price'] > 0) ...[
                      const SizedBox(width: 4),
                      Text(
                        '+${item['price']}원',
                        style: TextStyle(
                          fontSize: 12,
                          color: isSelected
                              ? Colors.white.withValues(alpha: 0.9)
                              : AppColors.accent.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildQuantitySelector() {
    final quantity = ref.watch(quantityProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '수량',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.accent.withValues(alpha: 0.3),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: quantity > 1
                    ? () {
                        ref.read(quantityProvider.notifier).state--;
                      }
                    : null,
                icon: Icon(
                  Icons.remove,
                  color: quantity > 1
                      ? AppColors.primary
                      : AppColors.accent.withValues(alpha: 0.3),
                ),
                constraints: const BoxConstraints(
                  minWidth: 40,
                  minHeight: 40,
                ),
              ),
              Container(
                constraints: const BoxConstraints(minWidth: 50),
                child: Text(
                  quantity.toString(),
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
                  ref.read(quantityProvider.notifier).state++;
                },
                icon: Icon(
                  Icons.add,
                  color: AppColors.primary,
                ),
                constraints: const BoxConstraints(
                  minWidth: 40,
                  minHeight: 40,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  int _calculateTotalPrice(Map<String, String> selectedOptions, int quantity) {
    int basePrice = menuData['price'];
    int optionPrice = 0;

    // 선택된 옵션들의 추가 가격 계산
    for (final option in menuData['options']) {
      final selectedValue = selectedOptions[option['type']];
      if (selectedValue != null) {
        final selectedItem = option['items'].firstWhere(
          (item) => item['name'] == selectedValue,
          orElse: () => {'price': 0},
        );
        optionPrice += selectedItem['price'] as int;
      }
    }

    return (basePrice + optionPrice) * quantity;
  }

  void _addToCart() {
    // TODO: 실제 장바구니 추가 로직
    final quantity = ref.read(quantityProvider);
    // final selectedOptions = ref.read(selectedOptionsProvider);

    // 장바구니 추가 완료 스낵바
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${menuData['name']} $quantity개가 장바구니에 담겼습니다'),
        backgroundColor: AppColors.primary,
        action: SnackBarAction(
          label: '장바구니 보기',
          textColor: Colors.white,
          onPressed: () {
            // 메인 페이지의 장바구니 탭으로 이동
            context.go('/home');
            // TODO: 장바구니 탭 인덱스로 변경
          },
        ),
      ),
    );

    // 페이지 닫기
    context.pop();
  }
}