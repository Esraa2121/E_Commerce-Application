import 'package:dartz/dartz.dart';
import 'package:e_commerce_application/Domain/Entity/Cart/AddToCartResponseEntity.dart';
import 'package:e_commerce_application/Domain/Entity/Cart/GetAndRemoveFromCartEntity.dart';
import 'package:e_commerce_application/Domain/Entity/Failures.dart';

abstract class CartRepository {
  Future<Either<Failures, AddToCartResponseEntity>> addToCart(String productId);

  Future<Either<Failures, GetAndRemoveFromCartEntity>> removeFromCart(
      String productId);

  Future<Either<Failures, GetAndRemoveFromCartEntity>> getAllCart();

  Future<Either<Failures, GetAndRemoveFromCartEntity>> updateCartCount(
      String productId, int count);
}
