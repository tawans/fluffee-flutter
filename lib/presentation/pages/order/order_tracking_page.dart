import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../domain/entities/order.dart';
import '../../../domain/entities/store.dart';
import '../../providers/order_status_provider.dart';

// 샘플 주문 정보 (실제로는 서버에서 가져와야 함)
final sampleOrderProvider = StateProvider.family<Map<String, dynamic>, String>((ref, orderId) => {
  'id': orderId,
  'items': [
    {
      'name': '알파카 라떼',
      'quantity': 2,
      'options': ['Large', 'HOT', '1샷 추가', '바닐라 시럽'],
    },
    {
      'name': '카라멜 마키아토',
      'quantity': 1,
      'options': ['Regular', 'ICED'],
    },
  ],
  'store': {
    'name': 'Fluffee 강남점',
    'address': '서울특별시 강남구 테헤란로 123',
    'phone': '02-1234-5678',
  },
  'totalPrice': 18500,
  'orderTime': DateTime.now().subtract(const Duration(minutes: 2)),
});

class OrderTrackingPage extends ConsumerStatefulWidget {
  final String orderId;

  const OrderTrackingPage({super.key, required this.orderId});

  @override
  ConsumerState<OrderTrackingPage> createState() => _OrderTrackingPageState();
}

class _OrderTrackingPageState extends ConsumerState<OrderTrackingPage> {
  @override
  Widget build(BuildContext context) {
    final sampleOrder = ref.watch(sampleOrderProvider(widget.orderId));
    final orderStatusStream = ref.watch(orderStatusStreamProvider(widget.orderId));
    
    return orderStatusStream.when(
      data: (orderStatus) => _buildContent(context, sampleOrder, orderStatus),
      loading: () => _buildLoadingContent(context),
      error: (error, stack) => _buildErrorContent(context, error),
    );
  }

  Widget _buildLoadingContent(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildErrorContent(BuildContext context, Object error) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('주문 정보를 불러올 수 없습니다: $error'),
            ElevatedButton(
              onPressed: () => context.go('/home'),
              child: const Text('홈으로 돌아가기'),
            ),
          ],
        ),
      ),
    );
  }

  // 샘플 주문 데이터를 Order 엔티티로 변환하는 헬퍼 메서드
  Order _createSampleOrder(Map<String, dynamic> sampleOrder, OrderStatus status) {
    return Order(
      id: sampleOrder['id'],
      userId: 'sample-user',
      storeId: 'sample-store',
      store: Store(
        id: 'sample-store',
        name: sampleOrder['store']['name'],
        address: sampleOrder['store']['address'],
        phone: sampleOrder['store']['phone'],
        operatingHours: '09:00-22:00',
        latitude: 37.5665,
        longitude: 126.9780,
        congestionLevel: CongestionLevel.low,
        isOpen: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      orderNumber: 'ORD-${sampleOrder['id']}',
      status: status,
      totalAmount: sampleOrder['totalPrice'],
      items: [],
      createdAt: sampleOrder['orderTime'],
      updatedAt: DateTime.now(),
    );
  }

  Widget _buildContent(BuildContext context, Map<String, dynamic> sampleOrder, OrderStatus orderStatus) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // 주문 상태 카드
              _buildStatusCard(sampleOrder, orderStatus),
              const SizedBox(height: 24),
              // 매장 정보
              _buildStoreInfo(sampleOrder['store']),
              const SizedBox(height: 24),
              // 주문 내역
              _buildOrderSummary(sampleOrder),
              const SizedBox(height: 24),
              // 액션 버튼들
              _buildActionButtons(orderStatus),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      title: Text(
        '주문 추적',
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
      actions: [
        IconButton(
          icon: Icon(Icons.home, color: AppColors.primary),
          onPressed: () {
            context.go('/home');
          },
        ),
      ],
    );
  }

  Widget _buildStatusCard(Map<String, dynamic> sampleOrder, OrderStatus orderStatus) {
    final statusText = ref.watch(orderStatusTextProvider(orderStatus));
    final progress = ref.watch(orderProgressProvider(_createSampleOrder(sampleOrder, orderStatus)));
    final estimatedTime = ref.watch(estimatedCompletionTimeProvider(_createSampleOrder(sampleOrder, orderStatus))).inMinutes;

    return Container(
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
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // 상태 아이콘과 텍스트
            _buildStatusIcon(orderStatus),
            const SizedBox(height: 20),
            Text(
              statusText,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '주문번호: #${sampleOrder['id']}',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.accent.withValues(alpha: 0.8),
              ),
            ),
            const SizedBox(height: 24),
            // 진행 바
            _buildProgressBar(progress),
            const SizedBox(height: 16),
            // 상태 단계
            _buildStatusSteps(orderStatus),
            const SizedBox(height: 20),
            // 예상 시간
            if (estimatedTime > 0)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.secondary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.access_time, size: 20, color: AppColors.secondary),
                    const SizedBox(width: 8),
                    Text(
                      '예상 완료 시간: $estimatedTime분',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.secondary,
                      ),
                    ),
                  ],
                ),
              )
            else if (orderStatus == OrderStatus.ready)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.check_circle, size: 20, color: Colors.green),
                    const SizedBox(width: 8),
                    const Text(
                      '픽업 가능합니다!',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusIcon(OrderStatus status) {
    IconData icon;
    Color color;

    switch (status) {
      case OrderStatus.received:
        icon = Icons.receipt_long;
        color = Colors.blue;
        break;
      case OrderStatus.preparing:
        icon = Icons.coffee_maker;
        color = Colors.orange;
        break;
      case OrderStatus.ready:
        icon = Icons.coffee;
        color = Colors.green;
        break;
      case OrderStatus.completed:
      case OrderStatus.cancelled:
        icon = Icons.check_circle;
        color = AppColors.primary;
    }

    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        size: 40,
        color: color,
      ),
    );
  }


  Widget _buildProgressBar(double progress) {
    return Column(
      children: [
        LinearProgressIndicator(
          value: progress,
          minHeight: 8,
          backgroundColor: AppColors.accent.withValues(alpha: 0.2),
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
          borderRadius: BorderRadius.circular(4),
        ),
        const SizedBox(height: 8),
        Text(
          '${(progress * 100).toInt()}% 완료',
          style: TextStyle(
            fontSize: 14,
            color: AppColors.accent.withValues(alpha: 0.8),
          ),
        ),
      ],
    );
  }

  Widget _buildStatusSteps(OrderStatus currentStatus) {
    final steps = [
      {'id': OrderStatus.received, 'label': '주문접수', 'icon': Icons.receipt_long},
      {'id': OrderStatus.preparing, 'label': '제작중', 'icon': Icons.coffee_maker},
      {'id': OrderStatus.ready, 'label': '픽업가능', 'icon': Icons.coffee},
    ];

    final currentIndex = steps.indexWhere((step) => step['id'] == currentStatus);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: steps.asMap().entries.map((entry) {
        final index = entry.key;
        final step = entry.value;
        final isActive = index <= currentIndex;
        final isCurrent = index == currentIndex;

        return Column(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isActive ? AppColors.primary : AppColors.accent.withValues(alpha: 0.2),
                shape: BoxShape.circle,
                border: isCurrent 
                    ? Border.all(color: AppColors.primary, width: 3)
                    : null,
              ),
              child: Icon(
                step['icon'] as IconData,
                size: 20,
                color: isActive ? Colors.white : AppColors.accent.withValues(alpha: 0.5),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              step['label'] as String,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
                color: isActive ? AppColors.primary : AppColors.accent.withValues(alpha: 0.5),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildStoreInfo(Map<String, dynamic> store) {
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
              ],
            ),
            const SizedBox(height: 12),
            Text(
              store['name'],
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.accent,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              store['address'],
              style: TextStyle(
                fontSize: 14,
                color: AppColors.accent.withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // TODO: 전화 걸기
                    },
                    icon: const Icon(Icons.phone, size: 18),
                    label: const Text('매장 전화'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      // TODO: 지도 보기
                    },
                    icon: const Icon(Icons.map, size: 18),
                    label: const Text('지도 보기'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.secondary,
                      side: BorderSide(color: AppColors.secondary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderSummary(Map<String, dynamic> sampleOrder) {
    final items = sampleOrder['items'] as List;
    final totalPrice = sampleOrder['totalPrice'] as int;

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
              ],
            ),
            const SizedBox(height: 16),
            ...items.map((item) => _buildOrderItem(item)),
            const Divider(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '총 결제금액',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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
          ],
        ),
      ),
    );
  }

  Widget _buildOrderItem(Map<String, dynamic> item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['name'],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.accent,
                  ),
                ),
                if (item['options'] != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    (item['options'] as List).join(', '),
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.accent.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ],
            ),
          ),
          Text(
            '${item['quantity']}개',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(OrderStatus orderStatus) {
    return Column(
      children: [
        if (orderStatus == OrderStatus.ready)
          ElevatedButton(
            onPressed: () {
              _completePickup();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              minimumSize: const Size(double.infinity, 0),
            ),
            child: const Text(
              '픽업 완료',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          )
        else
          ElevatedButton(
            onPressed: () {
              _refreshStatus();
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
              '상태 새로고침',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        const SizedBox(height: 12),
        OutlinedButton(
          onPressed: () {
            context.go('/home');
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.accent,
            side: BorderSide(color: AppColors.accent.withValues(alpha: 0.3)),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            minimumSize: const Size(double.infinity, 0),
          ),
          child: const Text(
            '홈으로 돌아가기',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  void _refreshStatus() {
    // TODO: 실제 서버에서 상태 조회
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('상태를 새로고침했습니다'),
        backgroundColor: AppColors.primary,
      ),
    );
  }

  void _completePickup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            '픽업 완료',
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text('주문이 완료되었습니다.\nFluffee를 이용해 주셔서 감사합니다!'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                context.go('/home');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                '확인',
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