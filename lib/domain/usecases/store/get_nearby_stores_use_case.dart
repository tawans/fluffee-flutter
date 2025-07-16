import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../entities/store.dart';
import '../../repositories/store_repository.dart';

class GetNearbyStoresUseCase {
  final StoreRepository _storeRepository;

  GetNearbyStoresUseCase(this._storeRepository);

  Future<Either<Failure, List<Store>>> call({
    required double latitude,
    required double longitude,
    double radiusKm = 10.0,
  }) async {
    return await _storeRepository.getNearbyStores(
      latitude: latitude,
      longitude: longitude,
      radiusKm: radiusKm,
    );
  }
}