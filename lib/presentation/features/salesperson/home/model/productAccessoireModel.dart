import 'package:json_annotation/json_annotation.dart';

part 'productAccessoireModel.g.dart';

@JsonSerializable(includeIfNull: true)
class ProductAccessoireModel {
  @JsonKey(name:'AccesoireID')
  int? accesoireID;
  int? productid;
  String? productname;
  @JsonKey(name:'amount_du')
  double? amountDu;
  @JsonKey(name:'total_re')
  double? totalRe;
  String? status;
  @JsonKey(name:'date_invoice')
  String? dateInvoice;
  String? alias;
  int? idsupplier;
  String? namesupplier;
  String? descr;
  @JsonKey(name:'u_price')
  double? uPrice;
  int? quantity;
  double? amount;
  double? prime;
  @JsonKey(name:'is_prime')
  int? isPrime;
  @JsonKey(name:'currency_id')
  int? currencyId;
  @JsonKey(name:'prefinancial_id')
  int? prefinancialId;


  ProductAccessoireModel({
      this.accesoireID,
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
      this.prefinancialId
  });

  factory ProductAccessoireModel.fromJson(Map<String, dynamic> json) => _$ProductAccessoireModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductAccessoireModelToJson(this);

  @override
  String toString() {
    return 'ProductAccessoireModel{accesoireID: $accesoireID, productid: $productid, productname: $productname, amountDu: $amountDu, totalRe: $totalRe, status: $status, dateInvoice: $dateInvoice, alias: $alias, idsupplier: $idsupplier, namesupplier: $namesupplier, descr: $descr, uPrice: $uPrice, quantity: $quantity, amount: $amount, prime: $prime, isPrime: $isPrime, currencyId: $currencyId, prefinancialId: $prefinancialId}';
  }
}