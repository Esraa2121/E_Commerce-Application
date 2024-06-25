import 'package:e_commerce_application/Core/DI.dart';
import 'package:e_commerce_application/Core/Utils/Colors.dart';
import 'package:e_commerce_application/Core/Utils/ReusableWidgets/RowSection.dart';
import 'package:e_commerce_application/Core/Utils/Routes.dart';
import 'package:e_commerce_application/UI/Tabs/HomeTab/Categories%20or%20Brands/CategoriesOrBrandsItem.dart';
import 'package:e_commerce_application/UI/Tabs/HomeTab/Categories%20or%20Brands/CategoriesOrBrandsSection.dart';
import 'package:e_commerce_application/UI/Tabs/HomeTab/Cubit/HomeTabViewModel.dart';
import 'package:e_commerce_application/UI/Tabs/HomeTab/Cubit/States.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTabView extends StatelessWidget {
  HomeTabView({super.key});

  HomeTabViewModel viewModel = HomeTabViewModel(
      allCategoriesUseCase: injectAllCategoriesUseCase(),
      allBrandsUseCase: injectAllBrandsUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel, HomeTabStates>(
      bloc: viewModel
        ..getAllCategories()
        ..getAllBrands(),
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              ImageSlideshow(
                width: double.infinity,
                height: 200,
                initialPage: 0,
                indicatorColor: MyColors.darkSlateGray,
                indicatorBackgroundColor: MyColors.white,
                indicatorBottomPadding: 20.h,
                autoPlayInterval: 3000,
                isLoop: true,
                children: viewModel.advertisements
                    .map((url) => Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(
                            url,
                            height: 200.h,
                            width: 398.w,
                            fit: BoxFit.fill,
                          ),
                        ))
                    .toList(),
              ),
              RowSection(
                title: 'Categories',
              ),
              if (state is AllCategoriesLoadingState)
                const CircularProgressIndicator(
                  color: MyColors.turquoise,
                )
              else if (state is AllCategoriesErrorState)
                Text(
                  '${state.error}!!',
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: MyColors.sandyBrown),
                )
              else
                SizedBox(
                  height: 300.h,
                  child: GridView.builder(
                      itemCount: viewModel.categoriesList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, Routes.subCategoryRouteName,
                                arguments: viewModel.categoriesList[index]);
                          },
                          child: CategoriesOrBrandsItem(
                            categoriesEntity: viewModel.categoriesList[index],
                          ),
                        );
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              crossAxisCount: 2)),
                ),
              Container(
                margin: const EdgeInsets.only(top: 20, right: 20, left: 20),
                color: MyColors.darkSlateGray,
                height: 2.h,
              ),
              Container(
                margin: const EdgeInsets.only(top: 2, right: 20, left: 20),
                color: MyColors.darkSlateGray,
                height: 2.h,
              ),
              RowSection(
                title: 'Brands',
              ),
              if (state is AllCategoriesLoadingState)
                const CircularProgressIndicator(
                  color: MyColors.turquoise,
                )
              else if (state is AllCategoriesErrorState)
                Text(
                  '${state.error}!!',
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: MyColors.sandyBrown),
                )
              else
                CategoriesOrBrandsSection(
                  categoriesEntity: viewModel.brandsList,
                ),
              SizedBox(
                height: 100.h,
              ),
            ],
          ),
        );
      },
    );
  }
}
