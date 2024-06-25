import 'package:e_commerce_application/Core/Utils/Colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String buttonTitle;
  void Function()? onPressed;

  CustomButton({super.key, required this.buttonTitle, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              padding: const EdgeInsets.all(18),
              backgroundColor: MyColors.lightSeaGreen,
              foregroundColor: MyColors.white),
          child: Text(
            buttonTitle,
            style: const TextStyle(fontSize: 20),
          )),
    );
  }
}
