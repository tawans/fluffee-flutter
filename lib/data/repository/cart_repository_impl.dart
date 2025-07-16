import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/errors/exceptions.dart';
import '../../core/errors/failures.dart';
import '../../domain/entities/cart_item.dart';
import '../../domain/repositories/cart_repository.dart';
import '../datasource/remote/cart_remote_data_source.dart';

@LazySingleton(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource _cartRemoteDataSource;

  CartRepositoryImpl(this._cartRemoteDataSource);

  @override
  Future<Either<Failure, List<CartItem>>> getCartItems(String userId) async {
    try {
      final cartItemDtos = await _cartRemoteDataSource.getCartItems(userId);
      final cartItems = cartItemDtos.map((dto) => dto.toEntity()).toList();
      return Right(cartItems);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CartItem>> addToCart({
    required String userId,
    required String menuId,
    required int quantity,
    Map<String, dynamic>? selectedOptions,
  }) async {
    try {
      final cartItemDto = await _cartRemoteDataSource.addToCart(
        userId: userId,
        menuId: menuId,
        quantity: quantity,
        selectedOptions: selectedOptions,
      );
      return Right(cartItemDto.toEntity());
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CartItem>> updateCartItem({
    required String cartItemId,
    required int quantity,
  }) async {
    try {
      final cartItemDto = await _cartRemoteDataSource.updateCartItem(
        cartItemId: cartItemId,
        quantity: quantity,
      );
      return Right(cartItemDto.toEntity());
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeFromCart(String cartItemId) async {
    try {
      await _cartRemoteDataSource.removeFromCart(cartItemId);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> clearCart(String userId) async {
    try {
      await _cartRemoteDataSource.clearCart(userId);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> getCartItemCount(String userId) async {
    try {
      final count = await _cartRemoteDataSource.getCartItemCount(userId);
      return Right(count);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> getCartTotalAmount(String userId) async {
    try {
      final total = await _cartRemoteDataSource.getCartTotalAmount(userId);
      return Right(total);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }
}