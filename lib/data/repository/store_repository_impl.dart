import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/errors/exceptions.dart';
import '../../core/errors/failures.dart';
import '../../domain/entities/store.dart';
import '../../domain/repositories/store_repository.dart';
import '../datasource/remote/store_remote_data_source.dart';

@LazySingleton(as: StoreRepository)
class StoreRepositoryImpl implements StoreRepository {
  final StoreRemoteDataSource _storeRemoteDataSource;

  StoreRepositoryImpl(this._storeRemoteDataSource);

  @override
  Future<Either<Failure, List<Store>>> getNearbyStores({
    required double latitude,
    required double longitude,
    double radiusKm = 10.0,
  }) async {
    try {
      final storeDtos = await _storeRemoteDataSource.getNearbyStores(
        latitude: latitude,
        longitude: longitude,
        radiusKm: radiusKm,
      );
      final stores = storeDtos.map((dto) => dto.toEntity()).toList();
      return Right(stores);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Store>> getStoreById(String storeId) async {
    try {
      final storeDto = await _storeRemoteDataSource.getStoreById(storeId);
      return Right(storeDto.toEntity());
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Store>>> getFavoriteStores(String userId) async {
    try {
      final storeDtos = await _storeRemoteDataSource.getFavoriteStores(userId);
      final stores = storeDtos.map((dto) => dto.toEntity()).toList();
      return Right(stores);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> toggleFavoriteStore({
    required String userId,
    required String storeId,
  }) async {
    try {
      await _storeRemoteDataSource.toggleFavoriteStore(
        userId: userId,
        storeId: storeId,
      );
      return const Right(null);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateStoreCongestion({
    required String storeId,
    required CongestionLevel level,
  }) async {
    try {
      // 실제로는 관리자 권한이 필요한 기능이므로 여기서는 성공 응답만 반환
      return const Right(null);
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Store>>> getAllStores() async {
    try {
      final storeDtos = await _storeRemoteDataSource.getAllStores();
      final stores = storeDtos.map((dto) => dto.toEntity()).toList();
      return Right(stores);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }
}