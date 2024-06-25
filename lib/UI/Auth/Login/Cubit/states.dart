import 'package:e_commerce_application/Domain/Entity/LoginResponseEntity.dart';

abstract class LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  LoginResponseEntity loginResponseEntity;

  LoginSuccessState({required this.loginResponseEntity});
}

class LoginErrorState extends LoginState {
  String errorMessage;

  LoginErrorState({required this.errorMessage});
}
