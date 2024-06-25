import 'package:dartz/dartz.dart';
import 'package:e_commerce_application/Domain/Entity/Failures.dart';
import 'package:e_commerce_application/Domain/Entity/LoginResponseEntity.dart';
import 'package:e_commerce_application/Domain/Entity/RegisterResponseEntity.dart';
import 'package:e_commerce_application/Domain/Repository/Data%20Source/AuthDataSource.dart';
import 'package:e_commerce_application/Domain/Repository/repository/AuthRepository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthDataSource authDataSource;

  AuthRepositoryImpl({required this.authDataSource});

  @override
  Future<Either<Failures, RegisterResponseEntity>> register(String name,
      String email, String password, String rePassword, String phone) {
    return authDataSource.register(name, email, password, rePassword, phone);
  }

  @override
  Future<Either<Failures, LoginResponseEntity>> login(
      String email, String password) {
    return authDataSource.login(email, password);
  }
}
