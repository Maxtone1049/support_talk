// To parse this JSON data, do
//
//     final bvnResponseModel = bvnResponseModelFromJson(jsonString);

import 'dart:convert';

BvnResponseModel bvnResponseModelFromJson(String str) =>
    BvnResponseModel.fromJson(json.decode(str));

String bvnResponseModelToJson(BvnResponseModel data) =>
    json.encode(data.toJson());

class BvnResponseModel {
  int? statusCode;
  BvnData? data;
  String? message;

  BvnResponseModel({this.statusCode, this.data, this.message});

  factory BvnResponseModel.fromJson(Map<String, dynamic> json) =>
      BvnResponseModel(
        statusCode: json["statusCode"],
        data: json["data"] == null ? null : BvnData.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "data": data?.toJson(),
    "message": message,
  };
}

class BvnData {
  String? id;
  String? clientId;
  String? type;
  int? amount;
  String? status;
  String? debitAccountNumber;
  int? vat;
  int? stampDuty;
  bool? isDeleted;
  bool? otpVerified;
  int? otpResendCount;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? debitMessage;
  int? debitResponsCode;
  String? debitSessionId;
  String? otpId;
  ProviderResponse? providerResponse;

  BvnData({
    this.id,
    this.clientId,
    this.type,
    this.amount,
    this.status,
    this.debitAccountNumber,
    this.vat,
    this.stampDuty,
    this.isDeleted,
    this.otpVerified,
    this.otpResendCount,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.debitMessage,
    this.debitResponsCode,
    this.debitSessionId,
    this.otpId,
    this.providerResponse,
  });

  factory BvnData.fromJson(Map<String, dynamic> json) => BvnData(
    id: json["_id"],
    clientId: json["clientId"],
    type: json["type"],
    amount: json["amount"],
    status: json["status"],
    debitAccountNumber: json["debitAccountNumber"],
    vat: json["vat"],
    stampDuty: json["stampDuty"],
    isDeleted: json["isDeleted"],
    otpVerified: json["otpVerified"],
    otpResendCount: json["otpResendCount"],
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt:
        json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    debitMessage: json["debitMessage"],
    debitResponsCode: json["debitResponsCode"],
    debitSessionId: json["debitSessionId"],
    otpId: json["otpId"],
    providerResponse:
        json["providerResponse"] == null
            ? null
            : ProviderResponse.fromJson(json["providerResponse"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "clientId": clientId,
    "type": type,
    "amount": amount,
    "status": status,
    "debitAccountNumber": debitAccountNumber,
    "vat": vat,
    "stampDuty": stampDuty,
    "isDeleted": isDeleted,
    "otpVerified": otpVerified,
    "otpResendCount": otpResendCount,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "debitMessage": debitMessage,
    "debitResponsCode": debitResponsCode,
    "debitSessionId": debitSessionId,
    "otpId": otpId,
    "providerResponse": providerResponse?.toJson(),
  };
}

class ProviderResponse {
  String? bvn;
  String? fullName;
  String? firstName;
  String? middleName;
  String? lastName;
  String? dateOfBirth;
  String? phoneNumber1;
  String? phoneNumber2;
  String? gender;
  String? enrollmentBank;
  String? enrollmentBranch;
  String? email;
  String? lgaOfOrigin;
  String? lgaOfResidence;
  String? maritalStatus;
  String? nin;
  String? nationality;
  String? residentialAddress;
  String? stateOfOrigin;
  String? stateOfResidence;
  String? title;
  String? watchListed;
  String? levelOfAccount;
  dynamic registrationDate;
  String? imageBase64;

  ProviderResponse({
    this.bvn,
    this.fullName,
    this.firstName,
    this.middleName,
    this.lastName,
    this.dateOfBirth,
    this.phoneNumber1,
    this.phoneNumber2,
    this.gender,
    this.enrollmentBank,
    this.enrollmentBranch,
    this.email,
    this.lgaOfOrigin,
    this.lgaOfResidence,
    this.maritalStatus,
    this.nin,
    this.nationality,
    this.residentialAddress,
    this.stateOfOrigin,
    this.stateOfResidence,
    this.title,
    this.watchListed,
    this.levelOfAccount,
    this.registrationDate,
    this.imageBase64,
  });

  factory ProviderResponse.fromJson(Map<String, dynamic> json) =>
      ProviderResponse(
        bvn: json["bvn"],
        fullName: json["fullName"],
        firstName: json["firstName"],
        middleName: json["middleName"],
        lastName: json["lastName"],
        dateOfBirth: json["dateOfBirth"],
        phoneNumber1: json["phoneNumber1"],
        phoneNumber2: json["phoneNumber2"],
        gender: json["gender"],
        enrollmentBank: json["enrollmentBank"],
        enrollmentBranch: json["enrollmentBranch"],
        email: json["email"],
        lgaOfOrigin: json["lgaOfOrigin"],
        lgaOfResidence: json["lgaOfResidence"],
        maritalStatus: json["maritalStatus"],
        nin: json["nin"],
        nationality: json["nationality"],
        residentialAddress: json["residentialAddress"],
        stateOfOrigin: json["stateOfOrigin"],
        stateOfResidence: json["stateOfResidence"],
        title: json["title"],
        watchListed: json["watchListed"],
        levelOfAccount: json["levelOfAccount"],
        registrationDate: json["registrationDate"],
        imageBase64: json["imageBase64"],
      );

  Map<String, dynamic> toJson() => {
    "bvn": bvn,
    "fullName": fullName,
    "firstName": firstName,
    "middleName": middleName,
    "lastName": lastName,
    "dateOfBirth": dateOfBirth,
    "phoneNumber1": phoneNumber1,
    "phoneNumber2": phoneNumber2,
    "gender": gender,
    "enrollmentBank": enrollmentBank,
    "enrollmentBranch": enrollmentBranch,
    "email": email,
    "lgaOfOrigin": lgaOfOrigin,
    "lgaOfResidence": lgaOfResidence,
    "maritalStatus": maritalStatus,
    "nin": nin,
    "nationality": nationality,
    "residentialAddress": residentialAddress,
    "stateOfOrigin": stateOfOrigin,
    "stateOfResidence": stateOfResidence,
    "title": title,
    "watchListed": watchListed,
    "levelOfAccount": levelOfAccount,
    "registrationDate": registrationDate,
    "imageBase64": imageBase64,
  };
}
