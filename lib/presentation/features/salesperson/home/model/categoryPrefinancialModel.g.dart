// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categoryPrefinancialModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryPrefinancialModel _$CategoryPrefinancialModelFromJson(
        Map<String, dynamic> json) =>
    CategoryPrefinancialModel(
      id: json['id'] as int,
      name: json['name'] as String?,
      descr: json['descr'] as String?,
      desable: json['desable'] as int?,
      createBy: json['createBy'] as int?,
      updateBy: json['updateBy'],
      createDateUpdateDate: json['createDateUpdateDate'] as String?,
    );

Map<String, dynamic> _$CategoryPrefinancialModelToJson(
        CategoryPrefinancialModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'descr': instance.descr,
      'desable': instance.desable,
      'createBy': instance.createBy,
      'updateBy': instance.updateBy,
      'createDateUpdateDate': instance.createDateUpdateDate,
    };
