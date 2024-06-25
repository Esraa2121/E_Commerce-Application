import 'package:dartz/dartz.dart';
import 'package:e_commerce_application/Domain/Entity/Categories%20or%20Brands/CategoriesOrBrandsResponseEntity.dart';
import 'package:e_commerce_application/Domain/Entity/Failures.dart';
import 'package:e_commerce_application/Domain/Repository/repository/GetAllCategoriesOrBrandsRepository.dart';

class GetSubCategoryUseCase {
  GetAllCategoriesOrBrandsRepository allCategoriesRepository;

  GetSubCategoryUseCase({required this.allCategoriesRepository});

  Future<Either<Failures, CategoriesOrBrandsResponseEntity>> invoke(String id) {
    return allCategoriesRepository.getSubCategories(id);
  }
}
