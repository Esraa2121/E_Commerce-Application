import 'package:e_commerce_application/Core/Utils/Colors.dart';
import 'package:e_commerce_application/Domain/Entity/Categories%20or%20Brands/CategoriesOrBrandsEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesOrBrandsItem extends StatelessWidget {
  CategoriesOrBrandsItem({super.key, required this.categoriesEntity});

  CategoriesOrBrandsEntity categoriesEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: CircleAvatar(
            backgroundColor: MyColors.lavender,
            backgroundImage: NetworkImage(categoriesEntity.image ?? ""),
            radius: 60.r,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Expanded(
          flex: 2,
          child: Text(
            categoriesEntity.name ?? "",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              color: MyColors.darkSlateGray,
            ),
          ),
        )
      ],
    );
  }
}
