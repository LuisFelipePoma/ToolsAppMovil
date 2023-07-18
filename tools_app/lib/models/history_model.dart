import 'dart:convert';

class HistoryModel {
  int? id;
  String prompt;
  String result;

  HistoryModel({
    this.id,
    required this.prompt,
    required this.result,
  });

  factory HistoryModel.fromJson(String str) =>
      HistoryModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HistoryModel.fromMap(Map<String, dynamic> json) => HistoryModel(
        id: json["id"],
        prompt: json["prompt"],
        result: json["result"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "prompt": prompt,
        "result": result,
      };
}
