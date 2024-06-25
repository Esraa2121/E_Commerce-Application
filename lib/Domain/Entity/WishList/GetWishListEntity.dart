import 'package:e_commerce_application/Domain/Entity/Products/ProductsEntity.dart';

class GetWishListEntity {
  GetWishListEntity({
    this.status,
    this.statusMsg,
    this.message,
    this.count,
    this.data,
  });

  String? status;
  String? statusMsg;
  String? message;
  num? count;
  List<ProductsEntity>? data;
}
