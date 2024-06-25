import 'package:e_commerce_application/Core/Utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddToCartButton extends StatelessWidget {
  void Function()? onTap;

  AddToCartButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: InkWell(
        onTap: onTap,
        child: Container(
            margin: const EdgeInsets.all(10),
            height: 40.h,
            width: 40.w,
            decoration: BoxDecoration(
              color: MyColors.lightSeaGreen,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: const Icon(
              Icons.add,
              color: MyColors.white,
            )),
      ),
    );
  }
}
