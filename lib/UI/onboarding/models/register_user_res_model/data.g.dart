// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String?,
      email: json['email'] as String?,
      password: json['password'],
      name: json['name'],
      bvn: json['bvn'] as String?,
      gender: json['gender'] as String?,
      dob: json['dob'],
      phone: json['phone'],
      emailVerified: json['emailVerified'] as bool?,
      occupation: json['occupation'],
      education: json['education'],
      religion: json['religion'],
      maritalStatus: json['maritalStatus'],
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
      addressId: json['addressId'],
      merchantId: json['merchantId'],
      instutionId: json['instutionId'],
      intitutionId: json['intitutionId'],
      merchant: json['merchant'],
      agent: json['agent'],
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'bvn': instance.bvn,
      'gender': instance.gender,
      'dob': instance.dob,
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
      'instutionId': instance.instutionId,
      'intitutionId': instance.intitutionId,
      'merchant': instance.merchant,
      'agent': instance.agent,
    };
