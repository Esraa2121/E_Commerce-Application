import 'package:e_commerce_application/Core/Utils/Colors.dart';
import 'package:e_commerce_application/Domain/Entity/Categories%20or%20Brands/CategoriesOrBrandsEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubCategoryItem extends StatelessWidget {
  SubCategoryItem({super.key, required this.productsEntity});

  CategoriesOrBrandsEntity productsEntity;

  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)!.settings.arguments as CategoriesOrBrandsEntity;
    return Container(
      margin: const EdgeInsets.all(10),
      width: 191.w,
      height: 137.h,
      decoration: BoxDecoration(
          color: MyColors.lightYellow,
          border: Border.all(width: 2, color: Colors.black26),
          borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          Row(
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: List.filled(
                            10,
                            const BoxShadow(
                                color: Colors.black12,
                                blurRadius: 2,
                                offset: Offset(2, 2))),
                        borderRadius: BorderRadius.circular(25.r),
                        color: MyColors.white),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25.r),
                      child: Image(
                        image: NetworkImage(args.image ?? ''),
                        height: 148.h,
                        width: 191.w,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 20.w,
              ),
              SizedBox(
                width: 150.w,
                child: Text(
                  productsEntity.name ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.sp,
                      color: MyColors.darkSlateGray),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
