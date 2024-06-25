import 'package:dartz/dartz.dart';
import 'package:e_commerce_application/Core/Api/ApiManager.dart';
import 'package:e_commerce_application/Domain/Entity/Failures.dart';
import 'package:e_commerce_application/Domain/Entity/WishList/GetWishListEntity.dart';
import 'package:e_commerce_application/Domain/Entity/WishList/WishListEntity.dart';
import 'package:e_commerce_application/Domain/Repository/Data%20Source/WishListDataSource.dart';

class WishListDataSourceImpl implements WishListDataSource {
  ApiManager apiManager;

  WishListDataSourceImpl({required this.apiManager});

  Future<Either<Failures, WishListEntity>> addToWishList(
      String productId) async {
    var either = await apiManager.addToWishList(productId);
    return either.fold((error) {
      return Left(error);
    }, (response) {
      return Right(response);
    });
  }

  @override
  Future<Either<Failures, GetWishListEntity>> getWishList() async {
    var either = await apiManager.getWishList();
    return either.fold((error) {
      return Left(error);
    }, (response) {
      return Right(response);
    });
  }
}
