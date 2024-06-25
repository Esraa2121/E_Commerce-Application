import 'package:dartz/dartz.dart';
import 'package:e_commerce_application/Domain/Entity/Failures.dart';
import 'package:e_commerce_application/Domain/Entity/Products/ProductsResponseEntity.dart';

abstract class GetAllProductsRepository {
  Future<Either<Failures, ProductsResponseEntity>> getAllProducts();
}
