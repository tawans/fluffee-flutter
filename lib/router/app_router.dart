import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../presentation/pages/auth/login_page.dart';
import '../presentation/pages/auth/register_page.dart';
import '../presentation/pages/cart/cart_page.dart';
import '../presentation/pages/home/home_page.dart';
import '../presentation/pages/menu/menu_detail_page.dart';
import '../presentation/pages/menu/menu_page.dart';
import '../presentation/pages/order/order_page.dart';
import '../presentation/pages/order/order_tracking_page.dart';
import '../presentation/pages/profile/profile_page.dart';
import '../presentation/pages/splash/splash_page.dart';
import '../presentation/pages/store/store_detail_page.dart';
import '../presentation/pages/store/store_locator_page.dart';
import 'routes.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  return GoRouter(
    initialLocation: Routes.splash,
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: Routes.login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: Routes.register,
        builder: (context, state) => const RegisterPage(),
      ),
      ShellRoute(
        builder: (context, state, child) => MainNavigationShell(child: child),
        routes: [
          GoRoute(
            path: Routes.home,
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            path: Routes.menu,
            builder: (context, state) => const MenuPage(),
            routes: [
              GoRoute(
                path: 'detail/:id',
                builder: (context, state) {
                  final menuId = state.pathParameters['id']!;
                  return MenuDetailPage(menuId: menuId);
                },
              ),
            ],
          ),
          GoRoute(
            path: Routes.storeLocator,
            builder: (context, state) => const StoreLocatorPage(),
            routes: [
              GoRoute(
                path: 'detail/:id',
                builder: (context, state) {
                  final storeId = state.pathParameters['id']!;
                  return StoreDetailPage(storeId: storeId);
                },
              ),
            ],
          ),
          GoRoute(
            path: Routes.cart,
            builder: (context, state) => const CartPage(),
          ),
          GoRoute(
            path: Routes.profile,
            builder: (context, state) => const ProfilePage(),
          ),
        ],
      ),
      GoRoute(
        path: Routes.order,
        builder: (context, state) => const OrderPage(),
      ),
      GoRoute(
        path: Routes.orderTracking,
        builder: (context, state) {
          final orderId = state.pathParameters['id']!;
          return OrderTrackingPage(orderId: orderId);
        },
      ),
    ],
  );
}

class MainNavigationShell extends StatefulWidget {
  final Widget child;
  
  const MainNavigationShell({
    super.key,
    required this.child,
  });

  @override
  State<MainNavigationShell> createState() => _MainNavigationShellState();
}

class _MainNavigationShellState extends State<MainNavigationShell> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    
    switch (index) {
      case 0:
        context.go(Routes.home);
        break;
      case 1:
        context.go(Routes.menu);
        break;
      case 2:
        context.go(Routes.storeLocator);
        break;
      case 3:
        context.go(Routes.cart);
        break;
      case 4:
        context.go(Routes.profile);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.coffee),
            label: '메뉴',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: '매장',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: '장바구니',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '마이',
          ),
        ],
      ),
    );
  }
}