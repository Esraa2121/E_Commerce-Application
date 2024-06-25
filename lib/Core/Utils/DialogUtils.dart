import 'package:e_commerce_application/Core/Utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class DialogUtils {
  static void hideDialoge(BuildContext context) {
    Navigator.pop(context);
  }

  static void showLoadingAlertDialog(BuildContext context, String message) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.loading,
      title: 'Loading',
      text: message,
    );
  }

  static void showSuccessAlertDialog(BuildContext context, String message,
      {String confirmText = '', void Function()? onConfirm}) {
    QuickAlert.show(
      onConfirmBtnTap: onConfirm,
      confirmBtnText: confirmText,
      context: context,
      type: QuickAlertType.success,
      confirmBtnColor: MyColors.black,
      text: message,
    );
  }

  static void showConfirmAlertDialog(
      {required BuildContext context,
      required String message,
      void Function()? onConfirmClick,
      void Function()? onCancelClick}) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.confirm,
      text: message,
      confirmBtnText: 'Yes',
      cancelBtnText: 'No',
      onConfirmBtnTap: onConfirmClick,
      onCancelBtnTap: onCancelClick,
      confirmBtnColor: MyColors.turquoise,
    );
  }

  static void showErrorAlertDialog(BuildContext context, String message) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      confirmBtnColor: MyColors.black,
      title: 'Oops...',
      text: message,
    );
  }
}
