import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../entities/menu.dart';
import '../entities/menu_category.dart';

abstract class MenuRepository {
  Future<Either<Failure, List<MenuCategory>>> getCategories();
  Future<Either<Failure, List<Menu>>> getMenusByCategory(String categoryId);
  Future<Either<Failure, List<Menu>>> getPopularMenus();
  Future<Either<Failure, List<Menu>>> getRecommendedMenus();
  Future<Either<Failure, Menu>> getMenuById(String menuId);
  Future<Either<Failure, List<Menu>>> searchMenus(String query);
}