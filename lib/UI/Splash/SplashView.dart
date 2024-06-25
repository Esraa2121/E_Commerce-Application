import 'dart:async';

import 'package:e_commerce_application/Core/Utils/Assets.dart';
import 'package:e_commerce_application/Core/Utils/Colors.dart';
import 'package:e_commerce_application/Core/Utils/Routes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../Core/PrefsHelper.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 8), () {
      Navigator.pushReplacementNamed(
          context,
          PrefsHelper.getData(key: 'token') != null
              ? Routes.homeRouteName
              : Routes.loginRouteName);
    });
    return Scaffold(
      //https://lottie.host/e7214c83-d3ad-46a7-8ef0-471ef3af2088/0xp3SXM1cF.json
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(Assets.appSplashScreen),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Wonders',
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                foreground: Paint()
                  ..shader = const LinearGradient(
                    colors: [
                      MyColors.turquoise,
                      MyColors.lightSeaGreen,
                      MyColors.darkSlateGray
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.bottomRight,
                  ).createShader(const Rect.fromLTWH(0.0, 100.0, 320.0, 80.0))),
          ),
        ],
      )),
    );
  }
}
