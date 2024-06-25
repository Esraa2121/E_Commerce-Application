import 'package:dartz/dartz.dart';
import 'package:e_commerce_application/Core/Api/ApiManager.dart';
import 'package:e_commerce_application/Domain/Entity/Failures.dart';
import 'package:e_commerce_application/Domain/Entity/LoginResponseEntity.dart';
import 'package:e_commerce_application/Domain/Entity/RegisterResponseEntity.dart';
import 'package:e_commerce_application/Domain/Repository/Data%20Source/AuthDataSource.dart';

class AuthDataSourceImpl implements AuthDataSource {
  ApiManager apiManager;

  AuthDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, RegisterResponseEntity>> register(String name,
      String email, String password, String rePassword, String phone) async {
    var either =
        await apiManager.register(name, email, password, rePassword, phone);
    return either.fold((error) {
      return Left(error);
    }, (response) {
      return Right(response.responseToEntity());
    });
  }

  @override
  Future<Either<Failures, LoginResponseEntity>> login(
      String email, String password) async {
    var either = await apiManager.login(email, password);
    return either.fold((error) {
      return Left(error);
    }, (response) {
      return Right(response.toLoginResponseEntity());
    });
  }
}
