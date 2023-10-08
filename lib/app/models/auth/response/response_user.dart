import 'dart:convert';

class ResponseUser {
  User user;

  ResponseUser({
    required this.user,
  });

  factory ResponseUser.fromRawJson(String str) => ResponseUser.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResponseUser.fromJson(Map<String, dynamic> json) => ResponseUser(
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
      };
}

class User {
  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  dynamic currentTeamId;
  dynamic profilePhotoPath;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic twoFactorConfirmedAt;
  String profilePhotoUrl;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    this.currentTeamId,
    this.profilePhotoPath,
    required this.createdAt,
    required this.updatedAt,
    this.twoFactorConfirmedAt,
    required this.profilePhotoUrl,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        currentTeamId: json["current_team_id"],
        profilePhotoPath: json["profile_photo_path"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        twoFactorConfirmedAt: json["two_factor_confirmed_at"],
        profilePhotoUrl: json["profile_photo_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "current_team_id": currentTeamId,
        "profile_photo_path": profilePhotoPath,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "two_factor_confirmed_at": twoFactorConfirmedAt,
        "profile_photo_url": profilePhotoUrl,
      };
}
