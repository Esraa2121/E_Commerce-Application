import 'package:dartz/dartz.dart';
import 'package:e_commerce_application/Domain/Entity/Categories%20or%20Brands/CategoriesOrBrandsResponseEntity.dart';
import 'package:e_commerce_application/Domain/Repository/repository/GetAllCategoriesOrBrandsRepository.dart';

import '../Entity/Failures.dart';

class GetAllBrandsUseCase {
  GetAllCategoriesOrBrandsRepository allCategoriesRepository;

  GetAllBrandsUseCase({required this.allCategoriesRepository});

  Future<Either<Failures, CategoriesOrBrandsResponseEntity>> invoke() {
    return allCategoriesRepository.getAllBrands();
  }
}
