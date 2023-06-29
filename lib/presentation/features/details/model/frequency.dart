import 'dart:convert';

List<FreqPlanModel> freqPlanModelFromJson(String str) => List<FreqPlanModel>.from(json.decode(str).map((x) => FreqPlanModel.fromJson(x)));

String freqPlanModelToJson(List<FreqPlanModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FreqPlanModel {
  FreqPlanModel({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory FreqPlanModel.fromJson(Map<String, dynamic> json) => FreqPlanModel(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
