import 'package:dartz/dartz.dart';
import 'package:e_commerce_application/Domain/Entity/Failures.dart';
import 'package:e_commerce_application/Domain/Entity/Products/ProductsResponseEntity.dart';
import 'package:e_commerce_application/Domain/Repository/Data%20Source/GetAllProductsDataSource.dart';
import 'package:e_commerce_application/Domain/Repository/repository/GetAllProductsRepository.dart';

class GetAllProductsRepositoryImpl implements GetAllProductsRepository {
  GetAllProductsDataSource allProductsDataSource;

  GetAllProductsRepositoryImpl({required this.allProductsDataSource});

  @override
  Future<Either<Failures, ProductsResponseEntity>> getAllProducts() {
    return allProductsDataSource.getAllProducts();
  }
}
