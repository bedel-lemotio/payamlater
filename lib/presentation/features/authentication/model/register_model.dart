import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {

  String? phone;
  String? firstname;
  String? lastname;
  String? email;
  String? usertype;
  String? password;

  RegisterModel({
    this.phone,
    this.firstname,
    this.lastname,
    this.email,
    this.usertype,
    this.password,
  });


  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    phone: json["phone"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    email: json["email"],
    usertype: json["usertype"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "firstname": firstname,
    "lastname": lastname,
    "email": email,
    "usertype": usertype,
    "password": password,
  };
}
