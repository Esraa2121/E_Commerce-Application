import 'package:e_commerce_application/Core/DI.dart';
import 'package:e_commerce_application/Core/Utils/Assets.dart';
import 'package:e_commerce_application/Core/Utils/Colors.dart';
import 'package:e_commerce_application/Core/Utils/ReusableWidgets/AddToFavoriteList.dart';
import 'package:e_commerce_application/Core/Utils/ReusableWidgets/IncrementAndDecrementWidget.dart';
import 'package:e_commerce_application/Domain/Entity/Products/ProductsEntity.dart';
import 'package:e_commerce_application/UI/AppBarItems/CategoriesAppBar/Cubit/ProductsViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:readmore/readmore.dart';

class ProductDetails extends StatefulWidget {
  ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    ProductsViewModel viewModel = ProductsViewModel(
        productsUseCase: injectAllProductsUseCase(),
        addToCartUseCase: injectAddToCartUseCase());
    var args = ModalRoute.of(context)!.settings.arguments as ProductsEntity;
    return Scaffold(
      backgroundColor: MyColors.lightYellow,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          args.title ?? '',
          style: const TextStyle(
              color: MyColors.darkSlateGray, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: 408.h,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: args.images!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            args.imageCover = args.images![index].contains(
                                    'https://ecommerce.routemisr.com/Route-Academy-products/')!
                                ? args.images![index] ?? ''
                                : 'https://ecommerce.routemisr.com/Route-Academy-products/${args.images?[index] ?? ''}';
                            setState(() {});
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: MyColors.white,
                                border: Border.all(color: MyColors.black)),
                            margin: const EdgeInsets.all(5),
                            height: 80.h,
                            width: 90.w,
                            child: Image.network(args.images![index].contains(
                                    'https://ecommerce.routemisr.com/Route-Academy-products/')!
                                ? args.images![index] ?? ''
                                : 'https://ecommerce.routemisr.com/Route-Academy-products/${args.images?[index] ?? ''}'),
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                      flex: 3,
                      child: Stack(
                        children: [
                          Image.network(args.imageCover ?? ''),
                          Positioned(
                              top: 5.h,
                              right: 30.w,
                              child: AddToFavoriteList(
                                productId: args.id ?? '',
                              )),
                        ],
                      ))
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 430.h,
              decoration: BoxDecoration(
                  color: MyColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26.withOpacity(0.7),
                      spreadRadius: 8,
                      blurRadius: 9,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.r),
                      topLeft: Radius.circular(20.r))),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 250.w,
                              child: Text(
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  args.title ?? '',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 25.sp)),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              '(${args.sold}) Sold',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 20.sp),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(Assets.starIcon),
                                Text(
                                  '${args.ratingsAverage}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20.sp),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text('EGP ${args.price}',
                            style: TextStyle(
                                color: MyColors.salmon,
                                fontWeight: FontWeight.w600,
                                fontSize: 24.sp)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Description',
                          style: TextStyle(
                              fontSize: 25,
                              color: MyColors.darkSlateGray,
                              fontWeight: FontWeight.bold),
                        ),
                        ReadMoreText(
                          args.description ?? '',
                          trimMode: TrimMode.Line,
                          trimLines: 2,
                          colorClickableText: MyColors.sandyBrown,
                          trimCollapsedText: 'Show more',
                          trimExpandedText: 'Show less',
                          moreStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: MyColors.darkSlateGray,
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SvgPicture.asset(
                                    Assets.cartIcon,
                                    color: MyColors.white,
                                  ),
                                  Text(
                                    '    Add to Cart',
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        color: MyColors.honeydew),
                                  )
                                ],
                              )),
                          onTap: () {
                            viewModel.addToCart(args.id ?? '');
                          },
                        ),
                        IncrementAndDecrementWidget()
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
