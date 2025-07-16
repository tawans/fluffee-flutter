import 'package:dartz/dartz.dart' hide Order;

import '../../../core/errors/failures.dart';
import '../../entities/order.dart';
import '../../repositories/order_repository.dart';

class GetUserOrdersUseCase {
  final OrderRepository _orderRepository;

  GetUserOrdersUseCase(this._orderRepository);

  Future<Either<Failure, List<Order>>> call(String userId) async {
    return await _orderRepository.getUserOrders(userId);
  }
}