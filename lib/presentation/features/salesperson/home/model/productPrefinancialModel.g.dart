// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productPrefinancialModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductPrefinancialModel _$ProductPrefinancialModelFromJson(
        Map<String, dynamic> json) =>
    ProductPrefinancialModel(
      id: json['id'] as int,
      nameProd: json['nameProd'] as String?,
      alias: json['alias'] as String?,
      price: json['price'] as int?,
      description: json['description'] as String?,
      brandId: json['brandId'] as int?,
      supplierid: json['supplierid'] as int?,
      suppliername: json['suppliername'] as String?,
      isPercent: json['isPercent'] as int?,
      applyCom: json['applyCom'] as int?,
      isBy: json['isBy'] as int?,
      disable: json['disable'] as int?,
      createdBy: json['createdBy'] as int?,
      updateBy: json['updateBy'],
      createdAt: json['createdAt'] as String?,
      updateAt: json['updateAt'],
      namebrand: json['namebrand'] as String?,
      nameCat: json['nameCat'] as String?,
    );

Map<String, dynamic> _$ProductPrefinancialModelToJson(
        ProductPrefinancialModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameProd': instance.nameProd,
      'alias': instance.alias,
      'price': instance.price,
      'description': instance.description,
      'brandId': instance.brandId,
      'supplierid': instance.supplierid,
      'suppliername': instance.suppliername,
      'isPercent': instance.isPercent,
      'applyCom': instance.applyCom,
      'isBy': instance.isBy,
      'disable': instance.disable,
      'createdBy': instance.createdBy,
      'updateBy': instance.updateBy,
      'createdAt': instance.createdAt,
      'updateAt': instance.updateAt,
      'namebrand': instance.namebrand,
      'nameCat': instance.nameCat,
    };
