import 'dart:convert';

PaymentModel paymentModelFromJson(String str) => PaymentModel.fromJson(json.decode(str));

String paymentModelToJson(PaymentModel data) => json.encode(data.toJson());

class PaymentModel {
  int? id;
  int? saleid;
  int? customerid;
  int? prefinancialId;
  int? typePay;
  DateTime date;
  double? verse;
  double? amountDu;
  String? status;
  int? currencyId;
  String? moyenPayement;

  PaymentModel({
    this.id,
    this.saleid,
    this.customerid,
    this.prefinancialId,
    this.typePay,
    required this.date,
    this.verse,
    this.amountDu,
    this.status,
    this.currencyId,
    this.moyenPayement,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
    id: json["id"],
    saleid: json["saleid"],
    customerid: json["customerid"],
    prefinancialId: json["prefinancial_id"],
    typePay: json["type_pay"],
    date: DateTime.parse(json["date"]),
    verse: json["verse"],
    amountDu: json["amount_du"],
    status: json["status"],
    currencyId: json["currency_id"],
    moyenPayement: json["moyen_payement"],
  );
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['saleid'] = this.saleid;
    data['customerid'] = this.customerid;
    data['type_pay'] = this.typePay;
    data['date'] = this.date;//${pDate?.year.toString().padLeft(4, '0')}-${pDate?.month.toString().padLeft(2, '0')}-${pDate?.day.toString().padLeft(2, '0')}
    data['verse'] = this.verse;
    data['amount_du'] = this.amountDu;
    data['status'] = this.status;
    data['currency_id'] = this.currencyId;
    data['moyen_payement'] = this.moyenPayement;
    return data;
  }
}