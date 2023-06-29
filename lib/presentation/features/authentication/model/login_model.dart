import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    required this.username,
    required this.password,
    required this.machineId,
    required this.remotehost,
    required this.token,
  });

  String username;
  String password;
  String machineId;
  String remotehost;
  String token;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    username: json["username"],
    password: json["password"],
    machineId: json["machineId"],
    remotehost: json["remotehost"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    data['machineId'] = this.machineId;
    data['remotehost'] = this.remotehost;
    data['token'] = this.token;
    return data;
  }
}
