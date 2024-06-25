import 'package:e_commerce_application/Data/Model/Metadata.dart';
import 'package:e_commerce_application/Domain/Entity/Products/ProductsResponseEntity.dart';

import 'ProductsDM.dart';

class ProductsResponseDM extends ProductsResponseEntity {
  ProductsResponseDM({
    super.results,
    this.statusMsg,
    this.message,
    this.metadata,
    super.data,
  });

  ProductsResponseDM.fromJson(dynamic json) {
    results = json['results'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ProductsDM.fromJson(v));
      });
    }
  }

  String? statusMsg;
  String? message;
  Metadata? metadata;
}
