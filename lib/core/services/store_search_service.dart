import 'package:dartz/dartz.dart';

import '../../domain/entities/store.dart';
import '../../domain/repositories/store_repository.dart';
import '../errors/failures.dart';
import 'location_service.dart';

/// 매장 검색 필터
class StoreSearchFilter {
  final double? maxDistance; // 최대 거리 (km)
  final CongestionLevel? maxCongestion; // 최대 혼잡도
  final bool? openOnly; // 영업중인 매장만
  final String? searchQuery; // 검색어 (매장명, 주소)

  const StoreSearchFilter({
    this.maxDistance,
    this.maxCongestion,
    this.openOnly,
    this.searchQuery,
  });

  StoreSearchFilter copyWith({
    double? maxDistance,
    CongestionLevel? maxCongestion,
    bool? openOnly,
    String? searchQuery,
  }) {
    return StoreSearchFilter(
      maxDistance: maxDistance ?? this.maxDistance,
      maxCongestion: maxCongestion ?? this.maxCongestion,
      openOnly: openOnly ?? this.openOnly,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}

/// 거리 정보가 포함된 매장 데이터
class StoreWithDistance {
  final Store store;
  final double distanceInKm;
  final String formattedDistance;

  StoreWithDistance({
    required this.store,
    required this.distanceInKm,
    required this.formattedDistance,
  });

  @override
  String toString() {
    return 'StoreWithDistance(${store.name}, $formattedDistance)';
  }
}

/// 매장 검색 결과 정렬 옵션
enum StoreSortOption {
  distance, // 거리순 (가까운 순)
  name, // 이름순 (가나다순)
  congestion, // 혼잡도순 (낮은 순)
}

/// 위치 기반 매장 검색 서비스
class StoreSearchService {
  final StoreRepository _storeRepository;
  final LocationService _locationService;

  StoreSearchService(this._storeRepository, this._locationService);

  /// 현재 위치 기반 근처 매장 검색
  Future<Either<Failure, List<StoreWithDistance>>> searchNearbyStores({
    LocationData? userLocation,
    StoreSearchFilter? filter,
    StoreSortOption sortBy = StoreSortOption.distance,
  }) async {
    try {
      // 사용자 위치 가져오기
      LocationData currentLocation;
      if (userLocation != null) {
        currentLocation = userLocation;
      } else {
        final locationResult = await _locationService.getCurrentLocation();
        currentLocation = locationResult.fold(
          (failure) => _locationService.getDefaultLocation(),
          (location) => location,
        );
      }

      // 모든 매장 가져오기
      final storesResult = await _storeRepository.getAllStores();
      
      return storesResult.fold(
        (failure) => Left(failure),
        (stores) {
          // 거리 계산 및 필터링
          List<StoreWithDistance> storesWithDistance = stores
              .map((store) {
                final distance = _locationService.calculateDistance(
                  currentLocation.latitude,
                  currentLocation.longitude,
                  store.latitude,
                  store.longitude,
                );
                
                return StoreWithDistance(
                  store: store,
                  distanceInKm: distance,
                  formattedDistance: _locationService.formatDistance(distance),
                );
              })
              .where((storeWithDistance) => _applyFilter(storeWithDistance, filter))
              .toList();

          // 정렬
          _sortStores(storesWithDistance, sortBy);

          return Right(storesWithDistance);
        },
      );
    } catch (e) {
      return Left(Failure.unknown('매장 검색 중 오류가 발생했습니다: $e'));
    }
  }

  /// 특정 위치 기반 매장 검색
  Future<Either<Failure, List<StoreWithDistance>>> searchStoresAroundLocation({
    required double latitude,
    required double longitude,
    StoreSearchFilter? filter,
    StoreSortOption sortBy = StoreSortOption.distance,
  }) async {
    final customLocation = LocationData(
      latitude: latitude,
      longitude: longitude,
      timestamp: DateTime.now(),
    );

    return searchNearbyStores(
      userLocation: customLocation,
      filter: filter,
      sortBy: sortBy,
    );
  }

  /// 텍스트 기반 매장 검색
  Future<Either<Failure, List<StoreWithDistance>>> searchStoresByText({
    required String searchQuery,
    LocationData? userLocation,
    StoreSortOption sortBy = StoreSortOption.distance,
  }) async {
    final filter = StoreSearchFilter(searchQuery: searchQuery);
    
    return searchNearbyStores(
      userLocation: userLocation,
      filter: filter,
      sortBy: sortBy,
    );
  }

  /// 가장 가까운 매장 찾기
  Future<Either<Failure, StoreWithDistance?>> findNearestStore({
    LocationData? userLocation,
    StoreSearchFilter? filter,
  }) async {
    final result = await searchNearbyStores(
      userLocation: userLocation,
      filter: filter,
      sortBy: StoreSortOption.distance,
    );

    return result.fold(
      (failure) => Left(failure),
      (stores) => Right(stores.isNotEmpty ? stores.first : null),
    );
  }

  /// 혼잡도가 낮은 근처 매장들 찾기
  Future<Either<Failure, List<StoreWithDistance>>> findLowCongestionStores({
    LocationData? userLocation,
    double? maxDistance,
  }) async {
    final filter = StoreSearchFilter(
      maxCongestion: CongestionLevel.medium,
      maxDistance: maxDistance,
      openOnly: true,
    );

    return searchNearbyStores(
      userLocation: userLocation,
      filter: filter,
      sortBy: StoreSortOption.congestion,
    );
  }

  /// 영업 중인 근처 매장들 찾기
  Future<Either<Failure, List<StoreWithDistance>>> findOpenStores({
    LocationData? userLocation,
    double? maxDistance,
  }) async {
    final filter = StoreSearchFilter(
      openOnly: true,
      maxDistance: maxDistance,
    );

    return searchNearbyStores(
      userLocation: userLocation,
      filter: filter,
      sortBy: StoreSortOption.distance,
    );
  }

  /// 필터 적용
  bool _applyFilter(StoreWithDistance storeWithDistance, StoreSearchFilter? filter) {
    if (filter == null) return true;

    final store = storeWithDistance.store;
    final distance = storeWithDistance.distanceInKm;

    // 최대 거리 필터
    if (filter.maxDistance != null && distance > filter.maxDistance!) {
      return false;
    }

    // 혼잡도 필터
    if (filter.maxCongestion != null) {
      final congestionIndex = CongestionLevel.values.indexOf(store.congestionLevel);
      final maxCongestionIndex = CongestionLevel.values.indexOf(filter.maxCongestion!);
      if (congestionIndex > maxCongestionIndex) {
        return false;
      }
    }

    // 영업 중 필터
    if (filter.openOnly == true && !store.isOpen) {
      return false;
    }

    // 검색어 필터
    if (filter.searchQuery != null && filter.searchQuery!.isNotEmpty) {
      final query = filter.searchQuery!.toLowerCase();
      final storeName = store.name.toLowerCase();
      final storeAddress = store.address.toLowerCase();
      
      if (!storeName.contains(query) && !storeAddress.contains(query)) {
        return false;
      }
    }

    return true;
  }

  /// 매장 리스트 정렬
  void _sortStores(List<StoreWithDistance> stores, StoreSortOption sortBy) {
    switch (sortBy) {
      case StoreSortOption.distance:
        stores.sort((a, b) => a.distanceInKm.compareTo(b.distanceInKm));
        break;
      case StoreSortOption.name:
        stores.sort((a, b) => a.store.name.compareTo(b.store.name));
        break;
      case StoreSortOption.congestion:
        stores.sort((a, b) {
          final aIndex = CongestionLevel.values.indexOf(a.store.congestionLevel);
          final bIndex = CongestionLevel.values.indexOf(b.store.congestionLevel);
          return aIndex.compareTo(bIndex);
        });
        break;
    }
  }

  /// 매장 그룹화 (거리별)
  Map<String, List<StoreWithDistance>> groupStoresByDistance(
    List<StoreWithDistance> stores,
  ) {
    final Map<String, List<StoreWithDistance>> grouped = {
      '500m 이내': [],
      '1km 이내': [],
      '3km 이내': [],
      '5km 이상': [],
    };

    for (final store in stores) {
      final distance = store.distanceInKm;
      if (distance <= 0.5) {
        grouped['500m 이내']!.add(store);
      } else if (distance <= 1.0) {
        grouped['1km 이내']!.add(store);
      } else if (distance <= 3.0) {
        grouped['3km 이내']!.add(store);
      } else {
        grouped['5km 이상']!.add(store);
      }
    }

    // 빈 그룹 제거
    grouped.removeWhere((key, value) => value.isEmpty);
    
    return grouped;
  }

  /// 추천 매장 찾기 (가까우면서 혼잡도가 낮은)
  Future<Either<Failure, List<StoreWithDistance>>> getRecommendedStores({
    LocationData? userLocation,
    int limit = 5,
  }) async {
    final result = await searchNearbyStores(
      userLocation: userLocation,
      filter: const StoreSearchFilter(
        maxDistance: 5.0, // 5km 이내
        openOnly: true,
      ),
      sortBy: StoreSortOption.distance,
    );

    return result.fold(
      (failure) => Left(failure),
      (stores) {
        // 거리와 혼잡도를 고려한 점수 계산
        final scoredStores = stores.map((store) {
          // 거리 점수 (가까울수록 높은 점수)
          final distanceScore = 1.0 / (1.0 + store.distanceInKm);
          
          // 혼잡도 점수 (낮을수록 높은 점수)
          final congestionIndex = CongestionLevel.values.indexOf(store.store.congestionLevel);
          final congestionScore = 1.0 - (congestionIndex / (CongestionLevel.values.length - 1));
          
          // 총 점수 (거리 70%, 혼잡도 30%)
          final totalScore = (distanceScore * 0.7) + (congestionScore * 0.3);
          
          return MapEntry(totalScore, store);
        }).toList();

        // 점수 순으로 정렬
        scoredStores.sort((a, b) => b.key.compareTo(a.key));
        
        // 상위 항목들만 반환
        final recommendedStores = scoredStores
            .take(limit)
            .map((entry) => entry.value)
            .toList();

        return Right(recommendedStores);
      },
    );
  }
}