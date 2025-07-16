import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../repositories/store_repository.dart';

class ToggleFavoriteStoreUseCase {
  final StoreRepository _storeRepository;

  ToggleFavoriteStoreUseCase(this._storeRepository);

  Future<Either<Failure, void>> call({
    required String userId,
    required String storeId,
  }) async {
    return await _storeRepository.toggleFavoriteStore(
      userId: userId,
      storeId: storeId,
    );
  }
}