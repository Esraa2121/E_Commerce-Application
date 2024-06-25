import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:e_commerce_application/Core/PrefsHelper.dart';
import 'package:e_commerce_application/Core/Utils/Assets.dart';
import 'package:e_commerce_application/Core/Utils/Colors.dart';
import 'package:e_commerce_application/Core/Utils/DialogUtils.dart';
import 'package:e_commerce_application/Core/Utils/Routes.dart';
import 'package:e_commerce_application/UI/Home/Cubit/HomeStates.dart';
import 'package:e_commerce_application/UI/Home/Cubit/HomeViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewModel viewModel = HomeViewModel();

  @override
  void dispose() {
    viewModel.pageController.dispose();
    viewModel.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        child: BlocBuilder<HomeViewModel, HomeStates>(
          bloc: viewModel,
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
                          onConfirmClick: () =>
                              Navigator.pushNamedAndRemoveUntil(context,
                                  Routes.loginRouteName, (route) => false),
                        );
                      },
                    ),
                  )
                ],
              ),
              body: PageView(
                controller: viewModel.pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(viewModel.bottomBarPages.length,
                    (index) => viewModel.bottomBarPages[index]),
              ),
              extendBody: true,
              bottomNavigationBar: (viewModel.bottomBarPages.length <= 3)
                  ? AnimatedNotchBottomBar(
                      kBottomRadius: 20,
                      kIconSize: 30,
                      notchBottomBarController: viewModel.controller,
                      color: MyColors.darkSlateGray,
                      showLabel: false,
                      notchColor: MyColors.darkSlateGray,
                      //removeMargins: false,
                      bottomBarWidth: 500.w,
                      durationInMilliSeconds: 100,
                      bottomBarItems: [
                        BottomBarItem(
                          inActiveItem: SvgPicture.asset(
                            Assets.homaIcon,
                            color: Colors.grey,
                          ),
                          activeItem: SvgPicture.asset(
                            Assets.homaIcon,
                            color: Colors.white,
                          ),
                          itemLabel: 'Page 3',
                        ),
                        BottomBarItem(
                          inActiveItem: SvgPicture.asset(
                            Assets.favoriteIcon,
                            color: Colors.grey,
                          ),
                          activeItem: SvgPicture.asset(
                            Assets.favoriteIcon,
                            color: Colors.white,
                          ),
                          itemLabel: 'Page 3',
                        ),
                        BottomBarItem(
                          inActiveItem: SvgPicture.asset(
                            Assets.profileIcon,
                            color: Colors.grey,
                          ),
                          activeItem: SvgPicture.asset(
                            Assets.profileIcon,
                            color: Colors.white,
                          ),
                          itemLabel: 'Page 3',
                        ),
                      ],
                      onTap: (index) {
                        viewModel.changeTabs(index);
                      },
                    )
                  : null,
            );
          },
        ));
  }
}
