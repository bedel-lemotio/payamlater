import 'dart:convert';

AmountCustomerModel amountCustomerModelFromJson(String str) => AmountCustomerModel.fromJson(json.decode(str));

String amountCustomerModelToJson(AmountCustomerModel data) => json.encode(data.toJson());

class AmountCustomerModel {
  int? customerid;
  int? numberofproducts;
  double? totalgobal;
  double? totalproducts;
  double? totaltobeadvanced;
  double? totaladvanced;
  double? totalfinanced;
  double? currentamountdue;
  double? currenttotalrepaid;

  AmountCustomerModel({
    this.customerid,
    this.numberofproducts,
    this.totalgobal,
    this.totalproducts,
    this.totaltobeadvanced,
    this.totaladvanced,
    this.totalfinanced,
    this.currentamountdue,
    this.currenttotalrepaid,
  });

  factory AmountCustomerModel.fromJson(Map<String, dynamic> json) => AmountCustomerModel(
    customerid: json["customerid"],
    numberofproducts: json["numberofproducts"],
    totalgobal: json["totalgobal"],
    totalproducts: json["totalproducts"],
    totaltobeadvanced: json["totaltobeadvanced"],
    totaladvanced: json["totaladvanced"],
    totalfinanced: json["totalfinanced"],
    currentamountdue: json["currentamountdue"],
    currenttotalrepaid: json["currenttotalrepaid"],
  );

  Map<String, dynamic> toJson() => {
    "customerid": customerid,
    "numberofproducts": numberofproducts,
    "totalgobal": totalgobal,
    "totalproducts": totalproducts,
    "totaltobeadvanced": totaltobeadvanced,
    "totaladvanced": totaladvanced,
    "totalfinanced": totalfinanced,
    "currentamountdue": currentamountdue,
    "currenttotalrepaid": currenttotalrepaid,
  };
}
