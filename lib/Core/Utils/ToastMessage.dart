import 'package:e_commerce_application/Core/Utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastMessage {
  static void showToastMessage(
      {required String message, required Color toastColor}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: toastColor,
        textColor: MyColors.white,
        fontSize: 16.0);
  }
}
