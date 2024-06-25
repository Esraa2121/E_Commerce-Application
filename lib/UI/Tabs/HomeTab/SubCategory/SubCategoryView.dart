import 'package:e_commerce_application/Core/DI.dart';
import 'package:e_commerce_application/Domain/Entity/Categories%20or%20Brands/CategoriesOrBrandsEntity.dart';
import 'package:e_commerce_application/UI/Tabs/HomeTab/SubCategory/SubCategoryItem.dart';
import 'package:e_commerce_application/UI/Tabs/HomeTab/SubCategory/cubit/SubCategoryViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubCategoryView extends StatelessWidget {
  SubCategoryView({super.key});

  SubCategoryViewModel viewModel =
      SubCategoryViewModel(subCategoryUseCase: injectSubCategoryUseCase());

  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)!.settings.arguments as CategoriesOrBrandsEntity;
    return BlocBuilder(
      bloc: viewModel..getSubCategoryById(args.id ?? ''),
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(args.name!),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: viewModel.categoriesList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    // onTap: () => Navigator.pushNamed(
                    //     context, Routes.productDetailsRouteName,
                    //     arguments: viewModel.categoriesList[index]),
                    child: SubCategoryItem(
                      productsEntity: viewModel.categoriesList[index],
                    ),
                  );
                }),
          ),
        );
      },
    );
  }
}
