// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      name: json['name'] as String?,
      bvn: json['bvn'] as String?,
      gender: json['gender'] as String?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      phone: json['phone'] as String?,
      emailVerified: json['emailVerified'] as bool?,
      occupation: json['occupation'] as String?,
      codeSent: json['codeSent'] as bool?,
      education: json['education'] as String?,
      religion: json['religion'] as String?,
      maritalStatus: json['maritalStatus'] as String?,
      pin: json['pin'],
      isLocked: json['isLocked'] as bool?,
      failedLoginAttempts: (json['failedLoginAttempts'] as num?)?.toInt(),
      lockUntil: json['lockUntil'],
      passwordResetTokenHash: json['passwordResetTokenHash'],
      passwordResetExpires: json['passwordResetExpires'],
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      role: json['role'] as String?,
      addressId: json['addressId'] as String?,
      merchantId: json['merchantId'],
      merchant: json['merchant'],
      agent: json['agent'] == null
          ? null
          : Agent.fromJson(json['agent'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'bvn': instance.bvn,
      'gender': instance.gender,
      'codeSent': instance.codeSent,
      'dob': instance.dob?.toIso8601String(),
      'phone': instance.phone,
      'emailVerified': instance.emailVerified,
      'occupation': instance.occupation,
      'education': instance.education,
      'religion': instance.religion,
      'maritalStatus': instance.maritalStatus,
      'pin': instance.pin,
      'isLocked': instance.isLocked,
      'failedLoginAttempts': instance.failedLoginAttempts,
      'lockUntil': instance.lockUntil,
      'passwordResetTokenHash': instance.passwordResetTokenHash,
      'passwordResetExpires': instance.passwordResetExpires,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'role': instance.role,
      'addressId': instance.addressId,
      'merchantId': instance.merchantId,
      'merchant': instance.merchant,
      'agent': instance.agent,
    };
