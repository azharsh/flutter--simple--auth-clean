
import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String email;
  String password;
  String username;

  UserModel({
    required this.email,
    required this.password,
    required this.username,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    email: json["email"],
    password: json["password"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
    "username": username,
  };
}
