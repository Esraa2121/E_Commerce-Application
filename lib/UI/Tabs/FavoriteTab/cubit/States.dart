import 'package:e_commerce_application/Domain/Entity/WishList/GetWishListEntity.dart';
import 'package:e_commerce_application/Domain/Entity/WishList/WishListEntity.dart';

abstract class WishListStates {}

class InitialWishListState extends WishListStates {}

class SuccessWishListState extends WishListStates {
  WishListEntity wishListEntity;

  SuccessWishListState({required this.wishListEntity});
}

class SuccessGetWishListState extends WishListStates {
  GetWishListEntity wishListEntity;

  SuccessGetWishListState({required this.wishListEntity});
}

class ErrorWishListState extends WishListStates {
  String errorMessage;

  ErrorWishListState({required this.errorMessage});
}

class LoadingWishListState extends WishListStates {
  String loadingMessage;

  LoadingWishListState({required this.loadingMessage});
}
