
import 'package:json_annotation/json_annotation.dart';

part 'categoryPrefinancialModel.g.dart';

@JsonSerializable(includeIfNull: true)
class CategoryPrefinancialModel {
  int id;
  String? name;
  String? descr;
  int? desable;
  int? createBy;
  dynamic? updateBy;
  String? createDateUpdateDate;

  CategoryPrefinancialModel({
     required this.id,
      this.name,
      this.descr, 
      this.desable, 
      this.createBy, 
      this.updateBy, 
      this.createDateUpdateDate,});

  factory CategoryPrefinancialModel.fromJson(Map<String, dynamic> json) => _$CategoryPrefinancialModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryPrefinancialModelToJson(this);


}