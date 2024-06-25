import 'package:dartz/dartz.dart';
import 'package:e_commerce_application/Domain/Entity/Cart/AddToCartResponseEntity.dart';
import 'package:e_commerce_application/Domain/Repository/repository/CartRepository.dart';

import '../Entity/Failures.dart';

class AddToCartUseCase {
  CartRepository addToCartRepository;

  AddToCartUseCase({required this.addToCartRepository});

  Future<Either<Failures, AddToCartResponseEntity>> invoke(String productId) {
    return addToCartRepository.addToCart(productId);
  }
}
