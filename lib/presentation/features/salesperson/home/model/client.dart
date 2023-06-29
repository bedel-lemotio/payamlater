import 'dart:convert';

ClientModel clientModelFromJson(String str) => ClientModel.fromJson(json.decode(str));

String clientModelToJson(ClientModel data) => json.encode(data.toJson());

class ClientModel {
  String? tokenid;
  String? firstname;
  String? lastname;
  String? email;
  String? phone;
  DateTime? datebirth;
  String? placebirth;
  String? gender;
  String? membertype;
  int? groupid;
  String? cniOther;
  DateTime? datecni;
  String? lieu;
  String? repere;
  String? profession;
  String? nationalite;
  String? maritalstatus;
  String? numerocni;

  ClientModel({
    this.tokenid,
    this.firstname,
    this.lastname,
    this.email,
    this.phone,
    this.datebirth,
    this.placebirth,
    this.gender,
    this.membertype,
    this.groupid,
    this.cniOther,
    this.datecni,
    this.lieu,
    this.repere,
    this.profession,
    this.nationalite,
    this.maritalstatus,
    this.numerocni,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) => ClientModel(
    tokenid: json["tokenid"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    email: json["email"],
    phone: json["phone"],
    datebirth: DateTime.parse(json["datebirth"]),
    placebirth: json["placebirth"],
    gender: json["gender"],
    membertype: json["membertype"],
    groupid: json["groupid"],
    cniOther: json["cni_other"],
    datecni: DateTime.parse(json["datecni"]),
    lieu: json["lieu"],
    repere: json["repere"],
    profession: json["profession"],
    nationalite: json["nationalite"],
    maritalstatus: json["maritalstatus"],
    numerocni: json["numerocni"],
  );

  Map<String, dynamic> toJson() => {
    "tokenid": tokenid,
    "firstname": firstname,
    "lastname": lastname,
    "email": email,
    "phone": phone,
    "datebirth": "${datebirth?.year.toString().padLeft(4, '0')}-${datebirth?.month.toString().padLeft(2, '0')}-${datebirth?.day.toString().padLeft(2, '0')}",
    "placebirth": placebirth,
    "gender": gender,
    "membertype": membertype,
    "groupid": groupid,
    "cni_other": cniOther,
    "datecni": "${datecni?.year.toString().padLeft(4, '0')}-${datecni?.month.toString().padLeft(2, '0')}-${datecni?.day.toString().padLeft(2, '0')}",
    "lieu": lieu,
    "repere": repere,
    "profession": profession,
    "nationalite": nationalite,
    "maritalstatus": maritalstatus,
    "numerocni": numerocni,
  };
}



// import 'dart:convert';
//
// List<ClientModel> clientModelFromJson(String str) => List<ClientModel>.from(json.decode(str).map((x) => ClientModel.fromJson(x)));
//
// String clientModelToJson(List<ClientModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class ClientModel {
//   int? id;
//   dynamic username;
//   String? lastname;
//   String? firstname;
//   String? email;
//   // dynamic dob;
//   dynamic gender;
//   Usertype? usertype;
//   String? phone;
//
//   ClientModel({
//     this.id,
//     this.username,
//     this.lastname,
//     this.firstname,
//     this.email,
//     // this.dob,
//     this.gender,
//     this.usertype,
//     this.phone,
//   });
//
//   factory ClientModel.fromJson(Map<String, dynamic> json) => ClientModel(
//     id: json["id"],
//     username: json["username"],
//     lastname: json["lastname"],
//     firstname: json["firstname"],
//     email: json["email"],
//     // dob: json["DOB"],
//     gender: json["gender"],
//     usertype: usertypeValues.map[json["Usertype"]]!,
//     phone: json["phone"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "username": username,
//     "lastname": lastname,
//     "firstname": firstname,
//     "email": email,
//     // "DOB": dob,
//     "gender": gender,
//     "Usertype": usertypeValues.reverse[usertype],
//     "phone": phone,
//   };
// }
//
// enum Usertype { CLIENT }
//
// final usertypeValues = EnumValues({
//   "client": Usertype.CLIENT
// });
//
// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
