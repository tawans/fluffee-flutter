import 'package:dartz/dartz.dart' hide Order;
import 'package:injectable/injectable.dart' hide Order;

import '../../core/errors/exceptions.dart';
import '../../core/errors/failures.dart';
import '../../domain/entities/cart_item.dart';
import '../../domain/entities/order.dart';
import '../../domain/repositories/order_repository.dart';
import '../datasource/remote/order_remote_data_source.dart';

@LazySingleton(as: OrderRepository)
class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource _orderRemoteDataSource;

  OrderRepositoryImpl(this._orderRemoteDataSource);

  @override
  Future<Either<Failure, Order>> createOrder({
    required String userId,
    required String storeId,
    required List<CartItem> cartItems,
    String? notes,
  }) async {
    try {
      final orderDto = await _orderRemoteDataSource.createOrder(
        userId: userId,
        storeId: storeId,
        cartItems: cartItems,
        notes: notes,
      );
      return Right(orderDto.toEntity());
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Order>>> getUserOrders(String userId) async {
    try {
      final orderDtos = await _orderRemoteDataSource.getUserOrders(userId);
      final orders = orderDtos.map((dto) => dto.toEntity()).toList();
      return Right(orders);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Order>> getOrderById(String orderId) async {
    try {
      final orderDto = await _orderRemoteDataSource.getOrderById(orderId);
      return Right(orderDto.toEntity());
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Order>> getOrder(String orderId) async {
    return getOrderById(orderId);
  }

  @override
  Future<Either<Failure, List<Order>>> getOrdersByStatus(OrderStatus status) async {
    try {
      final orderDtos = await _orderRemoteDataSource.getOrdersByStatus(status.name);
      final orders = orderDtos.map((dto) => dto.toEntity()).toList();
      return Right(orders);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Order>> updateOrderStatus({
    required String orderId,
    required OrderStatus status,
  }) async {
    try {
      final orderDto = await _orderRemoteDataSource.updateOrderStatus(
        orderId: orderId,
        status: status.name,
      );
      return Right(orderDto.toEntity());
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> cancelOrder(String orderId) async {
    try {
      await _orderRemoteDataSource.cancelOrder(orderId);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  @override
  Stream<Order> watchOrder(String orderId) {
    return _orderRemoteDataSource.watchOrder(orderId).map(
      (orderDto) => orderDto.toEntity(),
    );
  }

  @override
  Stream<List<Order>> watchUserOrders(String userId) {
    return _orderRemoteDataSource.watchUserOrders(userId).map(
      (orderDtos) => orderDtos.map((dto) => dto.toEntity()).toList(),
    );
  }
}