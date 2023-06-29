import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  String? token;
  int? id;
  String? name;
  String? descr;
  bool? isSelected = false;

  CategoryModel({
    this.token,
    this.id,
    this.name,
    this.descr,
    this.isSelected
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    token: json["token"],
    id: json["id"],
    name: json["name"],
    descr: json["descr"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "id": id,
    "name": name,
    "descr": descr,
  };
}
