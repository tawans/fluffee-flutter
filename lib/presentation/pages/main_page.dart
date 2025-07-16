import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_colors.dart';
import 'cart/cart_page.dart';
import 'home/home_page.dart';
import 'menu/menu_page.dart';
import 'profile/profile_page.dart';
import 'store/store_locator_page.dart';

final currentIndexProvider = StateProvider<int>((ref) => 0);

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider);
    
    final pages = [
      const HomePage(),
      const MenuPage(),
      const StoreLocatorPage(),
      const CartPage(),
      const ProfilePage(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            ref.read(currentIndexProvider.notifier).state = index;
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.accent.withValues(alpha: 0.6),
          selectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: const TextStyle(fontSize: 12),
          items: [
            BottomNavigationBarItem(
              icon: _buildIcon(Icons.home_outlined, false),
              activeIcon: _buildIcon(Icons.home_rounded, true),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(Icons.coffee_outlined, false),
              activeIcon: _buildIcon(Icons.coffee, true),
              label: '메뉴',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(Icons.location_on_outlined, false),
              activeIcon: _buildIcon(Icons.location_on, true),
              label: '매장',
            ),
            BottomNavigationBarItem(
              icon: _buildCartIcon(ref, false),
              activeIcon: _buildCartIcon(ref, true),
              label: '장바구니',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(Icons.person_outline, false),
              activeIcon: _buildIcon(Icons.person, true),
              label: '마이페이지',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(IconData icon, bool isActive) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary.withValues(alpha: 0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(
        icon,
        size: 24,
        color: isActive ? AppColors.primary : AppColors.accent.withValues(alpha: 0.6),
      ),
    );
  }

  Widget _buildCartIcon(WidgetRef ref, bool isActive) {
    // TODO: 실제 장바구니 아이템 수 연동
    const cartItemCount = 2;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        _buildIcon(isActive ? Icons.shopping_cart : Icons.shopping_cart_outlined, isActive),
        if (cartItemCount > 0)
          Positioned(
            right: -4,
            top: -4,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.highlight,
                shape: BoxShape.circle,
              ),
              constraints: const BoxConstraints(
                minWidth: 18,
                minHeight: 18,
              ),
              child: Text(
                cartItemCount.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}