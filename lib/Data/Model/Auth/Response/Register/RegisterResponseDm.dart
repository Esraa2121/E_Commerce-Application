import 'package:e_commerce_application/Domain/Entity/RegisterResponseEntity.dart';

import '../UserDM.dart';

/// message : "success"
/// statusMsg : ""
/// user : {"name":"Basma Mounir","email":"basma57@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MjZjMDM4MzIwNTE2MDI3NzhiMjBjZiIsIm5hbWUiOiJCYXNtYSBNb3VuaXIiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxMzgxNTYwOSwiZXhwIjoxNzIxNTkxNjA5fQ.I_HqbGramo_jnCEhij9cOAUITAtf6CQWqDwh-FsKGNc"

class RegisterResponseDm {
  RegisterResponseDm({
    this.message,
    this.statusMsg,
    this.user,
    this.token,
  });

  RegisterResponseDm.fromJson(dynamic json) {
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

  RegisterResponseEntity responseToEntity() {
    return RegisterResponseEntity(token: token, user: user?.toUserEntity());
  }
}
