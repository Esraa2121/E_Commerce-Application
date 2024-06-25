import 'package:e_commerce_application/Data/Model/Auth/Response/UserDM.dart';
import 'package:e_commerce_application/Domain/Entity/LoginResponseEntity.dart';

/// message : "success"
/// statusMsg : "fail"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedmutti@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0MDdjZjZmNTE1YmRjZjM0N2MwOWYxNyIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzE0MDY5NjE2LCJleHAiOjE3MjE4NDU2MTZ9.nlLy91czbNnde4DwxtuzI3PleUEXKahezN0gUYScJuA"

class LoginResponseDm {
  LoginResponseDm({
    this.message,
    this.statusMsg,
    this.user,
    this.token,
  });

  LoginResponseDm.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserDM.fromJson(json['user']) : null;
    token = json['token'];
  }

  String? message;
  String? statusMsg;
  UserDM? user;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

  LoginResponseEntity toLoginResponseEntity() {
    return LoginResponseEntity(user: user?.toUserEntity(), token: token);
  }
}
