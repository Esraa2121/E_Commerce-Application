import 'package:dartz/dartz.dart';
import 'package:e_commerce_application/Domain/Entity/Products/ProductsResponseEntity.dart';
import 'package:e_commerce_application/Domain/Repository/repository/GetAllProductsRepository.dart';

import '../Entity/Failures.dart';

class GetAllProductsUseCase {
  GetAllProductsRepository allProductsRepository;

  GetAllProductsUseCase({required this.allProductsRepository});

  Future<Either<Failures, ProductsResponseEntity>> invoke() {
    return allProductsRepository.getAllProducts();
  }
}
