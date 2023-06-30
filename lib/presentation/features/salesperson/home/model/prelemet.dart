import 'dart:convert';

PrelementModel prelementModelFromJson(String str) => PrelementModel.fromJson(json.decode(str));

String prelementModelToJson(PrelementModel data) => json.encode(data.toJson());

class PrelementModel {
  int? idprelement;
  int? productid;
  String? productname;
  double? amountDu;
  double? totalRe;
  String? status;
  DateTime? dateInvoice;
  String? alias;
  int? idsupplier;
  String? namesupplier;
  String? descr;
  double? uPrice ;
  int? quantity;
  double? amount;
  double? prime;
  int? isPrime;
  int? currencyId;
  int? prefinancialId;
  String? customerId;
  List<PrelementModel>? accessoire;
  int? accesoireId;

  PrelementModel({
    this.idprelement,
    this.productid,
    this.productname,
    this.amountDu,
    this.totalRe,
    this.status,
    this.dateInvoice,
    this.alias,
    this.idsupplier,
    this.namesupplier,
    this.descr,
    this.uPrice,
    this.quantity,
    this.amount,
    this.prime,
    this.isPrime,
    this.currencyId,
    this.prefinancialId,
    this.customerId,
    this.accessoire,
    this.accesoireId,
  });

  factory PrelementModel.fromJson(Map<String, dynamic> json) => PrelementModel(
    idprelement: json["idprelement"],
    productid: json["productid"],
    productname: json["productname"],
    amountDu: json["amount_du"],
    totalRe: json["total_re"],
    descr: json["descr"],
    uPrice: json["u_price"],
    quantity: json["quantity"],
    amount: json["amount"],
    prime: json["prime"],
    isPrime: json["is_prime"],
    currencyId: json["currency_id"],
    prefinancialId: json["prefinancial_id"],
    customerId: json["customerid"],
    accessoire: json["accessoire"] == null ? [] : List<PrelementModel>.from(json["accessoire"]!.map((x) => PrelementModel.fromJson(x))),
    accesoireId: json["AccesoireID"],
  );

  Map<String, dynamic> toJson() => {
    "idprelement": idprelement,
    "productid": productid,
    "productname": productname,
    "amount_du": amountDu,
    "total_re": totalRe,
    "descr": descr,
    "u_price": uPrice,
    "quantity": quantity,
    "amount": amount,
    "prime": prime,
    "is_prime": isPrime,
    "currency_id": currencyId,
    "prefinancial_id": prefinancialId,
    "customerid": customerId,
    "accessoire": accessoire == null ? [] : List<dynamic>.from(accessoire!.map((x) => x.toJson())),
    "AccesoireID": accesoireId,
  };
}



