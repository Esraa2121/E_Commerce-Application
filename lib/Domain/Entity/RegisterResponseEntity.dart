import 'UserEntity.dart';

/// message : "success"
/// statusMsg : ""
/// user : {"name":"Basma Mounir","email":"basma57@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MjZjMDM4MzIwNTE2MDI3NzhiMjBjZiIsIm5hbWUiOiJCYXNtYSBNb3VuaXIiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxMzgxNTYwOSwiZXhwIjoxNzIxNTkxNjA5fQ.I_HqbGramo_jnCEhij9cOAUITAtf6CQWqDwh-FsKGNc"

class RegisterResponseEntity {
  RegisterResponseEntity({
    this.user,
    this.token,
  });

  UserEntity? user;
  String? token;
}
