import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:e_commerce_application/UI/Home/Cubit/HomeStates.dart';
import 'package:e_commerce_application/UI/Tabs/FavoriteTab/FavoriteTabView.dart';
import 'package:e_commerce_application/UI/Tabs/HomeTab/HomeTabView.dart';
import 'package:e_commerce_application/UI/Tabs/ProfileTab/ProfileTabView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewModel extends Cubit<HomeStates> {
  var pageController = PageController(initialPage: 0);
  var controller = NotchBottomBarController(index: 0);

  List<Widget> bottomBarPages = [
    HomeTabView(),
    FavoriteTabView(),
    ProfileTabView()
  ];

  HomeViewModel() : super(HomeInitialState());

  void changeTabs(int newIndex) {
    emit(HomeInitialState());
    pageController.jumpToPage(newIndex);
    emit(ChangeHomeTabsState());
  }
}
