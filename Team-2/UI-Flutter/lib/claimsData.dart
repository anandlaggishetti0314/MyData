// To parse this JSON data, do
//
//     final ClaimsData = ClaimsDataFromJson(jsonString);

import 'dart:convert';

List<ClaimsData> ClaimsDataFromJson(String str) =>
    List<ClaimsData>.from(json.decode(str).map((x) => ClaimsData.fromJson(x)));

String ClaimsDataToJson(List<ClaimsData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClaimsData {
  int key;
  int excelValue;
  int type;
  int tpa;
  int sno;

  ClaimsData({
    required this.key,
    required this.excelValue,
    required this.type,
    required this.tpa,
    required this.sno,
  });

  factory ClaimsData.fromJson(Map<String, dynamic> json) => ClaimsData(
        key: json["key"],
        excelValue: json["excelValue"],
        type: json["type"],
        tpa: json["tpa"],
        sno: json["sno"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "excelValue": excelValue,
        "type": type,
        "tpa": tpa,
        "sno": sno,
      };
}
