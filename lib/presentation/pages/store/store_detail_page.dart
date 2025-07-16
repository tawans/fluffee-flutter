import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';

// 즐겨찾기 상태 관리
final isFavoriteProvider = StateProvider.family<bool, String>((ref, storeId) => false);

class StoreDetailPage extends ConsumerStatefulWidget {
  final String storeId;

  const StoreDetailPage({super.key, required this.storeId});

  @override
  ConsumerState<StoreDetailPage> createState() => _StoreDetailPageState();
}

class _StoreDetailPageState extends ConsumerState<StoreDetailPage> {
  // 임시 매장 데이터
  Map<String, dynamic> get storeData => {
    'id': widget.storeId,
    'name': 'Fluffee 강남점',
    'address': '서울특별시 강남구 테헤란로 123',
    'phone': '02-1234-5678',
    'hours': {
      'weekday': '07:00 - 22:00',
      'weekend': '08:00 - 21:00',
    },
    'congestion': 'medium',
    'description': '강남역 3번 출구에서 도보 5분 거리에 위치한 Fluffee 강남점입니다. 넓고 쾌적한 공간에서 편안하게 커피를 즐기실 수 있습니다.',
    'facilities': ['주차 가능', 'Wi-Fi', '노트북 좌석', '단체석', '반려동물 동반'],
    'images': [],
    'distance': 0.3,
  };

  @override
  Widget build(BuildContext context) {
    final isFavorite = ref.watch(isFavoriteProvider(widget.storeId));

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          // 앱바 및 이미지
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: AppColors.background,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: AppColors.primary),
              onPressed: () => context.pop(),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? AppColors.highlight : AppColors.primary,
                ),
                onPressed: () {
                  ref.read(isFavoriteProvider(widget.storeId).notifier).state = !isFavorite;
                },
              ),
              IconButton(
                icon: Icon(Icons.share, color: AppColors.primary),
                onPressed: () {
                  // TODO: 공유 기능
                },
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // 매장 이미지 플레이스홀더
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.primary.withValues(alpha: 0.3),
                          AppColors.secondary.withValues(alpha: 0.3),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.store,
                        size: 100,
                        color: AppColors.primary.withValues(alpha: 0.5),
                      ),
                    ),
                  ),
                  // 그라데이션 오버레이
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    height: 100,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withValues(alpha: 0.7),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // 매장명
                  Positioned(
                    bottom: 16,
                    left: 16,
                    right: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          storeData['name'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 16,
                              color: Colors.white.withValues(alpha: 0.9),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${storeData['distance']}km',
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.9),
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 16),
                            _buildCongestionBadge(storeData['congestion'], light: true),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // 매장 정보
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 기본 정보 카드
                  _buildInfoCard(),
                  const SizedBox(height: 16),
                  // 설명
                  _buildDescriptionSection(),
                  const SizedBox(height: 16),
                  // 편의시설
                  _buildFacilitiesSection(),
                  const SizedBox(height: 16),
                  // 영업시간
                  _buildBusinessHoursSection(),
                  const SizedBox(height: 24),
                  // 주문하기 버튼
                  _buildOrderButton(context),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard() {
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildInfoRow(
              Icons.location_on_outlined,
              storeData['address'],
              onTap: () {
                // TODO: 지도 앱 연동
              },
            ),
            const Divider(height: 24),
            _buildInfoRow(
              Icons.phone_outlined,
              storeData['phone'],
              onTap: () {
                // TODO: 전화 걸기
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          children: [
            Icon(icon, size: 20, color: AppColors.secondary),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  color: AppColors.accent,
                  fontSize: 14,
                ),
              ),
            ),
            if (onTap != null)
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: AppColors.accent.withValues(alpha: 0.5),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDescriptionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '매장 소개',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          storeData['description'],
          style: TextStyle(
            fontSize: 14,
            color: AppColors.accent,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildFacilitiesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '편의시설',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: (storeData['facilities'] as List<String>).map((facility) {
            IconData icon;
            switch (facility) {
              case '주차 가능':
                icon = Icons.local_parking;
                break;
              case 'Wi-Fi':
                icon = Icons.wifi;
                break;
              case '노트북 좌석':
                icon = Icons.laptop_mac;
                break;
              case '단체석':
                icon = Icons.groups;
                break;
              case '반려동물 동반':
                icon = Icons.pets;
                break;
              default:
                icon = Icons.check_circle_outline;
            }

            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.secondary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppColors.secondary.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, size: 16, color: AppColors.secondary),
                  const SizedBox(width: 4),
                  Text(
                    facility,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.secondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildBusinessHoursSection() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.access_time, size: 20, color: AppColors.primary),
              const SizedBox(width: 8),
              Text(
                '영업시간',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  '영업중',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildHoursRow('평일', storeData['hours']['weekday']),
          const SizedBox(height: 4),
          _buildHoursRow('주말', storeData['hours']['weekend']),
        ],
      ),
    );
  }

  Widget _buildHoursRow(String label, String hours) {
    return Row(
      children: [
        SizedBox(
          width: 40,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.accent,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Text(
          hours,
          style: TextStyle(
            fontSize: 14,
            color: AppColors.primary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildOrderButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // 주문 페이지로 이동하며 매장 정보 전달
        context.go('/order', extra: {'storeId': widget.storeId, 'storeName': storeData['name']});
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
        '이 매장에서 주문하기',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildCongestionBadge(String congestion, {bool light = false}) {
    Color color;
    String label;

    switch (congestion) {
      case 'low':
        color = Colors.green;
        label = '여유';
        break;
      case 'medium':
        color = Colors.orange;
        label = '보통';
        break;
      case 'high':
        color = Colors.red;
        label = '혼잡';
        break;
      default:
        color = Colors.grey;
        label = '정보없음';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: light ? color.withValues(alpha: 0.2) : color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: light ? color.withValues(alpha: 0.8) : color.withValues(alpha: 0.5),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          color: light ? Colors.white : color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}