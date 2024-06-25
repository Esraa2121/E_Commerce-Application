import 'package:dartz/dartz.dart';
import 'package:e_commerce_application/Core/Api/ApiManager.dart';
import 'package:e_commerce_application/Domain/Entity/Categories%20or%20Brands/CategoriesOrBrandsResponseEntity.dart';
import 'package:e_commerce_application/Domain/Entity/Failures.dart';
import 'package:e_commerce_application/Domain/Repository/Data%20Source/GetAllCategoriesOrBrandsDataSource.dart';

class GetAllCategoriesOrBrandsDataSourceImpl
    implements GetAllCategoriesOrBrandsDataSource {
  ApiManager apiManager;

  GetAllCategoriesOrBrandsDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, CategoriesOrBrandsResponseEntity>>
      getAllCategories() async {
    var either = await apiManager.getAllCategories();
    return either.fold((error) {
      return Left(error);
    }, (response) {
      return Right(response);
    });
  }

  @override
  Future<Either<Failures, CategoriesOrBrandsResponseEntity>>
      getAllBrands() async {
    var either = await apiManager.getAllBrands();
    return either.fold((error) {
      return Left(error);
    }, (response) {
      return Right(response);
    });
  }

  @override
  Future<Either<Failures, CategoriesOrBrandsResponseEntity>> getSubCategories(
      String id) async {
    var either = await apiManager.getSubCategories(id);
    return either.fold((error) {
      return Left(error);
    }, (response) {
      return Right(response);
    });
  }
}
