import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../repositories/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository _authRepository;

  LogoutUseCase(this._authRepository);

  Future<Either<Failure, void>> call() async {
    return await _authRepository.signOut();
  }
}