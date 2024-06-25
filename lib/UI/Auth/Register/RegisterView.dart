import 'package:e_commerce_application/Core/DI.dart';
import 'package:e_commerce_application/Core/PrefsHelper.dart';
import 'package:e_commerce_application/Core/Utils/Assets.dart';
import 'package:e_commerce_application/Core/Utils/Colors.dart';
import 'package:e_commerce_application/Core/Utils/DialogUtils.dart';
import 'package:e_commerce_application/Core/Utils/ReusableWidgets/CustomButton.dart';
import 'package:e_commerce_application/Core/Utils/ReusableWidgets/CustomTextField.dart';
import 'package:e_commerce_application/Core/Utils/Routes.dart';
import 'package:e_commerce_application/Core/Utils/ToastMessage.dart';
import 'package:e_commerce_application/UI/Auth/Register/Cubit/RegisterViewModel.dart';
import 'package:e_commerce_application/UI/Auth/Register/Cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  RegisterViewModel viewModel =
      RegisterViewModel(registerUseCase: injectRegisterUseCase());

  @override
  Widget build(BuildContext context) {
    return Stack(
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
            if (state is RegisterLoadingState) {
              DialogUtils.showLoadingAlertDialog(
                  context, 'Waiting to load data');
            } else if (state is RegisterSuccessState) {
              DialogUtils.hideDialoge(context);
              PrefsHelper.saveData(
                  key: 'token',
                  value: state.registerResponseEntity?.token ?? '');
              PrefsHelper.saveData(
                  key: 'name',
                  value: state.registerResponseEntity?.user?.name ?? '');
              PrefsHelper.saveData(
                  key: 'email',
                  value: state.registerResponseEntity?.user?.email ?? '');
              ToastMessage.showToastMessage(
                message:
                    "Login successfully\n Welcome ${state.registerResponseEntity.user?.name ?? ' '}",
                toastColor: MyColors.lightSeaGreen,
              );
              Navigator.pushReplacementNamed(
                context,
                Routes.homeRouteName,
              );
            } else if (state is RegisterErrorState) {
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
                      height: 50.h,
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
                    CustomTextField(
                      textFieldColor: MyColors.white,
                      titleColor: MyColors.white,
                      title: 'Full Name',
                      hintTitle: 'enter your full name',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "This field can't be empty";
                        }
                        return null;
                      },
                      controller: viewModel.nameController,
                    ),
                    CustomTextField(
                      textFieldColor: MyColors.white,
                      titleColor: MyColors.white,
                      title: 'E-mail address',
                      hintTitle: 'enter your email address',
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
                      title: 'Mobile Number',
                      inputType: TextInputType.number,
                      hintTitle: 'enter your mobile no.',
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "This field can't be empty";
                        }
                        if (value.length < 11 || value.length > 11) {
                          return "accept only egypt phone numbers";
                        }
                        return null;
                      },
                      controller: viewModel.phoneController,
                    ),
                    CustomTextField(
                      textFieldColor: MyColors.white,
                      titleColor: MyColors.white,
                      inputType: TextInputType.visiblePassword,
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
                    CustomButton(
                        buttonTitle: 'Sign up',
                        onPressed: () {
                          if (viewModel.formKey.currentState?.validate() ==
                              true) {
                            viewModel.register();
                          }
                        })
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
