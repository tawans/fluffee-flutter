import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../entities/user.dart';
import '../../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  Future<Either<Failure, User>> call({
    required String email,
    required String password,
  }) async {
    return await _authRepository.signInWithEmail(
      email: email,
      password: password,
    );
  }
}