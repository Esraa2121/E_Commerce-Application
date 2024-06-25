import 'package:e_commerce_application/Core/Utils/ToastMessage.dart';
import 'package:e_commerce_application/Domain/Entity/Payment/KioskResponseEntity.dart';
import 'package:e_commerce_application/Domain/UseCase/PaymentUseCase.dart';
import 'package:e_commerce_application/UI/AppBarItems/CartAppBar/paymentCubit/PaymentStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Core/Utils/Colors.dart';

class PaymentViewModel extends Cubit<PaymentStates> {
  PaymentViewModel({required this.paymentUseCase})
      : super(InitialPaymentState());
  PaymentUseCase paymentUseCase;
  String authToken = '';
  String id = '';
  String paymentToken = '';
  KioskResponseEntity responseEntity = KioskResponseEntity();

  void getToken(String apiKey) async {
    emit(LoadingPaymentState());
    var either = await paymentUseCase.invokeGetToken(apiKey);
    either.fold((error) {
      print('Error getting token: ${error.errorMessage}');
      emit(ErrorPaymentState(message: error.errorMessage));
    }, (response) async {
      emit(TokenSuccessPaymentState(getTokenEntity: response));
      authToken = response.token!;
      await getOrderId();
      await getPaymentRequest(4577183);
      //await getPaymentRequest(4577129);
      await getKiosk();
    });
  }

  Future<void> getOrderId() async {
    emit(LoadingPaymentState());
    var either = await paymentUseCase.invokeGetOrderId(authToken);
    either.fold((error) {
      emit(ErrorPaymentState(message: error.errorMessage));
      ToastMessage.showToastMessage(
          message: error.errorMessage, toastColor: MyColors.salmon);
    }, (response) {
      emit(OrderIdSuccessPaymentState(getOrderIdEntity: response));
      id = response.id.toString();
    });
  }

  Future<void> getPaymentRequest(int integrationId) async {
    if (id.isEmpty) {
      print('Order ID is empty, cannot proceed with payment request.');
      return;
    }

    emit(LoadingPaymentState());
    var either =
        await paymentUseCase.invokePaymentRequest(authToken, integrationId, id);
    either.fold((error) {
      emit(ErrorPaymentState(message: error.errorMessage));
      ToastMessage.showToastMessage(
          message: error.errorMessage, toastColor: MyColors.salmon);
    }, (response) {
      emit(RequestSuccessPaymentState(paymentRequestEntity: response));
      paymentToken = response.token!;
    });
  }

  Future<void> getKiosk() async {
    emit(LoadingPaymentState());
    var either = await paymentUseCase.invokeKioskResponse(paymentToken);
    either.fold((error) {
      emit(ErrorPaymentState(message: error.errorMessage));
      ToastMessage.showToastMessage(
          message: error.errorMessage, toastColor: MyColors.salmon);
    }, (response) {
      emit(KioskSuccessPaymentState(kioskResponseEntity: response));
      responseEntity = response;
    });
  }
}
