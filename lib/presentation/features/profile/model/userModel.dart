
import 'package:json_annotation/json_annotation.dart';

part 'userModel.g.dart';

@JsonSerializable(includeIfNull: true)
class UserModel {
  int userId;
  String? username;
  String? firstname;
  String? lastname;
  String? email;
  dynamic? datebirth;
  dynamic? gender;
  String? usertype;
  String? phone;


  UserModel({
    required this.userId,
    this.username,
    this.firstname,
    this.lastname,
    this.email,
    this.datebirth,
    this.gender,
    this.usertype,
    this.phone
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);


}