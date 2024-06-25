import 'package:e_commerce_application/Domain/UseCase/LoginUseCase.dart';
import 'package:e_commerce_application/UI/Auth/Login/Cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewModel extends Cubit<LoginState> {
  LoginUseCase loginUseCase;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginViewModel({required this.loginUseCase}) : super(LoginLoadingState());

  void login() async {
    emit(LoginLoadingState());
    var either = await loginUseCase.invoke(
        emailController.text, passwordController.text);
    either.fold((error) {
      emit(LoginErrorState(errorMessage: error.errorMessage));
    }, (response) {
      emit(LoginSuccessState(loginResponseEntity: response));
    });
  }
}
