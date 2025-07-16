import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/errors/exceptions.dart';
import '../../../domain/entities/cart_item.dart';
import '../../models/order_dto.dart';
import 'supabase_client.dart';

abstract class OrderRemoteDataSource {
  Future<OrderDto> createOrder({
    required String userId,
    required String storeId,
    required List<CartItem> cartItems,
    String? notes,
  });
  Future<List<OrderDto>> getUserOrders(String userId);
  Future<OrderDto> getOrderById(String orderId);
  Future<List<OrderDto>> getOrdersByStatus(String status);
  Future<OrderDto> updateOrderStatus({
    required String orderId,
    required String status,
  });
  Future<void> cancelOrder(String orderId);
  Stream<OrderDto> watchOrder(String orderId);
  Stream<List<OrderDto>> watchUserOrders(String userId);
}

@LazySingleton(as: OrderRemoteDataSource)
class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  final SupabaseClientWrapper _supabaseClient;

  OrderRemoteDataSourceImpl(this._supabaseClient);

  @override
  Future<OrderDto> createOrder({
    required String userId,
    required String storeId,
    required List<CartItem> cartItems,
    String? notes,
  }) async {
    try {
      final totalAmount = cartItems.fold<int>(
        0,
        (sum, item) => sum + item.totalPrice,
      );

      final orderResponse = await _supabaseClient.client
          .from('orders')
          .insert({
        'user_id': userId,
        'store_id': storeId,
        'total_amount': totalAmount,
        'notes': notes,
        'status': 'received',
      }).select('''
        *,
        stores(*)
      ''').single();

      final orderId = orderResponse['id'];

      final orderItems = cartItems.map((cartItem) => {
            'order_id': orderId,
            'menu_id': cartItem.menuId,
            'quantity': cartItem.quantity,
            'unit_price': cartItem.unitPrice,
            'total_price': cartItem.totalPrice,
            'selected_options': cartItem.selectedOptions,
          }).toList();

      await _supabaseClient.client
          .from('order_items')
          .insert(orderItems);

      final fullOrderResponse = await _supabaseClient.client
          .from('orders')
          .select('''
            *,
            stores(*),
            order_items(
              *,
              menus(
                *,
                menu_options(*)
              )
            )
          ''')
          .eq('id', orderId)
          .single();

      return OrderDto.fromJson(fullOrderResponse);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<OrderDto>> getUserOrders(String userId) async {
    try {
      final response = await _supabaseClient.client
          .from('orders')
          .select('''
            *,
            stores(*),
            order_items(
              *,
              menus(
                *,
                menu_options(*)
              )
            )
          ''')
          .eq('user_id', userId)
          .order('created_at', ascending: false);

      return (response as List)
          .map((json) => OrderDto.fromJson(json))
          .toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<OrderDto> getOrderById(String orderId) async {
    try {
      final response = await _supabaseClient.client
          .from('orders')
          .select('''
            *,
            stores(*),
            order_items(
              *,
              menus(
                *,
                menu_options(*)
              )
            )
          ''')
          .eq('id', orderId)
          .single();

      return OrderDto.fromJson(response);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<OrderDto>> getOrdersByStatus(String status) async {
    try {
      final response = await _supabaseClient.client
          .from('orders')
          .select('''
            *,
            stores(*),
            order_items(
              *,
              menus(
                *,
                menu_options(*)
              )
            )
          ''')
          .eq('status', status)
          .order('created_at', ascending: false);

      return (response as List)
          .map((json) => OrderDto.fromJson(json))
          .toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<OrderDto> updateOrderStatus({
    required String orderId,
    required String status,
  }) async {
    try {
      final response = await _supabaseClient.client
          .from('orders')
          .update({
        'status': status,
        'updated_at': DateTime.now().toIso8601String(),
      })
          .eq('id', orderId)
          .select('''
            *,
            stores(*),
            order_items(
              *,
              menus(
                *,
                menu_options(*)
              )
            )
          ''')
          .single();

      return OrderDto.fromJson(response);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> cancelOrder(String orderId) async {
    try {
      await _supabaseClient.client
          .from('orders')
          .update({
        'status': 'cancelled',
        'updated_at': DateTime.now().toIso8601String(),
      })
          .eq('id', orderId);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Stream<OrderDto> watchOrder(String orderId) {
    return _supabaseClient.client
        .from('orders')
        .stream(primaryKey: ['id'])
        .eq('id', orderId)
        .asyncMap((data) async {
          final fullOrder = await getOrderById(orderId);
          return fullOrder;
        });
  }

  @override
  Stream<List<OrderDto>> watchUserOrders(String userId) {
    return _supabaseClient.client
        .from('orders')
        .stream(primaryKey: ['id'])
        .eq('user_id', userId)
        .asyncMap((data) async {
          return await getUserOrders(userId);
        });
  }
}