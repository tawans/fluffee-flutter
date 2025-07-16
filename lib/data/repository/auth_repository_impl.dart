import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/errors/exceptions.dart';
import '../../core/errors/failures.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasource/remote/auth_remote_data_source.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl(this._authRemoteDataSource);

  @override
  Future<Either<Failure, User?>> getCurrentUser() async {
    try {
      final userDto = await _authRemoteDataSource.getCurrentUser();
      return Right(userDto?.toEntity());
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } on AuthException catch (e) {
      return Left(Failure.auth(e.message));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final userDto = await _authRemoteDataSource.signInWithEmail(
        email: email,
        password: password,
      );
      return Right(userDto.toEntity());
    } on AuthException catch (e) {
      return Left(Failure.auth(e.message));
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> signUpWithEmail({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final userDto = await _authRemoteDataSource.signUpWithEmail(
        email: email,
        password: password,
        name: name,
      );
      return Right(userDto.toEntity());
    } on AuthException catch (e) {
      return Left(Failure.auth(e.message));
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await _authRemoteDataSource.signOut();
      return const Right(null);
    } on AuthException catch (e) {
      return Left(Failure.auth(e.message));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> updateProfile({
    String? name,
    String? phone,
    String? profileImageUrl,
  }) async {
    try {
      final userDto = await _authRemoteDataSource.updateProfile(
        name: name,
        phone: phone,
        profileImageUrl: profileImageUrl,
      );
      return Right(userDto.toEntity());
    } on AuthException catch (e) {
      return Left(Failure.auth(e.message));
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  @override
  Stream<User?> get authStateChanges {
    return _authRemoteDataSource.authStateChanges.map(
      (userDto) => userDto?.toEntity(),
    );
  }
}