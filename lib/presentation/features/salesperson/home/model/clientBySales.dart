import 'dart:convert';

List<ClientBySalesModel> clientBySalesModelFromJson(String str) => List<ClientBySalesModel>.from(json.decode(str).map((x) => ClientBySalesModel.fromJson(x)));

String clientBySalesModelToJson(List<ClientBySalesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClientBySalesModel {
  ClientBySalesModel({
    this.customerid,
    this.firstname,
    this.lastname,
  });

  int? customerid;
  String? firstname;
  String? lastname;

  factory ClientBySalesModel.fromJson(Map<String, dynamic> json) => ClientBySalesModel(
    customerid: json["customerid"],
    firstname: json["firstname"],
    lastname: json["lastname"],
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['customerid'] = this.customerid;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    return data;
  }
}
