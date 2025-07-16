import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../entities/menu.dart';
import '../../repositories/menu_repository.dart';

class GetMenusByCategoryUseCase {
  final MenuRepository _menuRepository;

  GetMenusByCategoryUseCase(this._menuRepository);

  Future<Either<Failure, List<Menu>>> call(String categoryId) async {
    return await _menuRepository.getMenusByCategory(categoryId);
  }
}