// To parse this JSON data, do
//
//     final userCreateResponseModel = userCreateResponseModelFromJson(jsonString);

import 'dart:convert';

UserCreateResponseModel userCreateResponseModelFromJson(String str) => UserCreateResponseModel.fromJson(json.decode(str));

String userCreateResponseModelToJson(UserCreateResponseModel data) => json.encode(data.toJson());

class UserCreateResponseModel {
  UserCreateResponseModel({
    this.id,
    this.name,
    this.email,
    this.gender,
    this.status,
  });

  int? id;
  String? name;
  String? email;
  String? gender;
  String? status;

  factory UserCreateResponseModel.fromJson(Map<String, dynamic> json) => UserCreateResponseModel(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    gender: json["gender"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "gender": gender,
    "status": status,
  };
}
