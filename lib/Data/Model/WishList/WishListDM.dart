import 'package:e_commerce_application/Domain/Entity/WishList/WishListEntity.dart';

class WishListDM extends WishListEntity {
  WishListDM({
    super.status,
    super.statusMsg,
    super.message,
    super.data,
  });

  WishListDM.fromJson(dynamic json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    data = json['data'] != null ? json['data'].cast<String>() : [];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['statusMsg'] = statusMsg;
    map['message'] = message;
    map['data'] = data;
    return map;
  }
}
