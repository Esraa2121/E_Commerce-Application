import 'package:e_commerce_application/Core/Utils/Colors.dart';
import 'package:e_commerce_application/Domain/Entity/Products/ProductsEntity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListItemWidget extends StatelessWidget {
  ListItemWidget(
      {super.key,
      required this.topButton,
      required this.bottomButton,
      this.productsEntity});

  ProductsEntity? productsEntity;
  Widget? bottomButton;
  Widget? topButton;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(width: 2, color: MyColors.lightSeaGreen),
              color: MyColors.darkSlateGray,
              borderRadius: BorderRadius.circular(20.r)),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: MyColors.white,
                    borderRadius: BorderRadius.circular(20.r)),
                child: Image.network(
                  productsEntity?.imageCover ?? '',
                  height: 113.h,
                  width: 120.w,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 18.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 150.w,
                      child: Text(
                        productsEntity?.title ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 15,
                            color: MyColors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text('${productsEntity?.price ?? 0}',
                        style: const TextStyle(
                            fontSize: 15,
                            color: MyColors.white,
                            fontWeight: FontWeight.normal))
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 270.w,
          right: 15.w,
          top: 100.h,
          child: Align(alignment: Alignment.bottomRight, child: bottomButton),
        ),
        Positioned(
          left: 270.w,
          right: 25.w,
          bottom: 80.h,
          child: Align(alignment: Alignment.topRight, child: topButton),
        )
      ],
    );
  }
}
