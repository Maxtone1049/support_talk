// To parse this JSON data, do
//
//     final profilrModel = profilrModelFromJson(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profilrModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  UserDetails? userDetails;
  List<SubAccount>? subAccount;

  ProfileModel({this.userDetails, this.subAccount});

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    userDetails: UserDetails.fromJson(json["user_details"]),
    subAccount:
        json["sub_account"] == null
            ? []
            : List<SubAccount>.from(
              json["sub_account"].map((x) => SubAccount.fromJson(x)),
            ),
  );

  Map<String, dynamic> toJson() => {
    "user_details": userDetails?.toJson(),
    "sub_account": List<dynamic>.from(subAccount!.map((x) => x.toJson())),
  };
}

class SubAccount {
  int? id;
  String? userId;
  String? accountNumber;
  String? accountName;
  String? accountType;
  String? currencyCode;
  String? bvn;
  String? identityId;
  String? accountBalance;
  String? status;
  String? externalReference;
  String? safeheavenId;
  DateTime? createdAt;
  DateTime? updatedAt;

  SubAccount({
    this.id,
    this.userId,
    this.accountNumber,
    this.accountName,
    this.accountType,
    this.currencyCode,
    this.bvn,
    this.identityId,
    this.accountBalance,
    this.status,
    this.externalReference,
    this.safeheavenId,
    this.createdAt,
    this.updatedAt,
  });

  factory SubAccount.fromJson(Map<String, dynamic> json) => SubAccount(
    id: json["id"],
    userId: json["user_id"],
    accountNumber: json["account_number"],
    accountName: json["account_name"],
    accountType: json["account_type"],
    currencyCode: json["currency_code"],
    bvn: json["bvn"],
    identityId: json["identity_id"],
    accountBalance: json["account_balance"],
    status: json["status"],
    externalReference: json["external_reference"],
    safeheavenId: json["safeheaven_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "account_number": accountNumber,
    "account_name": accountName,
    "account_type": accountType,
    "currency_code": currencyCode,
    "bvn": bvn,
    "identity_id": identityId,
    "account_balance": accountBalance,
    "status": status,
    "external_reference": externalReference,
    "safeheaven_id": safeheavenId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class UserDetails {
  int? id;
  String? userUniqueId;
  String? fullName;
  String? phoneNumber;
  DateTime? dateOfBirth;
  String? gender;
  String? email;
  dynamic emailVerifiedAt;
  String? occupation;
  String? educationLevel;
  String? religion;
  String? maritalStatus;
  String? country;
  String? stateOfResidence;
  String? city;
  String? currentAddress;
  String? officeAddress;
  dynamic pin;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserDetails({
    this.id,
    this.userUniqueId,
    this.fullName,
    this.phoneNumber,
    this.dateOfBirth,
    this.gender,
    this.email,
    this.emailVerifiedAt,
    this.occupation,
    this.educationLevel,
    this.religion,
    this.maritalStatus,
    this.country,
    this.stateOfResidence,
    this.city,
    this.currentAddress,
    this.officeAddress,
    this.pin,
    this.createdAt,
    this.updatedAt,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    DateTime? dob;

    if (json["date_of_birth"] != null &&
        json["date_of_birth"].toString().isNotEmpty) {
      try {
        // Expecting dd-MM-yyyy from API
        dob = DateFormat("dd-MM-yyyy").parse(json["date_of_birth"]);
      } catch (e) {
        // fallback in case API sends another format
        try {
          dob = DateTime.parse(json["date_of_birth"]);
        } catch (_) {
          dob = null;
        }
      }
    }

    return UserDetails(
      id: json["id"],
      userUniqueId: json["user_unique_id"],
      fullName: json["full_name"],
      phoneNumber: json["phone_number"],
      dateOfBirth: dob,
      gender: json["gender"],
      email: json["email"],
      emailVerifiedAt: json["email_verified_at"],
      occupation: json["occupation"],
      educationLevel: json["education_level"],
      religion: json["religion"],
      maritalStatus: json["marital_status"],
      country: json["country"],
      stateOfResidence: json["state_of_residence"],
      city: json["city"],
      currentAddress: json["current_address"],
      officeAddress: json["office_address"],
      pin: json["pin"],
      createdAt:
          json["created_at"] != null
              ? DateTime.tryParse(json["created_at"])
              : null,
      updatedAt:
          json["updated_at"] != null
              ? DateTime.tryParse(json["updated_at"])
              : null,
    );
  }

  // factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
  //   id: json["id"],
  //   userUniqueId: json["user_unique_id"],
  //   fullName: json["full_name"],
  //   phoneNumber: json["phone_number"],
  //   dateOfBirth: DateTime.parse(json["date_of_birth"]),
  //   gender: json["gender"],
  //   email: json["email"],
  //   emailVerifiedAt: json["email_verified_at"],
  //   occupation: json["occupation"],
  //   educationLevel: json["education_level"],
  //   religion: json["religion"],
  //   maritalStatus: json["marital_status"],
  //   country: json["country"],
  //   stateOfResidence: json["state_of_residence"],
  //   city: json["city"],
  //   currentAddress: json["current_address"],
  //   officeAddress: json["office_address"],
  //   pin: json["pin"],
  //   createdAt: DateTime.parse(json["created_at"]),
  //   updatedAt: DateTime.parse(json["updated_at"]),
  // );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_unique_id": userUniqueId,
    "full_name": fullName,
    "phone_number": phoneNumber,
    "date_of_birth":
        dateOfBirth != null
            ? DateFormat("dd-MM-yyyy").format(dateOfBirth!)
            : null,
    "gender": gender,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "occupation": occupation,
    "education_level": educationLevel,
    "religion": religion,
    "marital_status": maritalStatus,
    "country": country,
    "state_of_residence": stateOfResidence,
    "city": city,
    "current_address": currentAddress,
    "office_address": officeAddress,
    "pin": pin,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
