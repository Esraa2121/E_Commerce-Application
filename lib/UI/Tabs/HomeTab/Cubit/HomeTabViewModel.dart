import 'package:e_commerce_application/Core/Utils/Assets.dart';
import 'package:e_commerce_application/Domain/Entity/Categories%20or%20Brands/CategoriesOrBrandsEntity.dart';
import 'package:e_commerce_application/Domain/UseCase/GetAllBrandsUseCase.dart';
import 'package:e_commerce_application/Domain/UseCase/GetAllCategoriesUseCase.dart';
import 'package:e_commerce_application/UI/Tabs/HomeTab/Cubit/States.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTabViewModel extends Cubit<HomeTabStates> {
  HomeTabViewModel(
      {required this.allCategoriesUseCase, required this.allBrandsUseCase})
      : super(HomeTabInitialState());
  List<String> advertisements = [
    Assets.advertisement1,
    Assets.advertisement2,
    Assets.advertisement3,
  ];
  List<CategoriesOrBrandsEntity> categoriesList = [];
  List<CategoriesOrBrandsEntity> brandsList = [];
  GetAllCategoriesUseCase allCategoriesUseCase;
  GetAllBrandsUseCase allBrandsUseCase;

  void getAllCategories() async {
    emit(AllCategoriesLoadingState());
    var either = await allCategoriesUseCase.invoke();
    either.fold((error) {
      emit(AllCategoriesErrorState(error: error.errorMessage));
    }, (response) {
      categoriesList = response.data ?? [];
      emit(AllCategoriesSuccessState(categoriesResponseEntity: response));
    });
  }

  void getAllBrands() async {
    emit(AllCategoriesLoadingState());
    var either = await allBrandsUseCase.invoke();
    either.fold((error) {
      emit(AllCategoriesErrorState(error: error.errorMessage));
    }, (response) {
      brandsList = response.data ?? [];
      emit(AllCategoriesSuccessState(categoriesResponseEntity: response));
    });
  }
}
