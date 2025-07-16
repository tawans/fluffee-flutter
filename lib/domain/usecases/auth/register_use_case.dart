import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../entities/user.dart';
import '../../repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository _authRepository;

  RegisterUseCase(this._authRepository);

  Future<Either<Failure, User>> call({
    required String email,
    required String password,
    required String name,
    String? phone,
  }) async {
    return await _authRepository.signUpWithEmail(
      email: email,
      password: password,
      name: name,
    );
  }
}