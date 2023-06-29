import 'dart:convert';

CustomerModel customerModelFromJson(String str) => CustomerModel.fromJson(json.decode(str));

String customerModelToJson(CustomerModel data) => json.encode(data.toJson());

class CustomerModel {
  List<Message> message;

  CustomerModel({
    required this.message,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
    message: List<Message>.from(json["message"].map((x) => Message.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": List<dynamic>.from(message.map((x) => x.toJson())),
  };
}

class Message {
  int customerid;
  String firstname;
  String lastname;

  Message({
    required this.customerid,
    required this.firstname,
    required this.lastname,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    customerid: json["customerid"],
    firstname: json["firstname"],
    lastname: json["lastname"],
  );

  Map<String, dynamic> toJson() => {
    "customerid": customerid,
    "firstname": firstname,
    "lastname": lastname,
  };
}
