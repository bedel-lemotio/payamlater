// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customerSaleModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerSaleModel _$CustomerSaleModelFromJson(Map<String, dynamic> json) =>
    CustomerSaleModel(
      customerid: json['customerid'] as int,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
    );

Map<String, dynamic> _$CustomerSaleModelToJson(CustomerSaleModel instance) =>
    <String, dynamic>{
      'customerid': instance.customerid,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
    };
