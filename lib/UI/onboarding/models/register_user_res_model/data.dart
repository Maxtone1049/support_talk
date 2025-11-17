import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? id;
  String? email;
  dynamic password;
  dynamic name;
  String? bvn;
  String? gender;
  dynamic dob;
  dynamic phone;
  bool? emailVerified;
  dynamic occupation;
  dynamic education;
  dynamic religion;
  dynamic maritalStatus;
  dynamic pin;
  bool? isLocked;
  int? failedLoginAttempts;
  dynamic lockUntil;
  dynamic passwordResetTokenHash;
  dynamic passwordResetExpires;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? role;
  dynamic addressId;
  dynamic merchantId;
  dynamic instutionId;
  dynamic intitutionId;
  dynamic merchant;
  dynamic agent;

  Data({
    this.id,
    this.email,
    this.password,
    this.name,
    this.bvn,
    this.gender,
    this.dob,
    this.phone,
    this.emailVerified,
    this.occupation,
    this.education,
    this.religion,
    this.maritalStatus,
    this.pin,
    this.isLocked,
    this.failedLoginAttempts,
    this.lockUntil,
    this.passwordResetTokenHash,
    this.passwordResetExpires,
    this.createdAt,
    this.updatedAt,
    this.role,
    this.addressId,
    this.merchantId,
    this.instutionId,
    this.intitutionId,
    this.merchant,
    this.agent,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
