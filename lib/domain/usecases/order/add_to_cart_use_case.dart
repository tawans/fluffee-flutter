import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../entities/cart_item.dart';
import '../../repositories/cart_repository.dart';

class AddToCartUseCase {
  final CartRepository _cartRepository;

  AddToCartUseCase(this._cartRepository);

  Future<Either<Failure, CartItem>> call({
    required String userId,
    required String menuId,
    required int quantity,
    Map<String, dynamic>? selectedOptions,
  }) async {
    if (quantity <= 0) {
      return const Left(Failure.validation('수량은 1개 이상이어야 합니다.'));
    }

    return await _cartRepository.addToCart(
      userId: userId,
      menuId: menuId,
      quantity: quantity,
      selectedOptions: selectedOptions,
    );
  }
}