import 'package:dartz/dartz.dart';
import 'package:e_commerce_application/Core/Api/ApiManager.dart';
import 'package:e_commerce_application/Domain/Entity/Cart/AddToCartResponseEntity.dart';
import 'package:e_commerce_application/Domain/Entity/Cart/GetAndRemoveFromCartEntity.dart';
import 'package:e_commerce_application/Domain/Entity/Failures.dart';
import 'package:e_commerce_application/Domain/Repository/Data%20Source/CartDataSource.dart';

class CartDataSourceImpl implements CartDataSource {
  ApiManager apiManager;

  CartDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, AddToCartResponseEntity>> addToCart(
      String productId) async {
    var either = await apiManager.addToCart(productId);
    return either.fold((error) {
      return Left(error);
    }, (response) {
      return Right(response);
    });
  }

  @override
  Future<Either<Failures, GetAndRemoveFromCartEntity>> removeFromCart(
      String productId) async {
    var either = await apiManager.removeSpecificCartItem(productId);
    return either.fold((error) {
      return Left(error);
    }, (response) {
      return Right(response);
    });
  }

  @override
  Future<Either<Failures, GetAndRemoveFromCartEntity>> getAllCart() async {
    var either = await apiManager.getCart();
    return either.fold((error) {
      return Left(error);
    }, (response) {
      return Right(response);
    });
  }

  @override
  Future<Either<Failures, GetAndRemoveFromCartEntity>> updateCartCount(
      String productId, int count) async {
    var either = await apiManager.updateCartItem(productId, count);
    return either.fold((error) {
      return Left(error);
    }, (response) {
      return Right(response);
    });
  }
}
