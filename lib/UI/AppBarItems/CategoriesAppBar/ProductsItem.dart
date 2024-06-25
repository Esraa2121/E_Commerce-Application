import 'package:e_commerce_application/Core/Utils/Assets.dart';
import 'package:e_commerce_application/Core/Utils/Colors.dart';
import 'package:e_commerce_application/Core/Utils/ReusableWidgets/AddToCartButton.dart';
import 'package:e_commerce_application/Core/Utils/ReusableWidgets/AddToFavoriteList.dart';
import 'package:e_commerce_application/Domain/Entity/Products/ProductsEntity.dart';
import 'package:e_commerce_application/UI/AppBarItems/CategoriesAppBar/Cubit/ProductsViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductsItem extends StatelessWidget {
  ProductsItem({super.key, required this.index, required this.productsEntity});

  ProductsEntity productsEntity;
  int index;
  List<Color> colors = [
    MyColors.honeydew,
    MyColors.lightYellow,
    MyColors.mistyRose,
    MyColors.lavender,
  ];

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<ProductsViewModel>(context);
    return Container(
      width: 191.w,
      height: 237.h,
      decoration: BoxDecoration(
          color: colors[index % 4],
          border: Border.all(width: 2, color: Colors.black26),
          borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          Column(
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
                        image: NetworkImage(productsEntity.imageCover ?? ''),
                        height: 128.h,
                        width: 191.w,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5.h,
                    left: 2.w,
                    child: AddToFavoriteList(
                      productId: productsEntity.id ?? '',
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productsEntity.title ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                          color: MyColors.darkSlateGray),
                    ),
                    Text(
                      'EGP ${productsEntity.price}',
                      style: TextStyle(fontSize: 14.sp, color: MyColors.salmon),
                    ),
                    Row(
                      children: [
                        Text(
                          'Review  (${productsEntity.ratingsAverage})',
                          style: TextStyle(
                              fontSize: 14.sp, color: MyColors.darkSlateGray),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        SvgPicture.asset(Assets.starIcon),
                        SizedBox(
                          width: 10.w,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          AddToCartButton(
            onTap: () {
              //todo call add to cart function from view model
              bloc.addToCart(productsEntity.id ?? '');
            },
          )
        ],
      ),
    );
  }
}
