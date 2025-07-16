import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../entities/menu_category.dart';
import '../../repositories/menu_repository.dart';

class GetMenuCategoriesUseCase {
  final MenuRepository _menuRepository;

  GetMenuCategoriesUseCase(this._menuRepository);

  Future<Either<Failure, List<MenuCategory>>> call() async {
    return await _menuRepository.getCategories();
  }
}