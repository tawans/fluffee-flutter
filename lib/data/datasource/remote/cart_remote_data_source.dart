import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/errors/exceptions.dart';
import '../../models/cart_item_dto.dart';
import 'supabase_client.dart';

abstract class CartRemoteDataSource {
  Future<List<CartItemDto>> getCartItems(String userId);
  Future<CartItemDto> addToCart({
    required String userId,
    required String menuId,
    required int quantity,
    Map<String, dynamic>? selectedOptions,
  });
  Future<CartItemDto> updateCartItem({
    required String cartItemId,
    required int quantity,
  });
  Future<void> removeFromCart(String cartItemId);
  Future<void> clearCart(String userId);
  Future<int> getCartItemCount(String userId);
  Future<int> getCartTotalAmount(String userId);
}

@LazySingleton(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final SupabaseClientWrapper _supabaseClient;

  CartRemoteDataSourceImpl(this._supabaseClient);

  @override
  Future<List<CartItemDto>> getCartItems(String userId) async {
    try {
      final response = await _supabaseClient.client
          .from('cart_items')
          .select('''
            *,
            menus(
              *,
              menu_options(*)
            )
          ''')
          .eq('user_id', userId)
          .order('created_at', ascending: false);

      return (response as List)
          .map((json) => CartItemDto.fromJson(json))
          .toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<CartItemDto> addToCart({
    required String userId,
    required String menuId,
    required int quantity,
    Map<String, dynamic>? selectedOptions,
  }) async {
    try {
      // 메뉴 정보 가져오기
      final menuResponse = await _supabaseClient.client
          .from('menus')
          .select('''
            *,
            menu_options(*)
          ''')
          .eq('id', menuId)
          .single();

      final menuPrice = menuResponse['price'] as int;
      int optionPrice = 0;

      // 옵션 가격 계산
      if (selectedOptions != null && selectedOptions.isNotEmpty) {
        final menuOptions = menuResponse['menu_options'] as List;
        for (final option in menuOptions) {
          final optionType = option['option_type'];
          final selectedValue = selectedOptions[optionType];
          if (selectedValue == option['option_value']) {
            optionPrice += option['extra_price'] as int;
          }
        }
      }

      final unitPrice = menuPrice + optionPrice;
      final totalPrice = unitPrice * quantity;

      final response = await _supabaseClient.client
          .from('cart_items')
          .insert({
        'user_id': userId,
        'menu_id': menuId,
        'quantity': quantity,
        'unit_price': unitPrice,
        'total_price': totalPrice,
        'selected_options': selectedOptions,
      }).select('''
        *,
        menus(
          *,
          menu_options(*)
        )
      ''').single();

      return CartItemDto.fromJson(response);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<CartItemDto> updateCartItem({
    required String cartItemId,
    required int quantity,
  }) async {
    try {
      // 현재 장바구니 아이템 정보 가져오기
      final currentItem = await _supabaseClient.client
          .from('cart_items')
          .select('unit_price')
          .eq('id', cartItemId)
          .single();

      final unitPrice = currentItem['unit_price'] as int;
      final totalPrice = unitPrice * quantity;

      final response = await _supabaseClient.client
          .from('cart_items')
          .update({
        'quantity': quantity,
        'total_price': totalPrice,
        'updated_at': DateTime.now().toIso8601String(),
      })
          .eq('id', cartItemId)
          .select('''
        *,
        menus(
          *,
          menu_options(*)
        )
      ''')
          .single();

      return CartItemDto.fromJson(response);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> removeFromCart(String cartItemId) async {
    try {
      await _supabaseClient.client
          .from('cart_items')
          .delete()
          .eq('id', cartItemId);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> clearCart(String userId) async {
    try {
      await _supabaseClient.client
          .from('cart_items')
          .delete()
          .eq('user_id', userId);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<int> getCartItemCount(String userId) async {
    try {
      final response = await _supabaseClient.client
          .from('cart_items')
          .select('quantity')
          .eq('user_id', userId);

      return (response as List)
          .fold<int>(0, (sum, item) => sum + (item['quantity'] as int));
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<int> getCartTotalAmount(String userId) async {
    try {
      final response = await _supabaseClient.client
          .from('cart_items')
          .select('total_price')
          .eq('user_id', userId);

      return (response as List)
          .fold<int>(0, (sum, item) => sum + (item['total_price'] as int));
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}