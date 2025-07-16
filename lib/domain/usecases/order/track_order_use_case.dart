import 'package:dartz/dartz.dart' hide Order;

import '../../../core/errors/failures.dart';
import '../../entities/order.dart';
import '../../repositories/order_repository.dart';

class TrackOrderUseCase {
  final OrderRepository _orderRepository;

  TrackOrderUseCase(this._orderRepository);

  Future<Either<Failure, Order>> call(String orderId) async {
    return await _orderRepository.getOrderById(orderId);
  }

  Stream<Order> watchOrder(String orderId) {
    return _orderRepository.watchOrder(orderId);
  }
}