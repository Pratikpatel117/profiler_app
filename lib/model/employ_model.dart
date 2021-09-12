// To parse this JSON data, do
//
//     final employModel = employModelFromJson(jsonString);

import 'dart:convert';

List<EmployModel> employModelFromJson(String str) => List<EmployModel>.from(
    json.decode(str).map((x) => EmployModel.fromJson(x)));

String employModelToJson(List<EmployModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmployModel {
  EmployModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  factory EmployModel.fromJson(Map<String, dynamic> json) => EmployModel(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}
