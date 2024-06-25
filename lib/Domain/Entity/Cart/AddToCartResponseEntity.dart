import 'AddCartEntity.dart';

class AddToCartResponseEntity {
  AddToCartResponseEntity({
    this.status,
    this.message,
    this.numOfCartItems,
    this.statusMsg,
    this.data,
  });

  String? status;
  String? message;
  num? numOfCartItems;
  String? statusMsg;
  AddCartEntity? data;
}
