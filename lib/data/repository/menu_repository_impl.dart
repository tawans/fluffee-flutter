import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/errors/exceptions.dart';
import '../../core/errors/failures.dart';
import '../../domain/entities/menu.dart';
import '../../domain/entities/menu_category.dart';
import '../../domain/repositories/menu_repository.dart';
import '../datasource/remote/menu_remote_data_source.dart';

@LazySingleton(as: MenuRepository)
class MenuRepositoryImpl implements MenuRepository {
  final MenuRemoteDataSource _menuRemoteDataSource;

  MenuRepositoryImpl(this._menuRemoteDataSource);

  @override
  Future<Either<Failure, List<MenuCategory>>> getCategories() async {
    try {
      final categoryDtos = await _menuRemoteDataSource.getCategories();
      final categories = categoryDtos.map((dto) => dto.toEntity()).toList();
      return Right(categories);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Menu>>> getMenusByCategory(String categoryId) async {
    try {
      final menuDtos = await _menuRemoteDataSource.getMenusByCategory(categoryId);
      final menus = menuDtos.map((dto) => dto.toEntity()).toList();
      return Right(menus);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Menu>>> getPopularMenus() async {
    try {
      final menuDtos = await _menuRemoteDataSource.getPopularMenus();
      final menus = menuDtos.map((dto) => dto.toEntity()).toList();
      return Right(menus);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Menu>>> getRecommendedMenus() async {
    try {
      final menuDtos = await _menuRemoteDataSource.getRecommendedMenus();
      final menus = menuDtos.map((dto) => dto.toEntity()).toList();
      return Right(menus);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Menu>> getMenuById(String menuId) async {
    try {
      final menuDto = await _menuRemoteDataSource.getMenuById(menuId);
      return Right(menuDto.toEntity());
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Menu>>> searchMenus(String query) async {
    try {
      final menuDtos = await _menuRemoteDataSource.searchMenus(query);
      final menus = menuDtos.map((dto) => dto.toEntity()).toList();
      return Right(menus);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }
}