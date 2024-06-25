import 'package:dartz/dartz.dart';
import 'package:e_commerce_application/Domain/Entity/Cart/GetAndRemoveFromCartEntity.dart';
import 'package:e_commerce_application/Domain/Repository/repository/CartRepository.dart';

import '../Entity/Failures.dart';

class GetCartUseCase {
  CartRepository cartRepository;

  GetCartUseCase({required this.cartRepository});

  Future<Either<Failures, GetAndRemoveFromCartEntity>> invoke() {
    return cartRepository.getAllCart();
  }
}
