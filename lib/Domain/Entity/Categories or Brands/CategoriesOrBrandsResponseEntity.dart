import 'CategoriesOrBrandsEntity.dart';

class CategoriesOrBrandsResponseEntity {
  CategoriesOrBrandsResponseEntity({
    this.results,
    this.data,
  });

  int? results;
  List<CategoriesOrBrandsEntity>? data;
}
