// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'success_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuccessResModel _$SuccessResModelFromJson(Map<String, dynamic> json) =>
    SuccessResModel(
      message: json['message'] as String?,
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SuccessResModelToJson(SuccessResModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
      'data': instance.data,
    };
