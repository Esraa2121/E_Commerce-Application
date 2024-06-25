import 'package:e_commerce_application/Data/Model/ProductsDM/ProductsDM.dart';
import 'package:e_commerce_application/Domain/Entity/WishList/GetWishListEntity.dart';

class GetWishListDm extends GetWishListEntity {
  GetWishListDm({
    super.status,
    super.statusMsg,
    super.message,
    super.count,
    super.data,
  });

  GetWishListDm.fromJson(dynamic json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    count = json['count'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ProductsDM.fromJson(v));
      });
    }
  }
}
