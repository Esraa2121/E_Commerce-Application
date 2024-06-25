import 'package:e_commerce_application/Domain/Entity/Categories%20or%20Brands/CategoriesOrBrandsEntity.dart';
import 'package:e_commerce_application/Domain/Entity/SubcategoryEntity.dart';

class GetAndRemoveFromCartEntity {
  GetAndRemoveFromCartEntity({
    this.status,
    this.numOfCartItems,
    this.statusMsg,
    this.message,
    this.data,
  });

  String? status;
  num? numOfCartItems;
  String? statusMsg;
  String? message;
  DataEntity? data;
}

class DataEntity {
  DataEntity({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });

  String? id;
  String? cartOwner;
  List<GetProductEntity>? products;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? totalCartPrice;
}

class GetProductEntity {
  GetProductEntity({
    this.count,
    this.id,
    this.product,
    this.price,
  });

  num? count;
  String? id;
  ProductEntity? product;
  num? price;
}

class ProductEntity {
  ProductEntity({
    this.subcategory,
    this.id,
    this.title,
    this.quantity,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
  });

  List<SubcategoryEntity>? subcategory;
  String? id;
  String? title;
  num? quantity;
  String? imageCover;
  CategoriesOrBrandsEntity? category;
  CategoriesOrBrandsEntity? brand;
  num? ratingsAverage;
}
