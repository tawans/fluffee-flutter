import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../entities/menu.dart';
import '../../repositories/menu_repository.dart';

class GetPopularMenusUseCase {
  final MenuRepository _menuRepository;

  GetPopularMenusUseCase(this._menuRepository);

  Future<Either<Failure, List<Menu>>> call() async {
    return await _menuRepository.getPopularMenus();
  }
}