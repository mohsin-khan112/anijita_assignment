


class GetUserDetailsModel {
  GetUserDetailsModel({
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

  factory GetUserDetailsModel.fromJson(Map<String, dynamic> json) => GetUserDetailsModel(
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


