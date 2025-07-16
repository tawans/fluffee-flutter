import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../entities/cart_item.dart';
import '../../repositories/cart_repository.dart';

class GetCartItemsUseCase {
  final CartRepository _cartRepository;

  GetCartItemsUseCase(this._cartRepository);

  Future<Either<Failure, List<CartItem>>> call(String userId) async {
    return await _cartRepository.getCartItems(userId);
  }

  Future<Either<Failure, int>> getCartItemCount(String userId) async {
    return await _cartRepository.getCartItemCount(userId);
  }

  Future<Either<Failure, int>> getCartTotalAmount(String userId) async {
    return await _cartRepository.getCartTotalAmount(userId);
  }
}