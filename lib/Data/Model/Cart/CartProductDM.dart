import 'package:e_commerce_application/Domain/Entity/Cart/CartProductEntity.dart';

class CartProductDM extends CartProductEntity {
  CartProductDM({
    super.count,
    super.id,
    super.product,
    super.price,
  });

  CartProductDM.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['_id'] = id;
    map['product'] = product;
    map['price'] = price;
    return map;
  }
}
