import 'dart:convert';

CalendarModel calendarModelFromJson(String str) => CalendarModel.fromJson(json.decode(str));

String calendarModelToJson(CalendarModel data) => json.encode(data.toJson());

class CalendarModel {
  int? id;
  String? name;
  double? toPaid;
  double? amountDu;
  DateTime date;
  int? isDu;
  int? notPay;
  int? prefinancialId;
  int? saleid;
  int? customerid;
  int ?currencyId;

  CalendarModel({
    this.id,
    this.name,
    this.toPaid,
    this.amountDu,
    required this.date,
    this.isDu,
    this.notPay,
    this.prefinancialId,
    this.saleid,
    this.customerid,
    this.currencyId,
  });

  factory CalendarModel.fromJson(Map<String, dynamic> json) => CalendarModel(
    id: json["id"],
    name: json["name"],
    toPaid: json["to_paid"],
    amountDu: json["amount_du"],
    date: DateTime.parse(json["date"]),
    isDu: json["is_du"],
    notPay: json["not_pay"],
    prefinancialId: json["prefinancial_id"],
    saleid: json["saleid"],
    customerid: json["customerid"],
    currencyId: json["currency_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "to_paid": toPaid,
    "amount_du": amountDu,
    "date": date.toIso8601String(),
    "is_du": isDu,
    "not_pay": notPay,
    "prefinancial_id": prefinancialId,
    "saleid": saleid,
    "customerid": customerid,
    "currency_id": currencyId,
  };
}