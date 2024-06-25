import 'package:e_commerce_application/Domain/Entity/RegisterResponseEntity.dart';

abstract class RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
//todo: object of model
  RegisterResponseEntity registerResponseEntity;

  RegisterSuccessState({required this.registerResponseEntity});
}

class RegisterErrorState extends RegisterState {
  String errorMessage;

  RegisterErrorState({required this.errorMessage});
}
