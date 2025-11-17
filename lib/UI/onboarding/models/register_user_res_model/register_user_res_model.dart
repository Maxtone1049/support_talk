import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'register_user_res_model.g.dart';

@JsonSerializable()
class RegisterUserResModel {
  String? message;
  int? status;
  bool? success;
  Data? data;

  RegisterUserResModel({this.message, this.status, this.success, this.data});

  factory RegisterUserResModel.fromJson(Map<String, dynamic> json) {
    return _$RegisterUserResModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RegisterUserResModelToJson(this);
}
