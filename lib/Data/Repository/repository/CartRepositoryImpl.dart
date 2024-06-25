import 'package:dartz/dartz.dart';
import 'package:e_commerce_application/Domain/Entity/Cart/AddToCartResponseEntity.dart';
import 'package:e_commerce_application/Domain/Entity/Cart/GetAndRemoveFromCartEntity.dart';
import 'package:e_commerce_application/Domain/Entity/Failures.dart';
import 'package:e_commerce_application/Domain/Repository/Data%20Source/CartDataSource.dart';
import 'package:e_commerce_application/Domain/Repository/repository/CartRepository.dart';

class CartRepositoryImpl implements CartRepository {
  CartDataSource cartDataSource;

  CartRepositoryImpl({required this.cartDataSource});

  @override
  Future<Either<Failures, AddToCartResponseEntity>> addToCart(
      String productId) {
    return cartDataSource.addToCart(productId);
  }

  @override
  Future<Either<Failures, GetAndRemoveFromCartEntity>> removeFromCart(
      String productId) {
    return cartDataSource.removeFromCart(productId);
  }

  @override
  Future<Either<Failures, GetAndRemoveFromCartEntity>> getAllCart() {
    return cartDataSource.getAllCart();
  }

  @override
  Future<Either<Failures, GetAndRemoveFromCartEntity>> updateCartCount(
      String productId, int count) {
    return cartDataSource.updateCartCount(productId, count);
  }
}
