import 'package:e_commerce_application/Core/Api/ApiManager.dart';
import 'package:e_commerce_application/Core/Utils/Colors.dart';
import 'package:e_commerce_application/Core/Utils/ToastMessage.dart';
import 'package:e_commerce_application/Domain/Entity/Cart/GetAndRemoveFromCartEntity.dart';
import 'package:e_commerce_application/Domain/UseCase/GetCartUseCase.dart';
import 'package:e_commerce_application/Domain/UseCase/RemoveFromCartUseCase.dart';
import 'package:e_commerce_application/Domain/UseCase/UpdateCartUseCase.dart';
import 'package:e_commerce_application/UI/AppBarItems/CartAppBar/cubit/States.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartViewModel extends Cubit<CartStates> {
  CartViewModel(
      {required this.cartUseCase,
      required this.getCartUseCase,
      required this.updateCartUseCase})
      : super(InitialCartState());
  RemoveFromCartUseCase cartUseCase;
  UpdateCartUseCase updateCartUseCase;
  GetCartUseCase getCartUseCase;
  List<GetProductEntity> cartList = [];
  int totalPrice = 0;
  int count = 0;

  void removeCartItem(String productId) async {
    emit(GeneralCartState(message: 'Loading...'));
    var either = await cartUseCase.invoke(productId);
    either.fold((error) {
      emit(GeneralCartState(message: error.errorMessage));
      ToastMessage.showToastMessage(
          message: error.errorMessage, toastColor: MyColors.salmon);
    }, (response) {
      emit(SuccessCartState(cartEntity: response));
      totalPrice = response.data?.totalCartPrice?.toInt() ?? 0;
      cartList = response.data?.products ?? [];
      ToastMessage.showToastMessage(
          message: response.message ?? 'Deleted Successfully',
          toastColor: MyColors.turquoise);
    });
  }

  void updateCartItem(String productId, int count) async {
    emit(GeneralCartState(message: 'Loading...'));
    var either = await updateCartUseCase.invoke(productId, count);
    either.fold((error) {
      emit(GeneralCartState(message: error.errorMessage));
      ToastMessage.showToastMessage(
          message: error.errorMessage, toastColor: MyColors.salmon);
    }, (response) {
      emit(SuccessCartState(cartEntity: response));
      totalPrice = response.data?.totalCartPrice?.toInt() ?? 0;
      cartList = response.data?.products ?? [];
      ToastMessage.showToastMessage(
          message: response.message ?? 'Updated Successfully',
          toastColor: MyColors.turquoise);
    });
  }

  void getAllCart() async {
    emit(GeneralCartState(message: 'Loading...'));
    var either = await getCartUseCase.invoke();
    either.fold((error) {
      emit(GeneralCartState(message: error.errorMessage));
      ToastMessage.showToastMessage(
          message: error.errorMessage, toastColor: MyColors.salmon);
    }, (response) {
      totalPrice = response.data?.totalCartPrice?.toInt() ?? 0;
      cartList = response.data?.products ?? [];
      emit(SuccessCartState(cartEntity: response));
    });
  }

  void clearAllCart() async {
    emit(GeneralCartState(message: 'Loading...'));
    String message = await ApiManager.getInstance().clearCart();
    emit(GeneralCartState(message: message));
    ToastMessage.showToastMessage(
        message: message, toastColor: MyColors.turquoise);
  }
}
