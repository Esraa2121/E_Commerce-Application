import 'package:dartz/dartz.dart';
import 'package:e_commerce_application/Domain/Entity/Failures.dart';
import 'package:e_commerce_application/Domain/Entity/Payment/GetOrderIdEntity.dart';
import 'package:e_commerce_application/Domain/Entity/Payment/GetTokenEntity.dart';
import 'package:e_commerce_application/Domain/Entity/Payment/KioskResponseEntity.dart';
import 'package:e_commerce_application/Domain/Entity/Payment/PaymentRequestEntity.dart';
import 'package:e_commerce_application/Domain/Repository/Data%20Source/PaymentDataSource.dart';
import 'package:e_commerce_application/Domain/Repository/repository/PaymentRepository.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  PaymentDataSource paymentDataSource;

  PaymentRepositoryImpl({required this.paymentDataSource});

  @override
  Future<Either<Failures, GetTokenEntity>> getToken(String apiKey) {
    return paymentDataSource.getToken(apiKey);
  }

  @override
  Future<Either<Failures, GetOrderIdEntity>> getOrderId(String authToken) {
    return paymentDataSource.getOrderId(authToken);
  }

  @override
  Future<Either<Failures, PaymentRequestEntity>> getPaymentRequest(
      String authToken, int integrationId, String orderId) {
    return paymentDataSource.getPaymentRequest(
        authToken, integrationId, orderId);
  }

  @override
  Future<Either<Failures, KioskResponseEntity>> getKioskResponse(
      String paymentToken) {
    return paymentDataSource.getKioskResponse(paymentToken);
  }
}
