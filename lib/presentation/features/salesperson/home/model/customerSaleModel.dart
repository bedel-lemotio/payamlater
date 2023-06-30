import 'package:json_annotation/json_annotation.dart';

part 'customerSaleModel.g.dart';

@JsonSerializable(includeIfNull: true)
class CustomerSaleModel {
  int  customerid;
  String? firstname;
  String? lastname;

  CustomerSaleModel({
    required this.customerid,
     this.firstname,
     this.lastname,
  });

  factory CustomerSaleModel.fromJson(Map<String, dynamic> json) => _$CustomerSaleModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerSaleModelToJson(this);

  @override
  String toString() {
    return 'CustomerSaleModel{customerid: $customerid, firstname: $firstname, lastname: $lastname}';
  }
}


