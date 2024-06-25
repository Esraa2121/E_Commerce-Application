import 'package:dartz/dartz.dart';
import 'package:e_commerce_application/Domain/Entity/Payment/KioskResponseEntity.dart';
import 'package:e_commerce_application/Domain/Entity/Payment/PaymentRequestEntity.dart';
import 'package:e_commerce_application/Domain/Repository/repository/PaymentRepository.dart';

import '../Entity/Failures.dart';
import '../Entity/Payment/GetOrderIdEntity.dart';
import '../Entity/Payment/GetTokenEntity.dart';

class PaymentUseCase {
  PaymentRepository paymentRepository;

  PaymentUseCase({required this.paymentRepository});

  Future<Either<Failures, GetTokenEntity>> invokeGetToken(String apiKey) {
    return paymentRepository.getToken(apiKey);
  }

  Future<Either<Failures, GetOrderIdEntity>> invokeGetOrderId(
      String authToken) {
    return paymentRepository.getOrderId(authToken);
  }

  Future<Either<Failures, PaymentRequestEntity>> invokePaymentRequest(
      String authToken, int integrationId, String orderId) {
    return paymentRepository.getPaymentRequest(
        authToken, integrationId, orderId);
  }

  Future<Either<Failures, KioskResponseEntity>> invokeKioskResponse(
      String paymentToken) {
    return paymentRepository.getKioskResponse(paymentToken);
  }
}
