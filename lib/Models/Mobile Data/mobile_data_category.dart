// To parse this JSON data, do
//
//     final mobileDataCategoryModel = mobileDataCategoryModelFromJson(jsonString);

import 'dart:convert';

ServiceCategoryModel serviceCategoryModelFromJson(String str) =>
    ServiceCategoryModel.fromJson(json.decode(str));

String mobileDataCategoryModelToJson(ServiceCategoryModel data) =>
    json.encode(data.toJson());

class ServiceCategoryModel {
  int? statusCode;
  String? message;
  List<DataCategoryDatum>? data;

  ServiceCategoryModel({this.statusCode, this.message, this.data});

  factory ServiceCategoryModel.fromJson(Map<String, dynamic> json) =>
      ServiceCategoryModel(
        statusCode: json["statusCode"],
        message: json["message"],
        data:
            json["data"] == null
                ? []
                : List<DataCategoryDatum>.from(
                  json["data"].map((x) => DataCategoryDatum.fromJson(x)),
                ),
      );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DataCategoryDatum {
  String? id;
  String? name;
  String? identifier;
  String? service;
  String? vendor;
  bool? isFixedAmount;
  String? description;
  String? logoUrl;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  DataCategoryDatum({
    this.id,
    this.name,
    this.identifier,
    this.service,
    this.vendor,
    this.isFixedAmount,
    this.description,
    this.logoUrl,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory DataCategoryDatum.fromJson(Map<String, dynamic> json) =>
      DataCategoryDatum(
        id: json["_id"],
        name: json["name"],
        identifier: json["identifier"],
        service: json["service"],
        vendor: json["vendor"],
        isFixedAmount: json["isFixedAmount"],
        description: json["description"],
        logoUrl: json["logoUrl"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "identifier": identifier,
    "service": service,
    "vendor": vendor,
    "isFixedAmount": isFixedAmount,
    "description": description,
    "logoUrl": logoUrl,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
