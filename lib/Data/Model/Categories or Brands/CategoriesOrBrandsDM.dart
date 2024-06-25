import 'package:e_commerce_application/Domain/Entity/Categories%20or%20Brands/CategoriesOrBrandsEntity.dart';

class CategoriesOrBrandsDM extends CategoriesOrBrandsEntity {
  CategoriesOrBrandsDM({
    super.id,
    super.name,
    super.slug,
    super.image,
    this.createdAt,
    this.updatedAt,
  });

  CategoriesOrBrandsDM.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  String? createdAt;
  String? updatedAt;
}
