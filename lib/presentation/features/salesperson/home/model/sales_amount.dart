import 'dart:convert';

List<AmountSalesModel> amountSalesModelFromJson(String str) => List<AmountSalesModel>.from(json.decode(str).map((x) => AmountSalesModel.fromJson(x)));

String amountSalesModelToJson(List<AmountSalesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AmountSalesModel {
  AmountSalesModel({
    this.salePersonid,
    this.nbrCustomers,
    this.totalFinanced,
    this.totalamount,
    this.totalrepaid,
    this.totaladvance,
    this.amountdue,
  });

  int? salePersonid;
  int? nbrCustomers;
  double? totalFinanced;
  double? totalamount;
  double? totalrepaid;
  double? totaladvance;
  double? amountdue;

  factory AmountSalesModel.fromJson(Map<String, dynamic> json) => AmountSalesModel(
    salePersonid: json["sale_personid"],
    nbrCustomers: json["nbr_customers"],
    totalFinanced: json["total_financed"],
    totalamount: json["totalamount"],
    totalrepaid: json["totalrepaid"],
    totaladvance: json["totaladvance"],
    amountdue: json["amountdue"],
  );

  Map<String, dynamic> toJson() => {
    "sale_personid": salePersonid,
    "nbr_customers": nbrCustomers,
    "total_financed": totalFinanced,
    "totalamount": totalamount,
    "totalrepaid": totalrepaid,
    "totaladvance": totaladvance,
    "amountdue": amountdue,
  };
}
