import 'package:dartz/dartz.dart';
import 'package:e_commerce_application/Domain/Entity/Failures.dart';
import 'package:e_commerce_application/Domain/Entity/WishList/GetWishListEntity.dart';
import 'package:e_commerce_application/Domain/Entity/WishList/WishListEntity.dart';
import 'package:e_commerce_application/Domain/Repository/Data%20Source/WishListDataSource.dart';
import 'package:e_commerce_application/Domain/Repository/repository/WishListRepository.dart';

class WishListRepositoryImpl implements WishListRepository {
  WishListDataSource addToWishListDataSource;

  WishListRepositoryImpl({required this.addToWishListDataSource});

  Future<Either<Failures, WishListEntity>> addToWishList(String productId) {
    return addToWishListDataSource.addToWishList(productId);
  }

  @override
  Future<Either<Failures, GetWishListEntity>> getWishList() {
    return addToWishListDataSource.getWishList();
  }
}
