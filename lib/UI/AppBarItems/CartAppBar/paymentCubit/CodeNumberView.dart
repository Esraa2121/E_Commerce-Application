import 'package:e_commerce_application/Core/Api/ApiEndPoints.dart';
import 'package:e_commerce_application/Core/DI.dart';
import 'package:e_commerce_application/Core/Utils/Colors.dart';
import 'package:e_commerce_application/UI/AppBarItems/CartAppBar/CartView.dart';
import 'package:e_commerce_application/UI/AppBarItems/CartAppBar/paymentCubit/PaymentStates.dart';
import 'package:e_commerce_application/UI/AppBarItems/CartAppBar/paymentCubit/PaymentViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CodeNumberView extends StatelessWidget {
  CodeNumberView({super.key});

  PaymentViewModel viewModel =
      PaymentViewModel(paymentUseCase: injectPaymentUseCase());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder(
        bloc: viewModel..getToken(ApiEndPoints.API_KEY),
        builder: (context, state) {
          return Center(
              child: state is KioskSuccessPaymentState
                  ? Container(
                      margin: const EdgeInsets.all(25),
                      width: double.infinity,
                      height: 500.h,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: MyColors.darkSlateGray, width: 2),
                          borderRadius: BorderRadius.circular(25),
                          color: const Color(0xffECECEC)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset('assets/lottie/payment.json'),
                          Text(
                            'Amount: ${CartView.totalPrice} EGP',
                            style: TextStyle(
                                color: MyColors.darkSlateGray,
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Your Code: ${viewModel.responseEntity.id}',
                            style: TextStyle(
                                color: MyColors.darkSlateGray,
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Expiration date: ${DateTime.now().day + 3}/${DateTime.now().month}/${DateTime.now().year}',
                            style: TextStyle(
                                color: MyColors.darkSlateGray,
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  : CircularProgressIndicator());
        },
      ),
    );
  }
}
