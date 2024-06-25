import 'package:dartz/dartz.dart';
import 'package:e_commerce_application/Domain/Repository/repository/AuthRepository.dart';

import '../Entity/Failures.dart';
import '../Entity/RegisterResponseEntity.dart';

class RegisterUseCase {
  AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});

  Future<Either<Failures, RegisterResponseEntity>> invoke(String name,
      String email, String password, String rePassword, String phone) {
    return authRepository.register(name, email, password, rePassword, phone);
  }
}
