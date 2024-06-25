import 'package:e_commerce_application/Core/Api/ApiManager.dart';
import 'package:e_commerce_application/Core/Utils/Colors.dart';
import 'package:e_commerce_application/Core/Utils/ToastMessage.dart';
import 'package:e_commerce_application/Domain/Entity/Products/ProductsEntity.dart';
import 'package:e_commerce_application/Domain/UseCase/AddToWishListUseCase.dart';
import 'package:e_commerce_application/UI/Tabs/FavoriteTab/cubit/States.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteTabViewModel extends Cubit<WishListStates> {
  FavoriteTabViewModel({required this.addToWishListUseCase})
      : super(InitialWishListState());
  AddToWishListUseCase addToWishListUseCase;
  List<ProductsEntity> productsList = [];

  void addToWishList(String productId) async {
    emit(LoadingWishListState(loadingMessage: 'Loading...'));
    var either = await addToWishListUseCase.invoke(productId);
    either.fold((error) {
      ToastMessage.showToastMessage(
          message: error.errorMessage, toastColor: MyColors.salmon);
      emit(ErrorWishListState(errorMessage: error.errorMessage));
    }, (response) {
      ToastMessage.showToastMessage(
          message: response.message ?? '', toastColor: MyColors.darkSlateGray);
      emit(SuccessWishListState(wishListEntity: response));
    });
  }

  void getWishList() async {
    emit(LoadingWishListState(loadingMessage: 'Loading...'));
    var either = await addToWishListUseCase.callGetWishList();
    either.fold((error) {
      ToastMessage.showToastMessage(
          message: error.errorMessage, toastColor: MyColors.salmon);
      emit(ErrorWishListState(errorMessage: error.errorMessage));
    }, (response) {
      productsList = response.data ?? [];
      emit(SuccessGetWishListState(wishListEntity: response));
    });
  }

  void removeFromWishList(String id) async {
    emit(LoadingWishListState(loadingMessage: 'Loading...'));
    var response = await ApiManager.getInstance().removeFromWishList(id);
    ToastMessage.showToastMessage(
        message: response, toastColor: MyColors.salmon);
  }
}
