// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ResponseAuth {
  Meta? meta;
  Data? data;
  ResponseAuth({
    this.meta,
    this.data,
  });

  factory ResponseAuth.fromRawJson(String str) => ResponseAuth.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResponseAuth.fromJson(Map<String, dynamic> json) => ResponseAuth(
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "data": data?.toJson(),
      };

  @override
  String toString() => 'ResponseAuth(meta: $meta, data: $data)';
}

class Data {
  String? message;
  String? accessToken;
  String? tokenType;
  User? user;

  Data({
    this.message,
    this.accessToken,
    this.tokenType,
    this.user,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        message: json["message"],
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "access_token": accessToken,
        "token_type": tokenType,
        "user": user?.toJson(),
      };
}

class User {
  int? id;
  dynamic username;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  dynamic currentTeamId;
  dynamic address;
  dynamic houseNumber;
  dynamic phoneNumber;
  dynamic city;
  int? createdAt;
  int? updatedAt;
  String? roles;
  dynamic profilePhotoPath;
  String? profilePhotoUrl;

  User({
    this.id,
    this.username,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.currentTeamId,
    this.address,
    this.houseNumber,
    this.phoneNumber,
    this.city,
    this.createdAt,
    this.updatedAt,
    this.roles,
    this.profilePhotoPath,
    this.profilePhotoUrl,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        currentTeamId: json["current_team_id"],
        address: json["address"],
        houseNumber: json["houseNumber"],
        phoneNumber: json["phoneNumber"],
        city: json["city"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        roles: json["roles"],
        profilePhotoPath: json["profile_photo_path"],
        profilePhotoUrl: json["profile_photo_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "current_team_id": currentTeamId,
        "address": address,
        "houseNumber": houseNumber,
        "phoneNumber": phoneNumber,
        "city": city,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "roles": roles,
        "profile_photo_path": profilePhotoPath,
        "profile_photo_url": profilePhotoUrl,
      };
}

class Meta {
  int? code;
  String? status;
  String? message;

  Meta({
    this.code,
    this.status,
    this.message,
  });

  factory Meta.fromRawJson(String str) => Meta.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        code: json["code"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
      };
}
