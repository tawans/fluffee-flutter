import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/services/store_search_service.dart';
import '../../../domain/entities/store.dart';
import '../../providers/location_provider.dart';

// 뷰 모드 상태 관리
final isMapViewProvider = StateProvider<bool>((ref) => false);

// 선택된 혼잡도 필터
final selectedCongestionProvider = StateProvider<CongestionLevel?>((ref) => null);

// 검색 텍스트 상태 관리
final searchTextProvider = StateProvider<String>((ref) => '');

class StoreLocatorPage extends ConsumerStatefulWidget {
  const StoreLocatorPage({super.key});

  @override
  ConsumerState<StoreLocatorPage> createState() => _StoreLocatorPageState();
}

class _StoreLocatorPageState extends ConsumerState<StoreLocatorPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMapView = ref.watch(isMapViewProvider);
    final selectedCongestion = ref.watch(selectedCongestionProvider);
    final searchText = ref.watch(searchTextProvider);
    final currentLocation = ref.watch(currentLocationProvider);
    
    // 검색 매개변수 생성
    final searchParams = StoreSearchParams(
      userLocation: currentLocation.valueOrNull,
      filter: StoreSearchFilter(
        maxCongestion: selectedCongestion,
        searchQuery: searchText.isEmpty ? null : searchText,
        openOnly: true,
      ),
      sortBy: StoreSortOption.distance,
    );
    
    final nearbyStores = ref.watch(nearbyStoresProvider(searchParams));

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text(
          '매장 찾기',
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              isMapView ? Icons.list : Icons.map,
              color: AppColors.primary,
            ),
            onPressed: () {
              ref.read(isMapViewProvider.notifier).state = !isMapView;
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // 검색바
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                ref.read(searchTextProvider.notifier).state = value;
              },
              decoration: InputDecoration(
                hintText: '매장명 또는 주소 검색',
                prefixIcon: Icon(Icons.search, color: AppColors.accent),
                suffixIcon: IconButton(
                  icon: Icon(Icons.my_location, color: AppColors.primary),
                  onPressed: () async {
                    // 현재 위치로 검색
                    _searchController.clear();
                    ref.read(searchTextProvider.notifier).state = '';
                    ref.invalidate(currentLocationProvider);
                  },
                ),
                filled: true,
                fillColor: Colors.white,
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
          ),
          // 혼잡도 필터
          _buildCongestionFilter(),
          const SizedBox(height: 8),
          // 매장 목록 또는 지도
          Expanded(
            child: nearbyStores.when(
              data: (stores) => isMapView 
                  ? _buildMapView(stores) 
                  : _buildListView(stores),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => _buildErrorView(error),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCongestionFilter() {
    final selectedCongestion = ref.watch(selectedCongestionProvider);
    
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildFilterChip(
            label: '전체',
            isSelected: selectedCongestion == null,
            onTap: () {
              ref.read(selectedCongestionProvider.notifier).state = null;
            },
          ),
          const SizedBox(width: 8),
          _buildFilterChip(
            label: '여유',
            isSelected: selectedCongestion == CongestionLevel.low,
            color: Colors.green,
            onTap: () {
              ref.read(selectedCongestionProvider.notifier).state = 
                  selectedCongestion == CongestionLevel.low ? null : CongestionLevel.low;
            },
          ),
          const SizedBox(width: 8),
          _buildFilterChip(
            label: '보통',
            isSelected: selectedCongestion == CongestionLevel.medium,
            color: Colors.orange,
            onTap: () {
              ref.read(selectedCongestionProvider.notifier).state = 
                  selectedCongestion == CongestionLevel.medium ? null : CongestionLevel.medium;
            },
          ),
          const SizedBox(width: 8),
          _buildFilterChip(
            label: '혼잡',
            isSelected: selectedCongestion == CongestionLevel.high,
            color: Colors.red,
            onTap: () {
              ref.read(selectedCongestionProvider.notifier).state = 
                  selectedCongestion == CongestionLevel.high ? null : CongestionLevel.high;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip({
    required String label,
    required bool isSelected,
    Color? color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected 
              ? (color ?? AppColors.primary)
              : Colors.white,
          border: Border.all(
            color: isSelected
                ? (color ?? AppColors.primary)
                : AppColors.accent.withValues(alpha: 0.3),
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.accent,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildErrorView(Object error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: AppColors.accent.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 16),
          Text(
            '매장 정보를 불러올 수 없습니다',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.accent,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            error.toString(),
            style: TextStyle(
              fontSize: 12,
              color: AppColors.accent.withValues(alpha: 0.7),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              ref.invalidate(nearbyStoresProvider);
            },
            child: const Text('다시 시도'),
          ),
        ],
      ),
    );
  }

  Widget _buildMapView(List<StoreWithDistance> stores) {
    return Stack(
      children: [
        // 지도 플레이스홀더
        Container(
          color: AppColors.secondary.withValues(alpha: 0.1),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.map,
                  size: 80,
                  color: AppColors.secondary.withValues(alpha: 0.5),
                ),
                const SizedBox(height: 16),
                Text(
                  '지도 뷰',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.secondary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Google Maps 연동 예정',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.accent,
                  ),
                ),
              ],
            ),
          ),
        ),
        // 하단 매장 정보 카드
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: stores.length,
              itemBuilder: (context, index) {
                final storeWithDistance = stores[index];
                return Container(
                  width: 280,
                  margin: const EdgeInsets.only(right: 12),
                  child: _buildStoreCard(storeWithDistance, compact: true),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildListView(List<StoreWithDistance> stores) {
    if (stores.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.store_outlined,
              size: 64,
              color: AppColors.accent.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 16),
            Text(
              '검색 결과가 없습니다',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.accent,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: stores.length,
      itemBuilder: (context, index) {
        final storeWithDistance = stores[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _buildStoreCard(storeWithDistance),
        );
      },
    );
  }

  Widget _buildStoreCard(StoreWithDistance storeWithDistance, {bool compact = false}) {
    final store = storeWithDistance.store;
    
    return GestureDetector(
      onTap: () {
        context.go('/storeLocator/detail/${store.id}');
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // 매장명과 즐겨찾기
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      store.name,
                      style: TextStyle(
                        fontSize: compact ? 16 : 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      store.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: store.isFavorite ? AppColors.highlight : AppColors.accent,
                      size: compact ? 20 : 24,
                    ),
                    onPressed: () {
                      // TODO: 즐겨찾기 토글
                    },
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
              if (!compact) const SizedBox(height: 8),
              // 주소
              if (!compact)
                Text(
                  store.address,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.accent,
                  ),
                ),
              const SizedBox(height: 8),
              // 거리, 영업시간, 혼잡도
              Row(
                children: [
                  // 거리
                  Icon(
                    Icons.location_on_outlined,
                    size: 16,
                    color: AppColors.secondary,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    storeWithDistance.formattedDistance,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.secondary,
                    ),
                  ),
                  const SizedBox(width: 16),
                  // 영업시간
                  Icon(
                    Icons.access_time,
                    size: 16,
                    color: AppColors.secondary,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    store.operatingHours ?? '정보없음',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.secondary,
                    ),
                  ),
                  const Spacer(),
                  // 혼잡도
                  _buildCongestionBadge(store.congestionLevel),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCongestionBadge(CongestionLevel congestion) {
    Color color;
    String label;

    switch (congestion) {
      case CongestionLevel.low:
        color = Colors.green;
        label = '여유';
        break;
      case CongestionLevel.medium:
        color = Colors.orange;
        label = '보통';
        break;
      case CongestionLevel.high:
        color = Colors.red;
        label = '혼잡';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.5)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}