import 'package:e_commerce_application/Core/Utils/Colors.dart';
import 'package:e_commerce_application/Core/Utils/ToastMessage.dart';
import 'package:e_commerce_application/Domain/Entity/Products/ProductsEntity.dart';
import 'package:e_commerce_application/Domain/UseCase/AddToCartUseCase.dart';
import 'package:e_commerce_application/Domain/UseCase/GetAllProductsUseCase.dart';
import 'package:e_commerce_application/UI/AppBarItems/CategoriesAppBar/Cubit/States.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductsViewModel extends Cubit<ProductsStates> {
  ProductsViewModel(
      {required this.productsUseCase, required this.addToCartUseCase})
      : super(ProductsInitialState());
  List<ProductsEntity> productsList = [];
  GetAllProductsUseCase productsUseCase;
  AddToCartUseCase addToCartUseCase;
  int numOfCartItems = 0;

  void getAllProducts() async {
    emit(ProductsLoadingState(loadingMessage: 'Loading...'));
    var either = await productsUseCase.invoke();
    either.fold((error) {
      emit(ProductsErrorState(errorMessage: error.errorMessage));
    }, (response) {
      productsList = response.data ?? [];
      emit(ProductsSuccessState(productsResponseEntity: response));
    });
  }

  void addToCart(String productId) async {
    emit(AddToCartLoadingState(loadingMessage: 'Loading...'));
    print('Loading ');
    var either = await addToCartUseCase.invoke(productId);
    either.fold((error) {
      Fluttertoast.showToast(
          msg: "${error.errorMessage}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: MyColors.salmon,
          textColor: MyColors.white,
          fontSize: 16.0);
      emit(AddToCartErrorState(errorMessage: error.errorMessage));
    }, (response) {
      // cartList = response.data;
      numOfCartItems = response.numOfCartItems!.toInt();
      ToastMessage.showToastMessage(
          message: "Added to cart successfully",
          toastColor: MyColors.lightSeaGreen);
      emit(AddToCartSuccessState(addToCartResponseEntity: response));
    });
  }
}
