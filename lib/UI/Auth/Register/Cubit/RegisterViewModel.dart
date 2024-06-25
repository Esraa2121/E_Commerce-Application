import 'package:e_commerce_application/Domain/UseCase/RegisterUseCase.dart';
import 'package:e_commerce_application/UI/Auth/Register/Cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterViewModel extends Cubit<RegisterState> {
  //todo : hold data , handel logic
  RegisterViewModel({required this.registerUseCase})
      : super(RegisterLoadingState());
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RegisterUseCase registerUseCase;

  void register() async {
    emit(RegisterLoadingState());
    var either = await registerUseCase.invoke(
        nameController.text,
        emailController.text,
        passwordController.text,
        passwordController.text,
        phoneController.text);
    either.fold((error) {
      emit(RegisterErrorState(errorMessage: error.errorMessage));
    }, (response) {
      emit(RegisterSuccessState(registerResponseEntity: response));
    });
  }
}
