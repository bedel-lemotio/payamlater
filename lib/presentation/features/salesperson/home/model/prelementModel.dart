import 'package:json_annotation/json_annotation.dart';
import 'productAccessoireModel.dart';

part 'prelementModel.g.dart';



@JsonSerializable(includeIfNull: true)
class PrelementModel {
  int? idprelement;
  int? productid;
  String? productname;
  @JsonKey(name:'amount_du')
  double? amountDu;
  @JsonKey(name:'total_re')
  double? totalRe;
  String? status;
  @JsonKey(name:'date_invoice')
  DateTime? dateInvoice;
  @JsonKey(name:'Alias')
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
  @JsonKey(name:'amount_total')
  double? amountTotal;
  String? customername;
  String? customerid;

  List<ProductAccessoireModel>? accessoires;


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
      this.amountTotal,
      this.customerid,
      this.customername,
      this.accessoires
  });

  factory PrelementModel.fromJson(Map<String, dynamic> json) => _$PrelementModelFromJson(json);

  Map<String, dynamic> toJson() => _$PrelementModelToJson(this);

}



