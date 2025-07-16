import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User?>> getCurrentUser();
  Future<Either<Failure, User>> signInWithEmail({
    required String email,
    required String password,
  });
  Future<Either<Failure, User>> signUpWithEmail({
    required String email,
    required String password,
    required String name,
  });
  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, User>> updateProfile({
    String? name,
    String? phone,
    String? profileImageUrl,
  });
  Stream<User?> get authStateChanges;
}