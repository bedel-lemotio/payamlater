import 'dart:convert';

PrefinancModel prefinancModelFromJson(String str) => PrefinancModel.fromJson(json.decode(str));

String prefinancModelToJson(PrefinancModel data) => json.encode(data.toJson());

class PrefinancModel {
  String? token;
  int? customerid;
  int? groupid;
  int? salePersonid;
  int? paymentTypeId;
  int? durationId;
  int? currencyId;
  int? number;
  DateTime? dateInvoice;
  DateTime? sdate;
  String? status;
  int? product;
  List<int>? accessoires;
  double? avance;

  PrefinancModel({
    this.token,
    this.customerid,
    this.groupid,
    this.salePersonid,
    this.paymentTypeId,
    this.durationId,
    this.currencyId,
    this.number,
    this.dateInvoice,
    this.sdate,
    this.status,
    this.product,
    this.accessoires,
    this.avance,
  });

  factory PrefinancModel.fromJson(Map<String, dynamic> json) => PrefinancModel(
    token: json["token"],
    customerid: json["customerid"],
    groupid: json["groupid"],
    salePersonid: json["sale_personid"],
    paymentTypeId: json["payment_type_id"],
    durationId: json["durationId"],
    currencyId: json["currency_id"],
    number: json["number"],
    dateInvoice: DateTime.parse(json["date_invoice"].toString()),
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
    "date_invoice": dateInvoice,
    "sdate": "${sdate?.year.toString().padLeft(4, '0')}-${sdate?.month.toString().padLeft(2, '0')}-${sdate?.day.toString().padLeft(2, '0')}",
    "status": status,
    "product": product,
    "accessoires": List<dynamic>.from(accessoires!.map((x) => x)),
    "avance": avance,
  };
}
