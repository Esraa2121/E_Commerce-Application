import 'package:dartz/dartz.dart';
import 'package:e_commerce_application/Domain/Entity/Failures.dart';
import 'package:e_commerce_application/Domain/Entity/WishList/GetWishListEntity.dart';
import 'package:e_commerce_application/Domain/Entity/WishList/WishListEntity.dart';

abstract class WishListRepository {
  Future<Either<Failures, WishListEntity>> addToWishList(String productId);

  Future<Either<Failures, GetWishListEntity>> getWishList();
}
