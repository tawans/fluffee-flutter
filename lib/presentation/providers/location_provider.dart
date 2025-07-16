import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/services/location_service.dart';
import '../../core/services/store_search_service.dart';
import '../../domain/repositories/store_repository.dart';
import '../../di/injection.dart';

/// 위치 서비스 프로바이더
final locationServiceProvider = Provider<LocationService>((ref) {
  return LocationService();
});

/// 매장 검색 서비스 프로바이더
final storeSearchServiceProvider = Provider<StoreSearchService>((ref) {
  final storeRepository = getIt<StoreRepository>();
  final locationService = ref.watch(locationServiceProvider);
  
  return StoreSearchService(storeRepository, locationService);
});

/// 현재 위치 프로바이더
final currentLocationProvider = FutureProvider<LocationData>((ref) async {
  final locationService = ref.watch(locationServiceProvider);
  final result = await locationService.getCurrentLocation();
  
  return result.fold(
    (failure) => locationService.getDefaultLocation(),
    (location) => location,
  );
});

/// 위치 권한 상태 프로바이더
final locationPermissionProvider = FutureProvider<bool>((ref) async {
  final locationService = ref.watch(locationServiceProvider);
  final result = await locationService.checkAndRequestPermission();
  
  return result.fold(
    (failure) => false,
    (hasPermission) => hasPermission,
  );
});

/// 근처 매장 검색 프로바이더
final nearbyStoresProvider = FutureProvider.family<List<StoreWithDistance>, StoreSearchParams>((ref, params) async {
  final storeSearchService = ref.watch(storeSearchServiceProvider);
  final result = await storeSearchService.searchNearbyStores(
    userLocation: params.userLocation,
    filter: params.filter,
    sortBy: params.sortBy,
  );
  
  return result.fold(
    (failure) => [],
    (stores) => stores,
  );
});

/// 추천 매장 프로바이더
final recommendedStoresProvider = FutureProvider.family<List<StoreWithDistance>, LocationData?>((ref, userLocation) async {
  final storeSearchService = ref.watch(storeSearchServiceProvider);
  final result = await storeSearchService.getRecommendedStores(
    userLocation: userLocation,
    limit: 5,
  );
  
  return result.fold(
    (failure) => [],
    (stores) => stores,
  );
});

/// 가장 가까운 매장 프로바이더
final nearestStoreProvider = FutureProvider.family<StoreWithDistance?, LocationData?>((ref, userLocation) async {
  final storeSearchService = ref.watch(storeSearchServiceProvider);
  final result = await storeSearchService.findNearestStore(
    userLocation: userLocation,
  );
  
  return result.fold(
    (failure) => null,
    (store) => store,
  );
});

/// 텍스트 검색 프로바이더
final storeTextSearchProvider = FutureProvider.family<List<StoreWithDistance>, StoreTextSearchParams>((ref, params) async {
  final storeSearchService = ref.watch(storeSearchServiceProvider);
  final result = await storeSearchService.searchStoresByText(
    searchQuery: params.query,
    userLocation: params.userLocation,
    sortBy: params.sortBy,
  );
  
  return result.fold(
    (failure) => [],
    (stores) => stores,
  );
});

/// 영업 중인 매장 프로바이더
final openStoresProvider = FutureProvider.family<List<StoreWithDistance>, OpenStoresParams>((ref, params) async {
  final storeSearchService = ref.watch(storeSearchServiceProvider);
  final result = await storeSearchService.findOpenStores(
    userLocation: params.userLocation,
    maxDistance: params.maxDistance,
  );
  
  return result.fold(
    (failure) => [],
    (stores) => stores,
  );
});

/// 혼잡도가 낮은 매장 프로바이더
final lowCongestionStoresProvider = FutureProvider.family<List<StoreWithDistance>, LowCongestionParams>((ref, params) async {
  final storeSearchService = ref.watch(storeSearchServiceProvider);
  final result = await storeSearchService.findLowCongestionStores(
    userLocation: params.userLocation,
    maxDistance: params.maxDistance,
  );
  
  return result.fold(
    (failure) => [],
    (stores) => stores,
  );
});

/// 매장 검색 파라미터
class StoreSearchParams {
  final LocationData? userLocation;
  final StoreSearchFilter? filter;
  final StoreSortOption sortBy;

  const StoreSearchParams({
    this.userLocation,
    this.filter,
    this.sortBy = StoreSortOption.distance,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is StoreSearchParams &&
        other.userLocation == userLocation &&
        other.filter == filter &&
        other.sortBy == sortBy;
  }

  @override
  int get hashCode {
    return Object.hash(userLocation, filter, sortBy);
  }
}

/// 텍스트 검색 파라미터
class StoreTextSearchParams {
  final String query;
  final LocationData? userLocation;
  final StoreSortOption sortBy;

  const StoreTextSearchParams({
    required this.query,
    this.userLocation,
    this.sortBy = StoreSortOption.distance,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is StoreTextSearchParams &&
        other.query == query &&
        other.userLocation == userLocation &&
        other.sortBy == sortBy;
  }

  @override
  int get hashCode {
    return Object.hash(query, userLocation, sortBy);
  }
}

/// 영업 중인 매장 검색 파라미터
class OpenStoresParams {
  final LocationData? userLocation;
  final double? maxDistance;

  const OpenStoresParams({
    this.userLocation,
    this.maxDistance,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OpenStoresParams &&
        other.userLocation == userLocation &&
        other.maxDistance == maxDistance;
  }

  @override
  int get hashCode {
    return Object.hash(userLocation, maxDistance);
  }
}

/// 혼잡도 낮은 매장 검색 파라미터
class LowCongestionParams {
  final LocationData? userLocation;
  final double? maxDistance;

  const LowCongestionParams({
    this.userLocation,
    this.maxDistance,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LowCongestionParams &&
        other.userLocation == userLocation &&
        other.maxDistance == maxDistance;
  }

  @override
  int get hashCode {
    return Object.hash(userLocation, maxDistance);
  }
}