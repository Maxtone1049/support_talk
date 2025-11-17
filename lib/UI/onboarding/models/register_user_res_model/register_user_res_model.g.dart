// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_user_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterUserResModel _$RegisterUserResModelFromJson(
        Map<String, dynamic> json) =>
    RegisterUserResModel(
      message: json['message'] as String?,
      status: (json['status'] as num?)?.toInt(),
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterUserResModelToJson(
        RegisterUserResModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'success': instance.success,
      'data': instance.data,
    };
