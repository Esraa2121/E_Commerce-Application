//todo : view model => object use case
//todo : use case => object repository
//todo : repository => object data source
//todo : data source => object api

import 'package:e_commerce_application/Core/Api/ApiManager.dart';
import 'package:e_commerce_application/Core/Api/DioApi.dart';
import 'package:e_commerce_application/Data/Repository/Data%20Source/AuthDataSourceImpl.dart';
import 'package:e_commerce_application/Data/Repository/Data%20Source/CartDataSourceImpl.dart';
import 'package:e_commerce_application/Data/Repository/Data%20Source/GetAllCategoriesOrBrandsDataSourceImpl.dart';
import 'package:e_commerce_application/Data/Repository/Data%20Source/GetAllProductsDataSourceImpl.dart';
import 'package:e_commerce_application/Data/Repository/Data%20Source/PaymentDataSourceImpl.dart';
import 'package:e_commerce_application/Data/Repository/Data%20Source/WishListDataSourceImpl.dart';
import 'package:e_commerce_application/Data/Repository/repository/AuthRepositoryImpl.dart';
import 'package:e_commerce_application/Data/Repository/repository/CartRepositoryImpl.dart';
import 'package:e_commerce_application/Data/Repository/repository/GetAllCategoriesRepositoryImpl.dart';
import 'package:e_commerce_application/Data/Repository/repository/GetAllProductsRepositoryImpl.dart';
import 'package:e_commerce_application/Data/Repository/repository/PaymentRepositoryImpl.dart';
import 'package:e_commerce_application/Data/Repository/repository/WishListRepositoryImpl.dart';
import 'package:e_commerce_application/Domain/Repository/Data%20Source/AuthDataSource.dart';
import 'package:e_commerce_application/Domain/Repository/Data%20Source/CartDataSource.dart';
import 'package:e_commerce_application/Domain/Repository/Data%20Source/GetAllCategoriesOrBrandsDataSource.dart';
import 'package:e_commerce_application/Domain/Repository/Data%20Source/GetAllProductsDataSource.dart';
import 'package:e_commerce_application/Domain/Repository/Data%20Source/PaymentDataSource.dart';
import 'package:e_commerce_application/Domain/Repository/Data%20Source/WishListDataSource.dart';
import 'package:e_commerce_application/Domain/Repository/repository/AuthRepository.dart';
import 'package:e_commerce_application/Domain/Repository/repository/CartRepository.dart';
import 'package:e_commerce_application/Domain/Repository/repository/GetAllCategoriesOrBrandsRepository.dart';
import 'package:e_commerce_application/Domain/Repository/repository/GetAllProductsRepository.dart';
import 'package:e_commerce_application/Domain/Repository/repository/PaymentRepository.dart';
import 'package:e_commerce_application/Domain/Repository/repository/WishListRepository.dart';
import 'package:e_commerce_application/Domain/UseCase/AddToCartUseCase.dart';
import 'package:e_commerce_application/Domain/UseCase/AddToWishListUseCase.dart';
import 'package:e_commerce_application/Domain/UseCase/GetAllBrandsUseCase.dart';
import 'package:e_commerce_application/Domain/UseCase/GetAllCategoriesUseCase.dart';
import 'package:e_commerce_application/Domain/UseCase/GetAllProductsUseCase.dart';
import 'package:e_commerce_application/Domain/UseCase/GetCartUseCase.dart';
import 'package:e_commerce_application/Domain/UseCase/GetSubCategoryUseCase.dart';
import 'package:e_commerce_application/Domain/UseCase/LoginUseCase.dart';
import 'package:e_commerce_application/Domain/UseCase/PaymentUseCase.dart';
import 'package:e_commerce_application/Domain/UseCase/RegisterUseCase.dart';
import 'package:e_commerce_application/Domain/UseCase/RemoveFromCartUseCase.dart';
import 'package:e_commerce_application/Domain/UseCase/UpdateCartUseCase.dart';

RegisterUseCase injectRegisterUseCase() {
  return RegisterUseCase(authRepository: injectAuthRepository());
}

LoginUseCase injectLoginUseCase() {
  return LoginUseCase(authRepository: injectAuthRepository());
}

GetAllCategoriesUseCase injectAllCategoriesUseCase() {
  return GetAllCategoriesUseCase(
      allCategoriesRepository: injectGetAllCategoriesRepository());
}

GetSubCategoryUseCase injectSubCategoryUseCase() {
  return GetSubCategoryUseCase(
      allCategoriesRepository: injectGetAllCategoriesRepository());
}

GetAllBrandsUseCase injectAllBrandsUseCase() {
  return GetAllBrandsUseCase(
      allCategoriesRepository: injectGetAllCategoriesRepository());
}

GetAllProductsUseCase injectAllProductsUseCase() {
  return GetAllProductsUseCase(
      allProductsRepository: injectGetAllProductsRepository());
}

GetAllProductsRepository injectGetAllProductsRepository() {
  return GetAllProductsRepositoryImpl(
      allProductsDataSource: injectProductsDataSource());
}

GetAllProductsDataSource injectProductsDataSource() {
  return GetAllProductsDataSourceImpl(apiManager: ApiManager.getInstance());
}

GetAllCategoriesOrBrandsRepository injectGetAllCategoriesRepository() {
  return GetAllCategoriesRepositoryImpl(
      allCategoriesOrBrandsDataSource: injectAllCategoriesDataSource());
}

GetAllCategoriesOrBrandsDataSource injectAllCategoriesDataSource() {
  return GetAllCategoriesOrBrandsDataSourceImpl(
      apiManager: ApiManager.getInstance());
}

AuthRepository injectAuthRepository() {
  return AuthRepositoryImpl(authDataSource: injectAuthDataSource());
}

AuthDataSource injectAuthDataSource() {
  return AuthDataSourceImpl(apiManager: ApiManager.getInstance());
}

AddToCartUseCase injectAddToCartUseCase() {
  return AddToCartUseCase(addToCartRepository: injectAddToCartRepository());
}

RemoveFromCartUseCase injectRemoveFromCartUseCase() {
  return RemoveFromCartUseCase(cartRepository: injectAddToCartRepository());
}

GetCartUseCase injectGetCartUseCase() {
  return GetCartUseCase(cartRepository: injectAddToCartRepository());
}

UpdateCartUseCase injectUpdateCartUseCase() {
  return UpdateCartUseCase(cartRepository: injectAddToCartRepository());
}

CartRepository injectAddToCartRepository() {
  return CartRepositoryImpl(cartDataSource: injectAddToCartDataSource());
}

CartDataSource injectAddToCartDataSource() {
  return CartDataSourceImpl(apiManager: ApiManager.getInstance());
}

AddToWishListUseCase injectAddToWishListUseCase() {
  return AddToWishListUseCase(
      wishListRepository: injectAddToWishListRepository());
}

WishListRepository injectAddToWishListRepository() {
  return WishListRepositoryImpl(
      addToWishListDataSource: injectAddToWishListDataSource());
}

WishListDataSource injectAddToWishListDataSource() {
  return WishListDataSourceImpl(apiManager: ApiManager.getInstance());
}

PaymentUseCase injectPaymentUseCase() {
  return PaymentUseCase(paymentRepository: injectPaymentRepository());
}

PaymentRepository injectPaymentRepository() {
  return PaymentRepositoryImpl(paymentDataSource: injectPaymentDataSource());
}

PaymentDataSource injectPaymentDataSource() {
  return PaymentDataSourceImpl(dioApiManger: DioApiManger());
}
