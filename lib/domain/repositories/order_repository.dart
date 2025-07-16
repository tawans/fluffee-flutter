import 'package:dartz/dartz.dart' hide Order;

import '../../core/errors/failures.dart';
import '../entities/cart_item.dart';
import '../entities/order.dart';

abstract class OrderRepository {
  Future<Either<Failure, Order>> createOrder({
    required String userId,
    required String storeId,
    required List<CartItem> cartItems,
    String? notes,
  });
  Future<Either<Failure, List<Order>>> getUserOrders(String userId);
  Future<Either<Failure, Order>> getOrderById(String orderId);
  Future<Either<Failure, Order>> getOrder(String orderId);
  Future<Either<Failure, List<Order>>> getOrdersByStatus(OrderStatus status);
  Future<Either<Failure, Order>> updateOrderStatus({
    required String orderId,
    required OrderStatus status,
  });
  Future<Either<Failure, void>> cancelOrder(String orderId);
  Stream<Order> watchOrder(String orderId);
  Stream<List<Order>> watchUserOrders(String userId);
}