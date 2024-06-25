import 'package:dartz/dartz.dart';
import 'package:e_commerce_application/Domain/Entity/Categories%20or%20Brands/CategoriesOrBrandsResponseEntity.dart';
import 'package:e_commerce_application/Domain/Entity/Failures.dart';
import 'package:e_commerce_application/Domain/Repository/Data%20Source/GetAllCategoriesOrBrandsDataSource.dart';
import 'package:e_commerce_application/Domain/Repository/repository/GetAllCategoriesOrBrandsRepository.dart';

class GetAllCategoriesRepositoryImpl
    implements GetAllCategoriesOrBrandsRepository {
  GetAllCategoriesOrBrandsDataSource allCategoriesOrBrandsDataSource;

  GetAllCategoriesRepositoryImpl(
      {required this.allCategoriesOrBrandsDataSource});

  @override
  Future<Either<Failures, CategoriesOrBrandsResponseEntity>>
      getAllCategories() {
    return allCategoriesOrBrandsDataSource.getAllCategories();
  }

  @override
  Future<Either<Failures, CategoriesOrBrandsResponseEntity>> getAllBrands() {
    return allCategoriesOrBrandsDataSource.getAllBrands();
  }

  @override
  Future<Either<Failures, CategoriesOrBrandsResponseEntity>> getSubCategories(
      String id) {
    return allCategoriesOrBrandsDataSource.getSubCategories(id);
  }
}
