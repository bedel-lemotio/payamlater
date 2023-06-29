import 'dart:convert';

CustomersModel customersModelFromJson(String str) => CustomersModel.fromJson(json.decode(str));

String customersModelToJson(CustomersModel data) => json.encode(data.toJson());

class CustomersModel {

  int? userId;
  String? username;
  String? firstname;
  String? lastname;
  String? email;
  String? phone;
  dynamic datebirth;
  dynamic placebirth;
  dynamic gender;
  String? usertype;
  dynamic createdBy;
  DateTime? createdAt;
  dynamic updateBy;
  dynamic updateAt;
  int? customerid;
  String? type;
  String? membertype;
  String? numero;
  DateTime? datetype;
  String? lieu;
  String? repere;
  String? profession;
  String? nationalite;
  String? maritalstatus;
  int? groupid;
  String? nameAss;

  CustomersModel({
    this.userId,
    this.username,
    this.firstname,
    this.lastname,
    this.email,
    this.phone,
    this.datebirth,
    this.placebirth,
    this.gender,
    this.usertype,
    this.createdBy,
    this.createdAt,
    this.updateBy,
    this.updateAt,
    this.customerid,
    this.type,
    this.membertype,
    this.numero,
    this.datetype,
    this.lieu,
    this.repere,
    this.profession,
    this.nationalite,
    this.maritalstatus,
    this.groupid,
    this.nameAss,
  });

  factory CustomersModel.fromJson(Map<String, dynamic> json) => CustomersModel(
    userId: json["userId"],
    username: json["username"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    email: json["email"],
    phone: json["phone"],
    datebirth: json["datebirth"],
    placebirth: json["placebirth"],
    gender: json["gender"],
    usertype: json["usertype"],
    createdBy: json["createdBy"],
    createdAt: DateTime.parse(json["createdAt"]),
    updateBy: json["updateBy"],
    updateAt: json["updateAt"],
    customerid: json["customerid"],
    type: json["type"],
    membertype: json["membertype"],
    numero: json["numero"],
    datetype: DateTime.parse(json["datetype"]),
    lieu: json["lieu"],
    repere: json["repere"],
    profession: json["profession"],
    nationalite: json["nationalite"],
    maritalstatus: json["maritalstatus"],
    groupid: json["groupid"],
    nameAss: json["name_ass"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "username": username,
    "firstname": firstname,
    "lastname": lastname,
    "email": email,
    "phone": phone,
    "datebirth": datebirth,
    "placebirth": placebirth,
    "gender": gender,
    "usertype": usertype,
    "createdBy": createdBy,
    "createdAt": createdAt?.toIso8601String(),
    "updateBy": updateBy,
    "updateAt": updateAt,
    "customerid": customerid,
    "type": type,
    "membertype": membertype,
    "numero": numero,
    "datetype": "${datetype?.year.toString().padLeft(4, '0')}-${datetype?.month.toString().padLeft(2, '0')}-${datetype?.day.toString().padLeft(2, '0')}",
    "lieu": lieu,
    "repere": repere,
    "profession": profession,
    "nationalite": nationalite,
    "maritalstatus": maritalstatus,
    "groupid": groupid,
    "name_ass": nameAss,
  };
}