// To parse this JSON data, do
//
//     final utilityModel = utilityModelFromJson(jsonString);

import 'dart:convert';

UtilityModel utilityModelFromJson(String str) =>
    UtilityModel.fromJson(json.decode(str));

String utilityModelToJson(UtilityModel data) => json.encode(data.toJson());

class UtilityModel {
  int? statusCode;
  String? message;
  List<UtilityDatum>? data;

  UtilityModel({this.statusCode, this.message, this.data});

  factory UtilityModel.fromJson(Map<String, dynamic> json) => UtilityModel(
    statusCode: json["statusCode"],
    message: json["message"],
    data:
        json["data"] == null
            ? []
            : List<UtilityDatum>.from(
              json["data"].map((x) => UtilityDatum.fromJson(x)),
            ),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class UtilityDatum {
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

  UtilityDatum({
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

  factory UtilityDatum.fromJson(Map<String, dynamic> json) => UtilityDatum(
    id: json["_id"],
    name: json["name"],
    identifier: json["identifier"],
    service: json["service"]!,
    vendor: json["vendor"]!,
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

// enum Service { THE_61_E985_A3_BCE8_E444_A4976643 }

// final serviceValues = EnumValues({
//   "61e985a3bce8e444a4976643": Service.THE_61_E985_A3_BCE8_E444_A4976643,
// });

// enum Vendor {
//   THE_68075426_CA511_C95_F50264_E4,
//   THE_68075467_E1_C44_B9_BF8_D23749,
// }

// final vendorValues = EnumValues({
//   "68075426ca511c95f50264e4": Vendor.THE_68075426_CA511_C95_F50264_E4,
//   "68075467e1c44b9bf8d23749": Vendor.THE_68075467_E1_C44_B9_BF8_D23749,
// });

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
