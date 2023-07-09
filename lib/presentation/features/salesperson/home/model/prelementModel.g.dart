// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prelementModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrelementModel _$PrelementModelFromJson(Map<String, dynamic> json) =>
    PrelementModel(
      idprelement: json['idprelement'] as int?,
      productid: json['productid'] as int?,
      productname: json['productname'] as String?,
      amountDu: (json['amount_du'] as num?)?.toDouble(),
      totalRe: (json['total_re'] as num?)?.toDouble(),
      status: json['status'] as String?,
      dateInvoice: json['date_invoice'] == null
          ? null
          : DateTime.parse(json['date_invoice'] as String),
      alias: json['Alias'] as String?,
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
      amountTotal: (json['amount_total'] as num?)?.toDouble(),
      customerid: json['customerid'] as String?,
      customername: json['customername'] as String?,
      accessoires: (json['accessoires'] as List<dynamic>?)
          ?.map(
              (e) => ProductAccessoireModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PrelementModelToJson(PrelementModel instance) =>
    <String, dynamic>{
      'idprelement': instance.idprelement,
      'productid': instance.productid,
      'productname': instance.productname,
      'amount_du': instance.amountDu,
      'total_re': instance.totalRe,
      'status': instance.status,
      'date_invoice': instance.dateInvoice?.toIso8601String(),
      'Alias': instance.alias,
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
      'amount_total': instance.amountTotal,
      'customername': instance.customername,
      'customerid': instance.customerid,
      'accessoires': instance.accessoires,
    };
