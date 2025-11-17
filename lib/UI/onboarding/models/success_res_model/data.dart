import 'package:json_annotation/json_annotation.dart';

import 'agent.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? id;
  String? email;
  String? password;
  String? name;
  String? bvn;
  String? gender;
  bool? codeSent;
  DateTime? dob;
  String? phone;
  bool? emailVerified;
  String? occupation;
  String? education;
  String? religion;
  String? maritalStatus;
  dynamic pin;
  bool? isLocked;
  int? failedLoginAttempts;
  dynamic lockUntil;
  dynamic passwordResetTokenHash;
  dynamic passwordResetExpires;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? role;
  String? addressId;
  dynamic merchantId;
  dynamic merchant;
  Agent? agent;

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
    this.codeSent,
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
    this.merchant,
    this.agent,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
