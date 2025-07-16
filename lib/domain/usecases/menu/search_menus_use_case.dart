import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../entities/menu.dart';
import '../../repositories/menu_repository.dart';

class SearchMenusUseCase {
  final MenuRepository _menuRepository;

  SearchMenusUseCase(this._menuRepository);

  Future<Either<Failure, List<Menu>>> call(String query) async {
    if (query.trim().isEmpty) {
      return const Right([]);
    }
    return await _menuRepository.searchMenus(query);
  }
}