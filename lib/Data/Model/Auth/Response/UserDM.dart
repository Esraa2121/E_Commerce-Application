import 'package:e_commerce_application/Domain/Entity/UserEntity.dart';

/// name : "Basma Mounir"
/// email : "basma57@gmail.com"
/// role : "user"

class UserDM {
  UserDM({
    this.name,
    this.email,
    this.role,
  });

  UserDM.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  String? name;
  String? email;
  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }

  UserEntity toUserEntity() {
    return UserEntity(name: name, email: email);
  }
}
