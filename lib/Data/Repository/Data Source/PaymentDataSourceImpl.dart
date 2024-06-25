import 'package:dartz/dartz.dart';
import 'package:e_commerce_application/Core/Api/DioApi.dart';
import 'package:e_commerce_application/Data/Model/Payment/GetOrderIdDm.dart';
import 'package:e_commerce_application/Data/Model/Payment/GetTokenDM.dart';
import 'package:e_commerce_application/Data/Model/Payment/KioskResponseDM.dart';
import 'package:e_commerce_application/Data/Model/Payment/PaymentRequestDM.dart';
import 'package:e_commerce_application/Domain/Entity/Failures.dart';
import 'package:e_commerce_application/Domain/Entity/Payment/GetOrderIdEntity.dart';
import 'package:e_commerce_application/Domain/Entity/Payment/GetTokenEntity.dart';
import 'package:e_commerce_application/Domain/Entity/Payment/KioskResponseEntity.dart';
import 'package:e_commerce_application/Domain/Entity/Payment/PaymentRequestEntity.dart';
import 'package:e_commerce_application/Domain/Repository/Data%20Source/PaymentDataSource.dart';

class PaymentDataSourceImpl implements PaymentDataSource {
  DioApiManger dioApiManger;

  PaymentDataSourceImpl({required this.dioApiManger});

  @override
  Future<Either<Failures, GetTokenEntity>> getToken(String apiKey) async {
    var either = await getTokenApi(apiKey);
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  Future<Either<Failures, GetTokenDm>> getTokenApi(String apiKey) async {
    try {
      var response = await dioApiManger
          .postRequest(body: {'api_key': apiKey}, endPoint: '/auth/tokens');
      return Right(GetTokenDm.fromJson(response.data));
    } catch (error) {
      return Left(ServerError(errorMessage: error.toString()));
    }
  }

  @override
  Future<Either<Failures, GetOrderIdEntity>> getOrderId(
      String authToken) async {
    var either = await getOrderIdApi(authToken);
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  Future<Either<Failures, GetOrderIdDm>> getOrderIdApi(String authToken) async {
    try {
      var response = await dioApiManger.postRequest(body: {
        'auth_token': authToken,
        "delivery_needed": "true",
        "amount_cents": "1000",
        "currency": "EGP",
        "items": []
      }, endPoint: '/ecommerce/orders');
      return Right(GetOrderIdDm.fromJson(response.data));
    } catch (error) {
      return Left(ServerError(errorMessage: error.toString()));
    }
  }

  @override
  Future<Either<Failures, PaymentRequestEntity>> getPaymentRequest(
      String authToken, int integrationId, String orderId) async {
    var either = await getPaymentRequestApi(authToken, integrationId, orderId);
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  Future<Either<Failures, PaymentRequestDm>> getPaymentRequestApi(
      String authToken, int integrationId, String orderId) async {
    try {
      var response = await dioApiManger.postRequest(body: {
        'auth_token': authToken,
        "amount_cents": "1000",
        "expiration": 2500,
        "order_id": orderId,
        "billing_data": {
          "apartment": "NA",
          "email": "basmamounir57@gmail.com",
          "floor": "NA",
          "first_name": "Basma",
          "street": "NA",
          "building": "NA",
          "phone_number": "01122060186",
          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "NA",
          "country": "NA",
          "last_name": "Mounir",
          "state": "NA"
        },
        "currency": "EGP",
        "integration_id": integrationId
      }, endPoint: '/acceptance/payment_keys');
      return Right(PaymentRequestDm.fromJson(response.data));
    } catch (error) {
      return Left(ServerError(errorMessage: error.toString()));
    }
  }

  @override
  Future<Either<Failures, KioskResponseEntity>> getKioskResponse(
      String paymentToken) async {
    var either = await getKioskResponseApi(paymentToken);
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  Future<Either<Failures, KioskResponseDm>> getKioskResponseApi(
      String paymentToken) async {
    try {
      var response = await dioApiManger.postRequest(body: {
        "source": {"identifier": "AGGREGATOR", "subtype": "AGGREGATOR"},
        "payment_token": paymentToken
      }, endPoint: '/acceptance/payments/pay');
      return Right(KioskResponseDm.fromJson(response.data));
    } catch (error) {
      return Left(ServerError(errorMessage: error.toString()));
    }
  }
}
