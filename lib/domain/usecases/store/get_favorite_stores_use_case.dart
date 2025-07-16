import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../entities/store.dart';
import '../../repositories/store_repository.dart';

class GetFavoriteStoresUseCase {
  final StoreRepository _storeRepository;

  GetFavoriteStoresUseCase(this._storeRepository);

  Future<Either<Failure, List<Store>>> call(String userId) async {
    return await _storeRepository.getFavoriteStores(userId);
  }
}