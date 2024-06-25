import 'package:e_commerce_application/Domain/Entity/Categories%20or%20Brands/CategoriesOrBrandsEntity.dart';
import 'package:e_commerce_application/Domain/UseCase/GetSubCategoryUseCase.dart';
import 'package:e_commerce_application/UI/Tabs/HomeTab/SubCategory/cubit/States.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubCategoryViewModel extends Cubit<SubCategoryStates> {
  SubCategoryViewModel({required this.subCategoryUseCase})
      : super(InitialSubCategoryStates());
  GetSubCategoryUseCase subCategoryUseCase;
  List<CategoriesOrBrandsEntity> categoriesList = [];

  void getSubCategoryById(String id) async {
    emit(LoadingSubCategoryStates(loadingMessage: 'Loading...'));
    var either = await subCategoryUseCase.invoke(id);
    either.fold((error) {
      emit(ErrorSubCategoryStates(errorMessage: error.errorMessage));
    }, (response) {
      categoriesList = response.data ?? [];
      emit(SuccessSubCategoryStates(categoriesOrBrandsEntity: response));
    });
  }
}
