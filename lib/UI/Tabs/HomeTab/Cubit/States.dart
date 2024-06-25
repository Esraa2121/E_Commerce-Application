import 'package:e_commerce_application/Domain/Entity/Categories%20or%20Brands/CategoriesOrBrandsResponseEntity.dart';

abstract class HomeTabStates {}

class HomeTabInitialState extends HomeTabStates {}

class AllCategoriesLoadingState extends HomeTabStates {}

class AllCategoriesSuccessState extends HomeTabStates {
  CategoriesOrBrandsResponseEntity categoriesResponseEntity;

  AllCategoriesSuccessState({required this.categoriesResponseEntity});
}

class AllCategoriesErrorState extends HomeTabStates {
  String error;

  AllCategoriesErrorState({required this.error});
}
