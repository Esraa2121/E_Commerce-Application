import 'package:dartz/dartz.dart';
import 'package:e_commerce_application/Core/Api/ApiManager.dart';
import 'package:e_commerce_application/Domain/Entity/Failures.dart';
import 'package:e_commerce_application/Domain/Entity/Products/ProductsResponseEntity.dart';
import 'package:e_commerce_application/Domain/Repository/Data%20Source/GetAllProductsDataSource.dart';

class GetAllProductsDataSourceImpl implements GetAllProductsDataSource {
  ApiManager apiManager;

  GetAllProductsDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, ProductsResponseEntity>> getAllProducts() async {
    var either = await apiManager.getAllProducts();
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
