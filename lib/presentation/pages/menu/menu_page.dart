import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';

class MenuPage extends ConsumerStatefulWidget {
  const MenuPage({super.key});

  @override
  ConsumerState<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends ConsumerState<MenuPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Map<String, dynamic>> categories = [
    {'name': '커피', 'icon': Icons.local_cafe},
    {'name': '티', 'icon': Icons.emoji_food_beverage},
    {'name': '스무디', 'icon': Icons.local_drink},
    {'name': '디저트', 'icon': Icons.cake},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categories.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text(
          '메뉴',
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: AppColors.accent),
            onPressed: () {
              // TODO: 검색 기능
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.accent.withValues(alpha: 0.2),
                  width: 1,
                ),
              ),
            ),
            child: TabBar(
              controller: _tabController,
              indicatorColor: AppColors.primary,
              indicatorWeight: 3,
              labelColor: AppColors.primary,
              unselectedLabelColor: AppColors.accent,
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
              tabs: categories.map((category) => Tab(
                text: category['name'],
                icon: Icon(category['icon'], size: 20),
              )).toList(),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: categories.map((category) => 
          _buildMenuGrid(context, category['name']),
        ).toList(),
      ),
    );
  }

  Widget _buildMenuGrid(BuildContext context, String category) {
    // 임시 메뉴 데이터
    final sampleMenus = _getSampleMenus(category);

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: sampleMenus.length,
      itemBuilder: (context, index) {
        final menu = sampleMenus[index];
        return GestureDetector(
          onTap: () {
            context.go('/menu/detail/${index + 1}');
          },
          child: Container(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.primary.withValues(alpha: 0.1),
                          AppColors.secondary.withValues(alpha: 0.1),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Icon(
                            menu['icon'],
                            size: 60,
                            color: AppColors.primary.withValues(alpha: 0.7),
                          ),
                        ),
                        if (menu['isPopular'] == true)
                          Positioned(
                            top: 8,
                            right: 8,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.highlight,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text(
                                'BEST',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        menu['name'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        menu['description'],
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.accent,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            menu['price'],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.accent,
                            ),
                          ),
                          Icon(
                            Icons.add_circle_outline,
                            color: AppColors.primary,
                            size: 24,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<Map<String, dynamic>> _getSampleMenus(String category) {
    switch (category) {
      case '커피':
        return [
          {
            'name': '아메리카노',
            'description': '진한 에스프레소와 물의 조화',
            'price': '₩4,000',
            'icon': Icons.local_cafe,
            'isPopular': true,
          },
          {
            'name': '카페라떼',
            'description': '부드러운 우유와 에스프레소',
            'price': '₩4,500',
            'icon': Icons.coffee,
            'isPopular': true,
          },
          {
            'name': '카푸치노',
            'description': '풍성한 우유 거품과 커피',
            'price': '₩4,500',
            'icon': Icons.local_cafe,
          },
          {
            'name': '플랫화이트',
            'description': '진한 커피와 벨벳 우유',
            'price': '₩5,000',
            'icon': Icons.coffee,
          },
          {
            'name': '알파카 라떼',
            'description': 'Fluffee 시그니처 스페셜티',
            'price': '₩5,500',
            'icon': Icons.local_cafe,
            'isPopular': true,
          },
          {
            'name': '바닐라 라떼',
            'description': '달콤한 바닐라 시럽 추가',
            'price': '₩5,000',
            'icon': Icons.coffee,
          },
        ];
      case '티':
        return [
          {
            'name': '얼그레이',
            'description': '베르가못 향의 홍차',
            'price': '₩3,500',
            'icon': Icons.emoji_food_beverage,
          },
          {
            'name': '카모마일',
            'description': '편안한 휴식을 위한 허브티',
            'price': '₩3,500',
            'icon': Icons.local_drink,
          },
          {
            'name': '그린티 라떼',
            'description': '진한 말차와 부드러운 우유',
            'price': '₩5,000',
            'icon': Icons.emoji_food_beverage,
            'isPopular': true,
          },
        ];
      case '스무디':
        return [
          {
            'name': '망고 스무디',
            'description': '달콤한 망고의 시원한 맛',
            'price': '₩5,500',
            'icon': Icons.local_drink,
            'isPopular': true,
          },
          {
            'name': '딸기 스무디',
            'description': '상큼한 딸기의 풍미',
            'price': '₩5,500',
            'icon': Icons.local_bar,
          },
          {
            'name': '블루베리 요거트',
            'description': '건강한 요거트 스무디',
            'price': '₩6,000',
            'icon': Icons.local_drink,
          },
        ];
      case '디저트':
        return [
          {
            'name': '티라미수',
            'description': '부드러운 마스카포네 케이크',
            'price': '₩6,000',
            'icon': Icons.cake,
            'isPopular': true,
          },
          {
            'name': '크로플',
            'description': '바삭한 크로와상 와플',
            'price': '₩5,000',
            'icon': Icons.bakery_dining,
          },
          {
            'name': '마카롱 세트',
            'description': '3가지 맛 마카롱',
            'price': '₩7,000',
            'icon': Icons.cookie,
          },
        ];
      default:
        return [];
    }
  }
}