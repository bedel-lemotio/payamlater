import 'dart:convert';

List<PrefinancialModel> prefinancialModelFromJson(String str) => List<PrefinancialModel>.from(json.decode(str).map((x) => PrefinancialModel.fromJson(x)));

String prefinancialModelToJson(List<PrefinancialModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PrefinancialModel {
  PrefinancialModel({
    required this.associationId,
    required this.salePersonid,
    required this.customerid,
    required this.number,
    required this.dateInvoice,
    required this.sdate,
    required this.endate,
    this.total,
    this.totaAmount,
    this.totalRe,
    this.other,
    this.advance,
    this.amountDu,
    this.amountPaid,
    this.prime,
    required this.paymentType,
    required this.duration,
    required this.status,
    required this.currencyId,
    this.payment,
  });

  int associationId;
  int salePersonid;
  int customerid;
  String number;
  DateTime dateInvoice;
  DateTime sdate;
  DateTime endate;
  double? total;
  double? totaAmount;
  double? totalRe;
  double? other;
  double? advance;
  double? amountDu;
  double? amountPaid;
  double? prime;
  int paymentType;
  int duration;
  Status status;
  int currencyId;
  double? payment;

  factory PrefinancialModel.fromJson(Map<String, dynamic> json) => PrefinancialModel(
    associationId: json["association_id"],
    salePersonid: json["sale_personid"],
    customerid: json["customerid"],
    number: json["number"],
    dateInvoice: DateTime.parse(json["date_invoice"]),
    sdate: DateTime.parse(json["sdate"]),
    endate: DateTime.parse(json["endate"]),
    total: json["total"],
    totaAmount: json["tota_amount"],
    totalRe: json["total_re"],
    other: json["other"],
    advance: json["advance"],
    amountDu: json["amount_du"],
    amountPaid: json["amount_paid"],
    prime: json["prime"],
    paymentType: json["payment_type"],
    duration: json["duration"],
    status: statusValues.map[json["status"]]!,
    currencyId: json["currency_id"],
    payment: json["payment"],
  );

  Map<String, dynamic> toJson() => {
    "association_id": associationId,
    "sale_personid": salePersonid,
    "customerid": customerid,
    "number": number,
    "date_invoice": dateInvoice.toIso8601String(),
    "sdate": sdate.toIso8601String(),
    "endate": endate.toIso8601String(),
    "total": total,
    "tota_amount": totaAmount,
    "total_re": totalRe,
    "other": other,
    "advance": advance,
    "amount_du": amountDu,
    "amount_paid": amountPaid,
    "prime": prime,
    "payment_type": paymentType,
    "duration": duration,
    "status": statusValues.reverse[status],
    "currency_id": currencyId,
    "payment": payment,
  };
}

enum Status { READY, PENDING, DRAFT, STRING }

final statusValues = EnumValues({
  "draft": Status.DRAFT,
  "pending": Status.PENDING,
  "ready": Status.READY,
  "string": Status.STRING
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
