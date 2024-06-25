import 'package:e_commerce_application/Domain/Entity/Categories%20or%20Brands/CategoriesOrBrandsResponseEntity.dart';

abstract class SubCategoryStates {}

class InitialSubCategoryStates extends SubCategoryStates {}

class SuccessSubCategoryStates extends SubCategoryStates {
  CategoriesOrBrandsResponseEntity categoriesOrBrandsEntity;

  SuccessSubCategoryStates({required this.categoriesOrBrandsEntity});
}

class ErrorSubCategoryStates extends SubCategoryStates {
  String errorMessage;

  ErrorSubCategoryStates({required this.errorMessage});
}

class LoadingSubCategoryStates extends SubCategoryStates {
  String loadingMessage;

  LoadingSubCategoryStates({required this.loadingMessage});
}
