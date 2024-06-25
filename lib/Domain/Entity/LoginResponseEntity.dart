import 'package:e_commerce_application/Domain/Entity/UserEntity.dart';

/// message : "success"
/// statusMsg : "fail"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedmutti@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0MDdjZjZmNTE1YmRjZjM0N2MwOWYxNyIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzE0MDY5NjE2LCJleHAiOjE3MjE4NDU2MTZ9.nlLy91czbNnde4DwxtuzI3PleUEXKahezN0gUYScJuA"

class LoginResponseEntity {
  LoginResponseEntity({
    this.user,
    this.token,
  });

  UserEntity? user;
  String? token;
}
