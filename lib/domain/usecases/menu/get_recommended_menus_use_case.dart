import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../entities/menu.dart';
import '../../repositories/menu_repository.dart';

class GetRecommendedMenusUseCase {
  final MenuRepository _menuRepository;

  GetRecommendedMenusUseCase(this._menuRepository);

  Future<Either<Failure, List<Menu>>> call() async {
    return await _menuRepository.getRecommendedMenus();
  }
}