import 'package:e_commerce_application/Data/Model/Categories%20or%20Brands/CategoriesOrBrandsDM.dart';
import 'package:e_commerce_application/Data/Model/ProductsDM/SubcategoryDM.dart';
import 'package:e_commerce_application/Domain/Entity/Cart/GetAndRemoveFromCartEntity.dart';

class GetAndRemoveFromCartDM extends GetAndRemoveFromCartEntity {
  GetAndRemoveFromCartDM({
    super.status,
    super.numOfCartItems,
    super.statusMsg,
    super.message,
    super.data,
  });

  GetAndRemoveFromCartDM.fromJson(dynamic json) {
    status = json['status'];
    numOfCartItems = json['numOfCartItems'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data extends DataEntity {
  Data({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,
  });

  Data.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

class Products extends GetProductEntity {
  Products({
    super.count,
    super.id,
    super.product,
    super.price,
  });

  Products.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
    price = json['price'];
  }
}

class Product extends ProductEntity {
  Product({
    super.subcategory,
    super.id,
    super.title,
    super.quantity,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
  });

  Product.fromJson(dynamic json) {
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(SubcategoryDM.fromJson(v));
      });
    }
    id = json['_id'];
    title = json['title'];
    quantity = json['quantity'];
    imageCover = json['imageCover'];
    category = json['category'] != null
        ? CategoriesOrBrandsDM.fromJson(json['category'])
        : null;
    brand = json['brand'] != null
        ? CategoriesOrBrandsDM.fromJson(json['brand'])
        : null;
    ratingsAverage = json['ratingsAverage'];
    id = json['id'];
  }
}
