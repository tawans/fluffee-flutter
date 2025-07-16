import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/errors/exceptions.dart';
import '../../models/menu_category_dto.dart';
import '../../models/menu_dto.dart';
import 'supabase_client.dart';

abstract class MenuRemoteDataSource {
  Future<List<MenuCategoryDto>> getCategories();
  Future<List<MenuDto>> getMenusByCategory(String categoryId);
  Future<List<MenuDto>> getPopularMenus();
  Future<List<MenuDto>> getRecommendedMenus();
  Future<MenuDto> getMenuById(String menuId);
  Future<List<MenuDto>> searchMenus(String query);
}

@LazySingleton(as: MenuRemoteDataSource)
class MenuRemoteDataSourceImpl implements MenuRemoteDataSource {
  final SupabaseClientWrapper _supabaseClient;

  MenuRemoteDataSourceImpl(this._supabaseClient);

  @override
  Future<List<MenuCategoryDto>> getCategories() async {
    try {
      final response = await _supabaseClient.client
          .from('menu_categories')
          .select()
          .eq('is_active', true)
          .order('sort_order');

      return (response as List)
          .map((json) => MenuCategoryDto.fromJson(json))
          .toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<MenuDto>> getMenusByCategory(String categoryId) async {
    try {
      final response = await _supabaseClient.client
          .from('menus')
          .select('''
            *,
            menu_options(*)
          ''')
          .eq('category_id', categoryId)
          .eq('is_available', true)
          .order('sort_order');

      return (response as List)
          .map((json) => MenuDto.fromJson(json))
          .toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<MenuDto>> getPopularMenus() async {
    try {
      final response = await _supabaseClient.client
          .from('menus')
          .select('''
            *,
            menu_options(*)
          ''')
          .eq('is_popular', true)
          .eq('is_available', true)
          .order('sort_order')
          .limit(10);

      return (response as List)
          .map((json) => MenuDto.fromJson(json))
          .toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<MenuDto>> getRecommendedMenus() async {
    try {
      final response = await _supabaseClient.client
          .from('menus')
          .select('''
            *,
            menu_options(*)
          ''')
          .eq('is_recommended', true)
          .eq('is_available', true)
          .order('sort_order')
          .limit(10);

      return (response as List)
          .map((json) => MenuDto.fromJson(json))
          .toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<MenuDto> getMenuById(String menuId) async {
    try {
      final response = await _supabaseClient.client
          .from('menus')
          .select('''
            *,
            menu_options(*)
          ''')
          .eq('id', menuId)
          .single();

      return MenuDto.fromJson(response);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<MenuDto>> searchMenus(String query) async {
    try {
      final response = await _supabaseClient.client
          .from('menus')
          .select('''
            *,
            menu_options(*)
          ''')
          .or('name.ilike.%$query%,description.ilike.%$query%')
          .eq('is_available', true)
          .order('name');

      return (response as List)
          .map((json) => MenuDto.fromJson(json))
          .toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}