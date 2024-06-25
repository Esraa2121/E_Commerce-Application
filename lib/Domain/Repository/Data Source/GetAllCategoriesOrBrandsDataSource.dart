import 'package:dartz/dartz.dart';
import 'package:e_commerce_application/Domain/Entity/Categories%20or%20Brands/CategoriesOrBrandsResponseEntity.dart';
import 'package:e_commerce_application/Domain/Entity/Failures.dart';

abstract class GetAllCategoriesOrBrandsDataSource {
  Future<Either<Failures, CategoriesOrBrandsResponseEntity>> getAllCategories();

  Future<Either<Failures, CategoriesOrBrandsResponseEntity>> getSubCategories(
      String id);

  Future<Either<Failures, CategoriesOrBrandsResponseEntity>> getAllBrands();
}
