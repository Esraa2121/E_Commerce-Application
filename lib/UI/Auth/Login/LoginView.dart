import 'package:e_commerce_application/Core/DI.dart';
import 'package:e_commerce_application/Core/Utils/Assets.dart';
import 'package:e_commerce_application/Core/Utils/Colors.dart';
import 'package:e_commerce_application/Core/Utils/DialogUtils.dart';
import 'package:e_commerce_application/Core/Utils/ReusableWidgets/CustomButton.dart';
import 'package:e_commerce_application/Core/Utils/ReusableWidgets/CustomTextField.dart';
import 'package:e_commerce_application/Core/Utils/Routes.dart';
import 'package:e_commerce_application/Core/Utils/ToastMessage.dart';
import 'package:e_commerce_application/UI/Auth/Login/Cubit/LoginViewModel.dart';
import 'package:e_commerce_application/UI/Auth/Login/Cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/PrefsHelper.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  LoginViewModel viewModel = LoginViewModel(loginUseCase: injectLoginUseCase());

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      child: Stack(
        children: [
          Image.asset(
            Assets.background,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          BlocListener(
            bloc: viewModel,
            listener: (context, state) {
              if (state is LoginLoadingState) {
                DialogUtils.showLoadingAlertDialog(context, 'Loading...');
              } else if (state is LoginSuccessState) {
                DialogUtils.hideDialoge(context);
                PrefsHelper.saveData(
                    key: 'token',
                    value: state.loginResponseEntity?.token ?? '');
                ToastMessage.showToastMessage(
                  message:
                      "Login successfully\n Welcome ${state.loginResponseEntity.user?.name ?? ' '}",
                  toastColor: MyColors.lightSeaGreen,
                );

                Navigator.pushReplacementNamed(
                  context,
                  Routes.homeRouteName,
                );
              } else if (state is LoginErrorState) {
                DialogUtils.hideDialoge(context);
                ToastMessage.showToastMessage(
                  message: state.errorMessage,
                  toastColor: MyColors.salmon,
                );
              }
            },
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Form(
                  key: viewModel.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 80.h,
                      ),
                      const Align(
                        alignment: Alignment.center,
                        child: Text('Wonders',
                            style: TextStyle(
                              color: MyColors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10, bottom: 10),
                        child: const Text(
                            'Welcome Back!\n        Please sign in with your mail',
                            style: TextStyle(
                              color: MyColors.white,
                              fontSize: 20,
                            )),
                      ),
                      CustomTextField(
                        textFieldColor: MyColors.white,
                        titleColor: MyColors.white,
                        title: 'User Name',
                        hintTitle: 'enter your name',
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "This field can't be empty";
                          }
                          if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return "Enter valid email";
                          }
                          return null;
                        },
                        controller: viewModel.emailController,
                      ),
                      CustomTextField(
                        textFieldColor: MyColors.white,
                        titleColor: MyColors.white,
                        title: 'Password',
                        hintTitle: 'enter your password',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "This field can't be empty";
                          }
                          if (value.length < 8) {
                            return "Password should be at least 8 char";
                          }
                          return null;
                        },
                        controller: viewModel.passwordController,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forgot password',
                            style:
                                TextStyle(color: MyColors.white, fontSize: 18),
                          ),
                        ),
                      ),
                      CustomButton(
                          buttonTitle: 'Login',
                          onPressed: () {
                            if (viewModel.formKey.currentState?.validate() ==
                                true) {
                              viewModel.login();
                            }
                          }),
                      TextButton(
                        onPressed: () => Navigator.pushNamed(
                            context, Routes.registerRouteName),
                        child: const Text(
                          'Don’t have an account? Create Account',
                          style: TextStyle(color: MyColors.white, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
