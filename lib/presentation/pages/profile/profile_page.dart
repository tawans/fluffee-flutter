import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';

// 사용자 정보 상태 관리
final userProfileProvider = StateProvider<Map<String, dynamic>>((ref) => {
  'name': '홍길동',
  'email': 'user@example.com',
  'phone': '010-1234-5678',
  'totalOrders': 12,
  'favoriteStores': 3,
  'memberSince': '2024.01.15',
});

// 주문 내역 상태 관리
final orderHistoryProvider = StateProvider<List<Map<String, dynamic>>>((ref) => [
  {
    'id': 'ORD001',
    'date': '2024.01.20',
    'status': 'completed',
    'storeName': 'Fluffee 강남점',
    'items': ['알파카 라떼 x2', '카라멜 마키아토 x1'],
    'totalPrice': 18500,
  },
  {
    'id': 'ORD002',
    'date': '2024.01.18',
    'status': 'completed',
    'storeName': 'Fluffee 역삼점',
    'items': ['바닐라 라떼 x1', '초콜릿 머핀 x1'],
    'totalPrice': 12000,
  },
  {
    'id': 'ORD003',
    'date': '2024.01.15',
    'status': 'completed',
    'storeName': 'Fluffee 강남점',
    'items': ['아이스 아메리카노 x3'],
    'totalPrice': 10500,
  },
]);

// 즐겨찾는 매장 상태 관리
final favoriteStoresProvider = StateProvider<List<Map<String, dynamic>>>((ref) => [
  {
    'id': '1',
    'name': 'Fluffee 강남점',
    'address': '서울특별시 강남구 테헤란로 123',
    'distance': 0.3,
    'congestion': 'low',
  },
  {
    'id': '2',
    'name': 'Fluffee 역삼점',
    'address': '서울특별시 강남구 역삼동 456',
    'distance': 0.7,
    'congestion': 'medium',
  },
  {
    'id': '3',
    'name': 'Fluffee 선릉점',
    'address': '서울특별시 강남구 선릉로 789',
    'distance': 1.2,
    'congestion': 'high',
  },
]);

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfile = ref.watch(userProfileProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text(
          '마이페이지',
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: AppColors.primary),
            onPressed: () {
              _showSettingsDialog(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 프로필 정보 카드
            _buildProfileCard(userProfile),
            const SizedBox(height: 16),
            // 통계 카드
            _buildStatsCard(userProfile),
            const SizedBox(height: 24),
            // 메뉴 리스트
            _buildMenuSection(context, ref),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard(Map<String, dynamic> userProfile) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // 프로필 이미지
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    AppColors.primary,
                    AppColors.secondary,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Icon(
                Icons.person,
                size: 40,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            // 사용자 이름
            Text(
              userProfile['name'],
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 4),
            // 이메일
            Text(
              userProfile['email'],
              style: TextStyle(
                fontSize: 16,
                color: AppColors.accent.withValues(alpha: 0.8),
              ),
            ),
            const SizedBox(height: 16),
            // 가입일
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.secondary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '가입일: ${userProfile['memberSince']}',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.secondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsCard(Map<String, dynamic> userProfile) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
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
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: _buildStatItem(
                Icons.receipt_long,
                '총 주문',
                '${userProfile['totalOrders']}회',
                AppColors.primary,
              ),
            ),
            Container(
              width: 1,
              height: 40,
              color: AppColors.accent.withValues(alpha: 0.2),
            ),
            Expanded(
              child: _buildStatItem(
                Icons.favorite,
                '즐겨찾기',
                '${userProfile['favoriteStores']}개',
                AppColors.highlight,
              ),
            ),
            Container(
              width: 1,
              height: 40,
              color: AppColors.accent.withValues(alpha: 0.2),
            ),
            Expanded(
              child: _buildStatItem(
                Icons.local_cafe,
                '단골 메뉴',
                '알파카 라떼',
                AppColors.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String label, String value, Color color) {
    return Column(
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: AppColors.accent.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuSection(BuildContext context, WidgetRef ref) {
    final menuItems = [
      {
        'icon': Icons.receipt_long,
        'title': '주문 내역',
        'subtitle': '이전 주문을 확인하세요',
        'onTap': () => _showOrderHistory(context, ref),
      },
      {
        'icon': Icons.favorite,
        'title': '즐겨찾는 매장',
        'subtitle': '자주 방문하는 매장 관리',
        'onTap': () => _showFavoriteStores(context, ref),
      },
      {
        'icon': Icons.notifications,
        'title': '알림 설정',
        'subtitle': '주문 상태 알림 설정',
        'onTap': () => _showNotificationSettings(context),
      },
      {
        'icon': Icons.person_outline,
        'title': '개인정보 수정',
        'subtitle': '프로필 정보 변경',
        'onTap': () => _showProfileEdit(context, ref),
      },
      {
        'icon': Icons.help_outline,
        'title': '고객센터',
        'subtitle': '문의사항 및 도움말',
        'onTap': () => _showCustomerService(context),
      },
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
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
        children: [
          ...menuItems.map((item) => _buildMenuItem(
            item['icon'] as IconData,
            item['title'] as String,
            item['subtitle'] as String,
            item['onTap'] as VoidCallback,
          )),
          const Divider(height: 1),
          _buildMenuItem(
            Icons.logout,
            '로그아웃',
            '계정에서 로그아웃',
            () => _showLogoutDialog(context),
            isLogout: true,
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    IconData icon,
    String title,
    String subtitle,
    VoidCallback onTap, {
    bool isLogout = false,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isLogout 
              ? Colors.red.withValues(alpha: 0.1)
              : AppColors.primary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: isLogout ? Colors.red : AppColors.primary,
          size: 20,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: isLogout ? Colors.red : AppColors.primary,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 12,
          color: AppColors.accent.withValues(alpha: 0.7),
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: AppColors.accent.withValues(alpha: 0.5),
      ),
      onTap: onTap,
    );
  }

  void _showOrderHistory(BuildContext context, WidgetRef ref) {
    final orderHistory = ref.read(orderHistoryProvider);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.8,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.accent.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '주문 내역',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: orderHistory.length,
                itemBuilder: (context, index) {
                  final order = orderHistory[index];
                  return _buildOrderItem(order);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderItem(Map<String, dynamic> order) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.accent.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '주문번호: ${order['id']}',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              Text(
                order['date'],
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.accent.withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            order['storeName'],
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.accent,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            (order['items'] as List).join(', '),
            style: TextStyle(
              fontSize: 14,
              color: AppColors.accent.withValues(alpha: 0.8),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  '완료',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                '₩${order['totalPrice']}',
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

  void _showFavoriteStores(BuildContext context, WidgetRef ref) {
    final favoriteStores = ref.read(favoriteStoresProvider);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.8,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.accent.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '즐겨찾는 매장',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: favoriteStores.length,
                itemBuilder: (context, index) {
                  final store = favoriteStores[index];
                  return _buildFavoriteStoreItem(store, ref, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoriteStoreItem(Map<String, dynamic> store, WidgetRef ref, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.secondary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.store, color: AppColors.secondary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  store['name'],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  store['address'],
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.accent.withValues(alpha: 0.7),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${store['distance']}km',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.secondary,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.favorite, color: AppColors.highlight),
            onPressed: () {
              // 즐겨찾기 제거
              final updatedStores = [...ref.read(favoriteStoresProvider)];
              updatedStores.removeAt(index);
              ref.read(favoriteStoresProvider.notifier).state = updatedStores;
            },
          ),
        ],
      ),
    );
  }

  void _showNotificationSettings(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text('알림 설정', style: TextStyle(color: AppColors.primary)),
        content: const Text('알림 설정 기능은 추후 업데이트될 예정입니다.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('확인', style: TextStyle(color: AppColors.primary)),
          ),
        ],
      ),
    );
  }

  void _showProfileEdit(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text('개인정보 수정', style: TextStyle(color: AppColors.primary)),
        content: const Text('개인정보 수정 기능은 추후 업데이트될 예정입니다.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('확인', style: TextStyle(color: AppColors.primary)),
          ),
        ],
      ),
    );
  }

  void _showCustomerService(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text('고객센터', style: TextStyle(color: AppColors.primary)),
        content: const Text('고객센터: 1588-1234\n운영시간: 평일 09:00-18:00'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('확인', style: TextStyle(color: AppColors.primary)),
          ),
        ],
      ),
    );
  }

  void _showSettingsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text('설정', style: TextStyle(color: AppColors.primary)),
        content: const Text('앱 설정 기능은 추후 업데이트될 예정입니다.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('확인', style: TextStyle(color: AppColors.primary)),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text('로그아웃', style: TextStyle(color: AppColors.primary)),
        content: const Text('정말 로그아웃하시겠습니까?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('취소', style: TextStyle(color: AppColors.accent)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              context.go('/login');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('로그아웃', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}