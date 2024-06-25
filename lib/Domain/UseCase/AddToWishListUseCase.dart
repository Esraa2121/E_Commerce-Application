import 'package:dartz/dartz.dart';
import 'package:e_commerce_application/Domain/Entity/WishList/GetWishListEntity.dart';
import 'package:e_commerce_application/Domain/Repository/repository/WishListRepository.dart';

import '../Entity/Failures.dart';
import '../Entity/WishList/WishListEntity.dart';

class AddToWishListUseCase {
  WishListRepository wishListRepository;

  AddToWishListUseCase({required this.wishListRepository});

  Future<Either<Failures, WishListEntity>> invoke(String productId) {
    return wishListRepository.addToWishList(productId);
  }

  Future<Either<Failures, GetWishListEntity>> callGetWishList() {
    return wishListRepository.getWishList();
  }
}
