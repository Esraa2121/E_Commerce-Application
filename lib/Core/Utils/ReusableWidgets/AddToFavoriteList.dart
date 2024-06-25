import 'package:e_commerce_application/Core/DI.dart';
import 'package:e_commerce_application/Core/Utils/Colors.dart';
import 'package:e_commerce_application/UI/Tabs/FavoriteTab/cubit/FavoriteTabViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddToFavoriteList extends StatelessWidget {
  AddToFavoriteList({required this.productId});

  String productId;
  FavoriteTabViewModel viewModel =
      FavoriteTabViewModel(addToWishListUseCase: injectAddToWishListUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: viewModel,
        builder: (context, state) {
          return InkWell(
            onTap: () {
              viewModel.addToWishList(productId);
            },
            child: Container(
                height: 40.h,
                width: 40.w,
                decoration: BoxDecoration(
                    color: MyColors.lightSeaGreen,
                    borderRadius: BorderRadius.circular(20)),
                child: const Icon(
                  Icons.favorite_border_rounded,
                  color: MyColors.white,
                )),
          );
        });
  }
}
