import 'package:json_annotation/json_annotation.dart';

part 'productPrefinancialModel.g.dart';

@JsonSerializable(includeIfNull: true)
class ProductPrefinancialModel {
  int id;
  String? nameProd;
  String? alias;
  double? price;
  String? description;
  int? brandId;
  int? supplierid;
  String? suppliername;
  int? isPercent;
  int? applyCom;
  int? isBy;
  int? disable;
  int? createdBy;
  dynamic? updateBy;
  String? createdAt;
  dynamic? updateAt;
  String? namebrand;
  String? nameCat;

  ProductPrefinancialModel({
      required this.id,
      this.nameProd, 
      this.alias, 
      this.price, 
      this.description, 
      this.brandId, 
      this.supplierid, 
      this.suppliername, 
      this.isPercent, 
      this.applyCom, 
      this.isBy, 
      this.disable, 
      this.createdBy, 
      this.updateBy, 
      this.createdAt, 
      this.updateAt, 
      this.namebrand, 
      this.nameCat,});


  factory ProductPrefinancialModel.fromJson(Map<String, dynamic> json) => _$ProductPrefinancialModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductPrefinancialModelToJson(this);

  @override
  String toString() {
    return 'ProductPrefinancialModel{id: $id, nameProd: $nameProd, alias: $alias, price: $price, description: $description, brandId: $brandId, supplierid: $supplierid, suppliername: $suppliername, isPercent: $isPercent, applyCom: $applyCom, isBy: $isBy, disable: $disable, createdBy: $createdBy, updateBy: $updateBy, createdAt: $createdAt, updateAt: $updateAt, namebrand: $namebrand, nameCat: $nameCat}';
  }
}