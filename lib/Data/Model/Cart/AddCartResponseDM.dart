import 'package:e_commerce_application/Domain/Entity/Cart/AddToCartResponseEntity.dart';

import 'AddCartDM.dart';

class AddCartResponseDm extends AddToCartResponseEntity {
  AddCartResponseDm({
    super.status,
    super.message,
    super.numOfCartItems,
    super.statusMsg,
    super.data,
  });

  AddCartResponseDm.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    statusMsg = json['statusMsg'];
    data = json['data'] != null ? AddCartDM.fromJson(json['data']) : null;
  }
}
