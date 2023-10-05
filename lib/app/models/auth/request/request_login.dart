import 'dart:convert';

class RequestForLogin {
  String? email;
  String? password;

  RequestForLogin({
    this.email,
    this.password,
  });

  factory RequestForLogin.fromJson(String str) =>
      RequestForLogin.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RequestForLogin.fromMap(Map<String, dynamic> json) => RequestForLogin(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "password": password,
      };

  @override
  String toString() {
    return 'RequestForLogin{email: $email, password: $password}';
  }
}
