import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../entities/store.dart';

abstract class StoreRepository {
  Future<Either<Failure, List<Store>>> getAllStores();
  Future<Either<Failure, List<Store>>> getNearbyStores({
    required double latitude,
    required double longitude,
    double radiusKm = 10.0,
  });
  Future<Either<Failure, Store>> getStoreById(String storeId);
  Future<Either<Failure, List<Store>>> getFavoriteStores(String userId);
  Future<Either<Failure, void>> toggleFavoriteStore({
    required String userId,
    required String storeId,
  });
  Future<Either<Failure, void>> updateStoreCongestion({
    required String storeId,
    required CongestionLevel level,
  });
}