import 'dart:convert';

PrefinancialModel prefinancialModelFromJson(String str) => PrefinancialModel.fromJson(json.decode(str));

String prefinancialModelToJson(PrefinancialModel data) => json.encode(data.toJson());

class PrefinancialModel {
  PrefinancialModel({
    required this.token,
    required this.customerid,
    required this.groupid,
    required this.salePersonid,
    required this.paymentTypeId,
    required this.durationId,
    required this.currencyId,
    required this.number,
    required this.dateInvoice,
    required this.sdate,
    required this.status,
    required this.product,
    required this.accessoires,
    required this.avance,
  });

  String token;
  int customerid;
  int groupid;
  int salePersonid;
  int paymentTypeId;
  int durationId;
  int currencyId;
  int number;
  DateTime dateInvoice;
  DateTime sdate;
  String status;
  int product;
  List<int> accessoires;
  int avance;

  factory PrefinancialModel.fromJson(Map<String, dynamic> json) => PrefinancialModel(
    token: json["token"],
    customerid: json["customerid"],
    groupid: json["groupid"],
    salePersonid: json["sale_personid"],
    paymentTypeId: json["payment_type_id"],
    durationId: json["durationId"],
    currencyId: json["currency_id"],
    number: json["number"],
    dateInvoice: DateTime.parse(json["date_invoice"]),
    sdate: DateTime.parse(json["sdate"]),
    status: json["status"],
    product: json["product"],
    accessoires: List<int>.from(json["accessoires"].map((x) => x)),
    avance: json["avance"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "customerid": customerid,
    "groupid": groupid,
    "sale_personid": salePersonid,
    "payment_type_id": paymentTypeId,
    "durationId": durationId,
    "currency_id": currencyId,
    "number": number,
    "date_invoice": "${dateInvoice.year.toString().padLeft(4, '0')}-${dateInvoice.month.toString().padLeft(2, '0')}-${dateInvoice.day.toString().padLeft(2, '0')}",
    "sdate": "${sdate.year.toString().padLeft(4, '0')}-${sdate.month.toString().padLeft(2, '0')}-${sdate.day.toString().padLeft(2, '0')}",
    "status": status,
    "product": product,
    "accessoires": List<dynamic>.from(accessoires.map((x) => x)),
    "avance": avance,
  };
}
