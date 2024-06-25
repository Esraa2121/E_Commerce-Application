import 'package:e_commerce_application/Domain/Entity/Categories%20or%20Brands/CategoriesOrBrandsEntity.dart';
import 'package:e_commerce_application/UI/Tabs/HomeTab/Categories%20or%20Brands/CategoriesOrBrandsItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesOrBrandsSection extends StatelessWidget {
  CategoriesOrBrandsSection({super.key, required this.categoriesEntity});

  List<CategoriesOrBrandsEntity> categoriesEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      child: GridView.builder(
          itemCount: categoriesEntity.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CategoriesOrBrandsItem(
              categoriesEntity: categoriesEntity[index],
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 16, mainAxisSpacing: 16, crossAxisCount: 2)),
    );
  }
}
