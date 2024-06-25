import 'package:e_commerce_application/Domain/Entity/Categories%20or%20Brands/CategoriesOrBrandsResponseEntity.dart';

import '../Metadata.dart';
import 'CategoriesOrBrandsDM.dart';

class CategoriesOrBrandsResponseDm extends CategoriesOrBrandsResponseEntity {
  CategoriesOrBrandsResponseDm({
    super.results,
    this.statusMsg,
    this.metadata,
    this.message,
    super.data,
  });

  CategoriesOrBrandsResponseDm.fromJson(dynamic json) {
    results = json['results'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CategoriesOrBrandsDM.fromJson(v));
      });
    }
  }

  String? statusMsg;
  String? message;
  Metadata? metadata;
}
