import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  int? id;
  String? nameProd;
  String? alias;
  double? price;
  String? description;
  int? brandId;
  int? supplierid;
  int? isPercent;
  int? applyCom;
  int? isBy;
  int? disable;
  String? namebrand;
  String? nameCat;

  ProductModel({
    this.id,
    this.nameProd,
    this.alias,
    this.price,
    this.description,
    this.brandId,
    this.supplierid,
    this.isPercent,
    this.applyCom,
    this.isBy,
    this.disable,
    this.namebrand,
    this.nameCat,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"] ?? '',
    nameProd: json["name_prod"]?? '',
    alias: json["Alias"] ?? '',
    price: json["price"]?? '',
    description: json["Description"]?? '',
    brandId: json["brand_id"]?? '',
    supplierid: json["supplierid"]?? '',
    isPercent: json["is_percent"]?? '',
    applyCom: json["apply_com"]?? '',
    isBy: json["is_by"]?? '',
    disable: json["disable"]?? '',
    namebrand: json["namebrand"]?? '',
    nameCat: json["name_cat"]?? '',
  );

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = Map<String, dynamic>();
    data['id']= id;
    data['name_prod']= nameProd;
    data['Alias']= alias;
    data['price']= price;
    data['Description']= description;
    data['brand_id']= brandId;
    data['supplierid']= supplierid;
    data['is_percent']= isPercent;
    data['apply_com']= applyCom;
    data['is_by']= isBy;
    data['disable']= disable;
    data['namebrand']= namebrand;
    data['name_cat']= nameCat;
    return data;
  }
}
