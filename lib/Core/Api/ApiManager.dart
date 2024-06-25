import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_application/Core/Api/ApiEndPoints.dart';
import 'package:e_commerce_application/Core/PrefsHelper.dart';
import 'package:e_commerce_application/Data/Model/Auth/Request/LoginReuest.dart';
import 'package:e_commerce_application/Data/Model/Auth/Request/RegisterRequest.dart';
import 'package:e_commerce_application/Data/Model/Auth/Response/Login/LoginResponseDm.dart';
import 'package:e_commerce_application/Data/Model/Auth/Response/Register/RegisterResponseDm.dart';
import 'package:e_commerce_application/Data/Model/Cart/AddCartResponseDM.dart';
import 'package:e_commerce_application/Data/Model/Cart/GetAndRemoveFromCartDM.dart';
import 'package:e_commerce_application/Data/Model/Categories%20or%20Brands/CategoriesOrBrandsResponseDm.dart';
import 'package:e_commerce_application/Data/Model/ProductsDM/ProductsResponseDM.dart';
import 'package:e_commerce_application/Data/Model/WishList/GetWishListDM.dart';
import 'package:e_commerce_application/Data/Model/WishList/WishListDM.dart';
import 'package:e_commerce_application/Domain/Entity/Failures.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  ApiManager._();

  static ApiManager? _apiManager;

  static ApiManager getInstance() {
    _apiManager ??= ApiManager._();
    return _apiManager!;
  }

  Future<Either<Failures, RegisterResponseDm>> register(String name,
      String email, String password, String rePassword, String phone) async {
    //https://ecommerce.routemisr.com/api/v1/auth/signup
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiEndPoints.baseUrl, ApiEndPoints.registerEndPoint);
      var registerRequest = RegisterRequest(
        email: email,
        name: name,
        password: password,
        phone: phone,
        rePassword: rePassword,
      );
      var response = await http.post(url, body: registerRequest.toJson());
      var registerResponse =
          RegisterResponseDm.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(registerResponse);
      } else {
        return Left(ServerError(errorMessage: registerResponse.message!));
      }
    } else {
      return Left(NetworkError(errorMessage: 'No connection'));
    }
  }

  Future<Either<Failures, LoginResponseDm>> login(
      String email, String password) async {
    //https://ecommerce.routemisr.com/api/v1/auth/signin
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiEndPoints.baseUrl, ApiEndPoints.loginEndPoint);
      var loginRequest = LoginReuest(email: email, password: password);
      var response = await http.post(url, body: loginRequest.toJson());
      var loginResponse = LoginResponseDm.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return right(loginResponse);
      } else {
        return Left(ServerError(errorMessage: loginResponse.message ?? ''));
      }
    } else {
      return Left(NetworkError(errorMessage: 'No connection'));
    }
  }

  Future<Either<Failures, CategoriesOrBrandsResponseDm>>
      getAllCategories() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url =
          Uri.https(ApiEndPoints.baseUrl, ApiEndPoints.allCategoriesEndPoint);
      var response = await http.get(url);
      var getCategoriesResponse =
          CategoriesOrBrandsResponseDm.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return right(getCategoriesResponse);
      } else {
        return Left(
            ServerError(errorMessage: getCategoriesResponse.message ?? ''));
      }
    } else {
      return Left(NetworkError(errorMessage: 'No connection'));
    }
  }

  Future<Either<Failures, CategoriesOrBrandsResponseDm>> getAllBrands() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiEndPoints.baseUrl, ApiEndPoints.allBrandsEndPoint);
      var response = await http.get(url);
      var getCategoriesResponse =
          CategoriesOrBrandsResponseDm.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return right(getCategoriesResponse);
      } else {
        return Left(
            ServerError(errorMessage: getCategoriesResponse.message ?? ''));
      }
    } else {
      return Left(NetworkError(errorMessage: 'No connection'));
    }
  }

  Future<Either<Failures, ProductsResponseDM>> getAllProducts() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url =
          Uri.https(ApiEndPoints.baseUrl, ApiEndPoints.allProductsEndPoint);
      var response = await http.get(url);
      var getProductsResponse =
          ProductsResponseDM.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return right(getProductsResponse);
      } else {
        return Left(
            ServerError(errorMessage: getProductsResponse.message ?? ''));
      }
    } else {
      return Left(NetworkError(errorMessage: 'No connection'));
    }
  }

  Future<Either<Failures, AddCartResponseDm>> addToCart(
      String productId) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var token = PrefsHelper.getData(key: 'token');
      Uri url = Uri.https(ApiEndPoints.baseUrl, ApiEndPoints.addToCartEndPoint);
      var response = await http.post(url,
          body: {'productId': productId}, headers: {'token': token.toString()});
      var getCartResponse =
          AddCartResponseDm.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return right(getCartResponse);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: getCartResponse.message ?? ''));
      } else {
        return Left(ServerError(errorMessage: getCartResponse.message ?? ''));
      }
    } else {
      return Left(NetworkError(errorMessage: 'No connection'));
    }
  }

  Future<Either<Failures, GetAndRemoveFromCartDM>> getCart() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var token = PrefsHelper.getData(key: 'token');
      Uri url = Uri.https(ApiEndPoints.baseUrl, ApiEndPoints.addToCartEndPoint);
      var response = await http.get(url, headers: {'token': token.toString()});
      var getCartResponse =
          GetAndRemoveFromCartDM.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return right(getCartResponse);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: getCartResponse.message ?? ''));
      } else {
        return Left(ServerError(errorMessage: getCartResponse.message ?? ''));
      }
    } else {
      return Left(NetworkError(errorMessage: 'No connection'));
    }
  }

  Future<Either<Failures, WishListDM>> addToWishList(String productId) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var token = PrefsHelper.getData(key: 'token');
      Uri url = Uri.https(
          ApiEndPoints.baseUrl, ApiEndPoints.getAndAddToWishListEndPoint);
      var response = await http.post(url,
          body: {'productId': productId}, headers: {'token': token.toString()});
      var getWishListResponse = WishListDM.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return right(getWishListResponse);
      } else if (response.statusCode == 401) {
        return Left(
            ServerError(errorMessage: getWishListResponse.message ?? ''));
      } else {
        return Left(
            ServerError(errorMessage: getWishListResponse.message ?? ''));
      }
    } else {
      return Left(NetworkError(errorMessage: 'No connection'));
    }
  }

  Future<Either<Failures, GetWishListDm>> getWishList() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var token = PrefsHelper.getData(key: 'token');
      Uri url = Uri.https(
          ApiEndPoints.baseUrl, ApiEndPoints.getAndAddToWishListEndPoint);
      var response = await http.get(url, headers: {'token': token.toString()});
      var getWishListResponse =
          GetWishListDm.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return right(getWishListResponse);
      } else if (response.statusCode == 401) {
        return Left(
            ServerError(errorMessage: getWishListResponse.message ?? ''));
      } else {
        return Left(
            ServerError(errorMessage: getWishListResponse.message ?? ''));
      }
    } else {
      return Left(NetworkError(errorMessage: 'No connection'));
    }
  }

  Future<String> removeFromWishList(String id) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var token = PrefsHelper.getData(key: 'token');
      Uri url = Uri.https(
          ApiEndPoints.baseUrl, ApiEndPoints.removeWishListEndPoint + id);
      var response =
          await http.delete(url, headers: {'token': token.toString()});
      var removeWishListResponse =
          WishListDM.fromJson(jsonDecode(response.body));
      return removeWishListResponse.message ?? '';
    } else {
      return 'No Connection';
    }
  }

  Future<Either<Failures, CategoriesOrBrandsResponseDm>> getSubCategories(
      String id) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(
          ApiEndPoints.baseUrl, ApiEndPoints.subCategoriesEndPoint(id: id));
      var response = await http.get(url);
      var subCategoriesResponse =
          CategoriesOrBrandsResponseDm.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return right(subCategoriesResponse);
      } else {
        return Left(
            ServerError(errorMessage: subCategoriesResponse.message ?? ''));
      }
    } else {
      return Left(NetworkError(errorMessage: 'No connection'));
    }
  }

  Future<Either<Failures, GetAndRemoveFromCartDM>> removeSpecificCartItem(
      String id) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var token = PrefsHelper.getData(key: 'token');

      Uri url = Uri.https(
          ApiEndPoints.baseUrl, ApiEndPoints.removeFromCartEndPoint(id: id));
      var response =
          await http.delete(url, headers: {'token': token.toString()});
      var removeItemResponse =
          GetAndRemoveFromCartDM.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return right(removeItemResponse);
      } else {
        return Left(
            ServerError(errorMessage: removeItemResponse.message ?? ''));
      }
    } else {
      return Left(NetworkError(errorMessage: 'No connection'));
    }
  }

  Future<String> clearCart() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var token = PrefsHelper.getData(key: 'token');
      Uri url = Uri.https(ApiEndPoints.baseUrl, ApiEndPoints.addToCartEndPoint);
      var response =
          await http.delete(url, headers: {'token': token.toString()});
      var removeItemResponse =
          GetAndRemoveFromCartDM.fromJson(jsonDecode(response.body));
      return removeItemResponse.message ?? '';
    } else {
      return 'No connection';
    }
  }

  Future<Either<Failures, GetAndRemoveFromCartDM>> updateCartItem(
      String id, int count) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var token = PrefsHelper.getData(key: 'token');

      Uri url = Uri.https(
          ApiEndPoints.baseUrl, ApiEndPoints.removeFromCartEndPoint(id: id));
      var response = await http.put(url,
          body: {'count': '$count'}, headers: {'token': token.toString()});
      var removeItemResponse =
          GetAndRemoveFromCartDM.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return right(removeItemResponse);
      } else {
        return Left(
            ServerError(errorMessage: removeItemResponse.message ?? ''));
      }
    } else {
      return Left(NetworkError(errorMessage: 'No connection'));
    }
  }
}
