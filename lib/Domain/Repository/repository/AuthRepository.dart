import 'package:dartz/dartz.dart';
import 'package:e_commerce_application/Domain/Entity/Failures.dart';
import 'package:e_commerce_application/Domain/Entity/LoginResponseEntity.dart';
import 'package:e_commerce_application/Domain/Entity/RegisterResponseEntity.dart';

abstract class AuthRepository {
  Future<Either<Failures, RegisterResponseEntity>> register(String name,
      String email, String password, String rePassword, String phone);

  Future<Either<Failures, LoginResponseEntity>> login(
      String email, String password);
}
