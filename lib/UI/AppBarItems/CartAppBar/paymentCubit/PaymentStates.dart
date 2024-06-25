import 'package:e_commerce_application/Domain/Entity/Payment/GetOrderIdEntity.dart';
import 'package:e_commerce_application/Domain/Entity/Payment/GetTokenEntity.dart';
import 'package:e_commerce_application/Domain/Entity/Payment/KioskResponseEntity.dart';
import 'package:e_commerce_application/Domain/Entity/Payment/PaymentRequestEntity.dart';

abstract class PaymentStates {}

class InitialPaymentState extends PaymentStates {}

class LoadingPaymentState extends PaymentStates {}

class ErrorPaymentState extends PaymentStates {
  String message;

  ErrorPaymentState({required this.message});
}

class TokenSuccessPaymentState extends PaymentStates {
  GetTokenEntity getTokenEntity;

  TokenSuccessPaymentState({required this.getTokenEntity});
}

class OrderIdSuccessPaymentState extends PaymentStates {
  GetOrderIdEntity getOrderIdEntity;

  OrderIdSuccessPaymentState({required this.getOrderIdEntity});
}

class RequestSuccessPaymentState extends PaymentStates {
  PaymentRequestEntity paymentRequestEntity;

  RequestSuccessPaymentState({required this.paymentRequestEntity});
}

class KioskSuccessPaymentState extends PaymentStates {
  KioskResponseEntity kioskResponseEntity;

  KioskSuccessPaymentState({required this.kioskResponseEntity});
}
