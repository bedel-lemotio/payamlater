import 'dart:convert';

ForgotPwd forgotPwdFromJson(String str) => ForgotPwd.fromJson(json.decode(str));

String forgotPwdToJson(ForgotPwd data) => json.encode(data.toJson());

class ForgotPwd {
  ForgotPwd({
    required this.userid,
    required this.password,
  });

  String userid;
  String password;

  factory ForgotPwd.fromJson(Map<String, dynamic> json) => ForgotPwd(
    userid: json["userid"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userid'] = this.userid;
    data['password'] = this.password;
    return data;
  }
}
