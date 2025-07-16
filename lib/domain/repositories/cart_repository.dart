import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../entities/cart_item.dart';

abstract class CartRepository {
  Future<Either<Failure, List<CartItem>>> getCartItems(String userId);
  Future<Either<Failure, CartItem>> addToCart({
    required String userId,
    required String menuId,
    required int quantity,
    Map<String, dynamic>? selectedOptions,
  });
  Future<Either<Failure, CartItem>> updateCartItem({
    required String cartItemId,
    required int quantity,
  });
  Future<Either<Failure, void>> removeFromCart(String cartItemId);
  Future<Either<Failure, void>> clearCart(String userId);
  Future<Either<Failure, int>> getCartItemCount(String userId);
  Future<Either<Failure, int>> getCartTotalAmount(String userId);
}