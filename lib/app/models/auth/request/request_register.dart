import 'dart:convert';

class RequestRegister {
  String? name;
  String? email;
  String? password;
  String? passwordConfirmation;

  RequestRegister({
    this.name,
    this.email,
    this.password,
    this.passwordConfirmation,
  });

  factory RequestRegister.fromJson(String str) => RequestRegister.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RequestRegister.fromMap(Map<String, dynamic> json) => RequestRegister(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        passwordConfirmation: json["password_confirmation"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation,
      };
}
