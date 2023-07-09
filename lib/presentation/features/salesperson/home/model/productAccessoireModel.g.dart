// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productAccessoireModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductAccessoireModel _$ProductAccessoireModelFromJson(
        Map<String, dynamic> json) =>
    ProductAccessoireModel(
      accesoireID: json['AccesoireID'] as int?,
      productid: json['productid'] as int?,
      productname: json['productname'] as String?,
      amountDu: (json['amount_du'] as num?)?.toDouble(),
      totalRe: (json['total_re'] as num?)?.toDouble(),
      status: json['status'] as String?,
      dateInvoice: json['date_invoice'] as String?,
      alias: json['alias'] as String?,
      idsupplier: json['idsupplier'] as int?,
      namesupplier: json['namesupplier'] as String?,
      descr: json['descr'] as String?,
      uPrice: (json['u_price'] as num?)?.toDouble(),
      quantity: json['quantity'] as int?,
      amount: (json['amount'] as num?)?.toDouble(),
      prime: (json['prime'] as num?)?.toDouble(),
      isPrime: json['is_prime'] as int?,
      currencyId: json['currency_id'] as int?,
      prefinancialId: json['prefinancial_id'] as int?,
    );

Map<String, dynamic> _$ProductAccessoireModelToJson(
        ProductAccessoireModel instance) =>
    <String, dynamic>{
      'AccesoireID': instance.accesoireID,
      'productid': instance.productid,
      'productname': instance.productname,
      'amount_du': instance.amountDu,
      'total_re': instance.totalRe,
      'status': instance.status,
      'date_invoice': instance.dateInvoice,
      'alias': instance.alias,
      'idsupplier': instance.idsupplier,
      'namesupplier': instance.namesupplier,
      'descr': instance.descr,
      'u_price': instance.uPrice,
      'quantity': instance.quantity,
      'amount': instance.amount,
      'prime': instance.prime,
      'is_prime': instance.isPrime,
      'currency_id': instance.currencyId,
      'prefinancial_id': instance.prefinancialId,
    };
