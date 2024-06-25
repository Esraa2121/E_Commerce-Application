import 'package:e_commerce_application/Domain/Entity/Products/ProductsEntity.dart';

class ProductsResponseEntity {
  ProductsResponseEntity({
    this.results,
    this.data,
  });

  num? results;
  List<ProductsEntity>? data;
}
