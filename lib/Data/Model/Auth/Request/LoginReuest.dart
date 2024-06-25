/// email : "ahmedmutti@gmail.com"
/// password : "Ahme@123"

class LoginReuest {
  LoginReuest({
    this.email,
    this.password,
  });

  LoginReuest.fromJson(dynamic json) {
    email = json['email'];
    password = json['password'];
  }

  String? email;
  String? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    return map;
  }
}
