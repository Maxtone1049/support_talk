// To parse this JSON data, do
//
//     final serviceListModel = serviceListModelFromJson(jsonString);

import 'dart:convert';

class ServiceListModel {
  final int? statusCode;
  final String? message;
  final List<ServicesDatum> data;

  ServiceListModel({this.statusCode, this.message, this.data = const []});

  factory ServiceListModel.fromJson(Map<String, dynamic> json) {
    return ServiceListModel(
      statusCode: json["statusCode"],
      message: json["message"],
      data:
          (json["data"] as List<dynamic>?)
              ?.map((x) => ServicesDatum.fromJson(x))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "data": data.map((x) => x.toJson()).toList(),
  };
}

class ServicesDatum {
  final String? id;
  final String? name;
  final String? identifier;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  ServicesDatum({
    this.id,
    this.name,
    this.identifier,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory ServicesDatum.fromJson(Map<String, dynamic> json) {
    return ServicesDatum(
      id: json["_id"] as String?,
      name: json["name"] as String?,
      identifier: json["identifier"] as String?,
      description: json["description"] as String?,
      createdAt: _tryParseDate(json["createdAt"] as String?),
      updatedAt: _tryParseDate(json["updatedAt"] as String?),
      v: json["__v"] as int?,
    );
  }

  static DateTime? _tryParseDate(String? date) {
    if (date == null || date.isEmpty) return null;
    try {
      return DateTime.parse(date);
    } catch (_) {
      return null;
    }
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "identifier": identifier,
    "description": description,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
