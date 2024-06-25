import 'package:badges/badges.dart' as badges;
import 'package:e_commerce_application/Core/DI.dart';
import 'package:e_commerce_application/Core/PrefsHelper.dart';
import 'package:e_commerce_application/Core/Utils/Assets.dart';
import 'package:e_commerce_application/Core/Utils/Colors.dart';
import 'package:e_commerce_application/Core/Utils/DialogUtils.dart';
import 'package:e_commerce_application/Core/Utils/Routes.dart';
import 'package:e_commerce_application/UI/AppBarItems/CategoriesAppBar/Cubit/ProductsViewModel.dart';
import 'package:e_commerce_application/UI/AppBarItems/CategoriesAppBar/Cubit/States.dart';
import 'package:e_commerce_application/UI/AppBarItems/CategoriesAppBar/ProductsItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductsView extends StatelessWidget {
  ProductsView({super.key});

  ProductsViewModel viewModel = ProductsViewModel(
      productsUseCase: injectAllProductsUseCase(),
      addToCartUseCase: injectAddToCartUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsViewModel>(
      create: (context) => viewModel..getAllProducts(),
      child: BlocBuilder<ProductsViewModel, ProductsStates>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                iconSize: 55,
                icon: SvgPicture.asset(Assets.categoryIcon),
                onPressed: () {
                  Navigator.pushNamed(context, Routes.categoriesRouteName);
                },
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: badges.Badge(
                    badgeContent: Text(viewModel.numOfCartItems.toString()),
                    showBadge: true,
                    ignorePointer: false,
                    badgeAnimation: const badges.BadgeAnimation.scale(),
                    child: IconButton(
                      icon: SvgPicture.asset(Assets.cartIcon),
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.cartRouteName,
                            arguments: viewModel.productsList);
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: IconButton(
                    icon: SvgPicture.asset(Assets.searchIcon),
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: IconButton(
                    icon: const Icon(Icons.logout_outlined),
                    onPressed: () {
                      PrefsHelper.clearData(key: 'token');
                      DialogUtils.showConfirmAlertDialog(
                        context: context,
                        message: 'You want to logout',
                        onCancelClick: () => Navigator.pop(context),
                        onConfirmClick: () => Navigator.pushNamedAndRemoveUntil(
                            context, Routes.loginRouteName, (route) => false),
                      );
                    },
                  ),
                )
              ],
            ),
            body: state is ProductsLoadingState ||
                    viewModel.productsList.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(
                      color: MyColors.turquoise,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2 / 2.4,
                          crossAxisSpacing: 16.w,
                          mainAxisSpacing: 16.w),
                      itemCount: viewModel.productsList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () => Navigator.pushNamed(
                            context, Routes.productDetailsRouteName,
                            arguments: viewModel.productsList[index]),
                        child: ProductsItem(
                          productsEntity: viewModel.productsList[index],
                          index: index,
                        ),
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
