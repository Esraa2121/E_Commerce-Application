import 'package:dartz/dartz.dart';
import 'package:e_commerce_application/Domain/Entity/Cart/GetAndRemoveFromCartEntity.dart';
import 'package:e_commerce_application/Domain/Repository/repository/CartRepository.dart';

import '../Entity/Failures.dart';

class RemoveFromCartUseCase {
  CartRepository cartRepository;

  RemoveFromCartUseCase({required this.cartRepository});

  Future<Either<Failures, GetAndRemoveFromCartEntity>> invoke(
      String productId) {
    return cartRepository.removeFromCart(productId);
  }
}
