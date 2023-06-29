import 'dart:convert';

List<PayPlanModel> payPlanModelFromJson(String str) => List<PayPlanModel>.from(json.decode(str).map((x) => PayPlanModel.fromJson(x)));

String payPlanModelToJson(List<PayPlanModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PayPlanModel {
  int? id;
  int? number;
  String? type;
  String? details;

  PayPlanModel({
    this.id,
    this.number,
    this.type,
    this.details,
  });

  factory PayPlanModel.fromJson(Map<String, dynamic> json) => PayPlanModel(
    id: json["id"],
    number: json["number"],
    type: json["type"],
    details: json["details"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "number": number,
    "type": type,
    "details": details,
  };
}
