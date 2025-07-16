import 'package:dartz/dartz.dart' hide Order;

import '../../../core/errors/failures.dart';
import '../../entities/cart_item.dart';
import '../../entities/order.dart';
import '../../repositories/cart_repository.dart';
import '../../repositories/order_repository.dart';

class CreateOrderUseCase {
  final OrderRepository _orderRepository;
  final CartRepository _cartRepository;

  CreateOrderUseCase(this._orderRepository, this._cartRepository);

  Future<Either<Failure, Order>> call({
    required String userId,
    required String storeId,
    required List<CartItem> cartItems,
    String? notes,
  }) async {
    if (cartItems.isEmpty) {
      return const Left(Failure.validation('장바구니가 비어있습니다.'));
    }

    final result = await _orderRepository.createOrder(
      userId: userId,
      storeId: storeId,
      cartItems: cartItems,
      notes: notes,
    );

    if (result.isRight()) {
      await _cartRepository.clearCart(userId);
    }

    return result;
  }
}