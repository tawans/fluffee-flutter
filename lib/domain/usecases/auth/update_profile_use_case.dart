import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../entities/user.dart';
import '../../repositories/auth_repository.dart';

class UpdateProfileUseCase {
  final AuthRepository _authRepository;

  UpdateProfileUseCase(this._authRepository);

  Future<Either<Failure, User>> call({
    String? name,
    String? phone,
    String? profileImageUrl,
  }) async {
    return await _authRepository.updateProfile(
      name: name,
      phone: phone,
      profileImageUrl: profileImageUrl,
    );
  }
}