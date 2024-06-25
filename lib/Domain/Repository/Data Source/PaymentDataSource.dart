import 'package:dartz/dartz.dart';
import 'package:e_commerce_application/Domain/Entity/Failures.dart';
import 'package:e_commerce_application/Domain/Entity/Payment/GetOrderIdEntity.dart';
import 'package:e_commerce_application/Domain/Entity/Payment/GetTokenEntity.dart';
import 'package:e_commerce_application/Domain/Entity/Payment/KioskResponseEntity.dart';
import 'package:e_commerce_application/Domain/Entity/Payment/PaymentRequestEntity.dart';

abstract class PaymentDataSource {
  Future<Either<Failures, GetTokenEntity>> getToken(String apiKey);

  Future<Either<Failures, GetOrderIdEntity>> getOrderId(String authToken);

  Future<Either<Failures, PaymentRequestEntity>> getPaymentRequest(
      String authToken, int integrationId, String orderId);

  Future<Either<Failures, KioskResponseEntity>> getKioskResponse(
      String paymentToken);
}
