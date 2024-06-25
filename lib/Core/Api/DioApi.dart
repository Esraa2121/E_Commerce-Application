import 'package:dio/dio.dart';

class DioApiManger {
  static late Dio dio;

  static Dio init() {
    dio = Dio(BaseOptions(baseUrl: 'https://accept.paymob.com/api'));
    return dio;
  }

  Future<Response> getRequest(
      {required String endPoint, Map<String, dynamic>? queryParameters}) async {
    var response = await init().get(endPoint, queryParameters: queryParameters);
    return response;
  }

  Future<Response> postRequest(
      {required String endPoint, Map<String, dynamic>? body}) async {
    var response = await init().post(endPoint, data: body);
    return response;
  }
}
