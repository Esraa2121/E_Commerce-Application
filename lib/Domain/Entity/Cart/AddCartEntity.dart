import 'CartProductEntity.dart';

class AddCartEntity {
  AddCartEntity({
    this.id,
    this.cartOwner,
    this.products,
    this.v,
    this.totalCartPrice,
  });

  String? id;
  String? cartOwner;
  List<CartProductEntity>? products;
  num? v;
  num? totalCartPrice;
}
