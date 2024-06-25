import 'package:dartz/dartz.dart';
import 'package:e_commerce_application/Domain/Repository/repository/AuthRepository.dart';

import '../Entity/Failures.dart';
import '../Entity/LoginResponseEntity.dart';

class LoginUseCase {
  // todo : want repository object
  AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  Future<Either<Failures, LoginResponseEntity>> invoke(
      String email, String password) {
    return authRepository.login(email, password);
  }
}
