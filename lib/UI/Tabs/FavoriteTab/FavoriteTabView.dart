import 'package:e_commerce_application/Core/DI.dart';
import 'package:e_commerce_application/Core/Utils/Assets.dart';
import 'package:e_commerce_application/Core/Utils/Colors.dart';
import 'package:e_commerce_application/Core/Utils/ReusableWidgets/ListItemWidget.dart';
import 'package:e_commerce_application/Core/Utils/Routes.dart';
import 'package:e_commerce_application/UI/AppBarItems/CategoriesAppBar/Cubit/ProductsViewModel.dart';
import 'package:e_commerce_application/UI/Tabs/FavoriteTab/cubit/FavoriteTabViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoriteTabView extends StatefulWidget {
  FavoriteTabView({super.key});

  @override
  State<FavoriteTabView> createState() => _FavoriteTabViewState();
}

class _FavoriteTabViewState extends State<FavoriteTabView> {
  FavoriteTabViewModel viewModel =
      FavoriteTabViewModel(addToWishListUseCase: injectAddToWishListUseCase());
  ProductsViewModel productViewModel = ProductsViewModel(
      productsUseCase: injectAllProductsUseCase(),
      addToCartUseCase: injectAddToCartUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: viewModel..getWishList(),
      builder: (context, state) {
        return ListView.builder(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => Navigator.pushNamed(
                    context, Routes.productDetailsRouteName,
                    arguments: viewModel.productsList[index]),
                child: ListItemWidget(
                  productsEntity: viewModel.productsList[index],
                  bottomButton: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                    decoration: BoxDecoration(
                        color: MyColors.white,
                        border:
                            Border.all(color: MyColors.darkSlateGray, width: 1),
                        borderRadius: BorderRadius.circular(25.r)),
                    child: BlocBuilder(
                      bloc: productViewModel,
                      builder: (context, state) => InkWell(
                        onTap: () => productViewModel
                            .addToCart(viewModel.productsList[index].id ?? ''),
                        child: Text(
                          'Add to Cart',
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: MyColors.darkSlateGray,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  topButton: IconButton(
                      onPressed: () {
                        viewModel.removeFromWishList(
                            viewModel.productsList[index].id ?? '');
                        setState(() {});
                      },
                      icon: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: MyColors.white,
                              borderRadius: BorderRadius.circular(25.r)),
                          child: SvgPicture.asset(
                            Assets.deleteIcon,
                            color: MyColors.darkSlateGray,
                          ))),
                ),
              );
            },
            itemCount: viewModel.productsList.length);
      },
    );
  }
}
