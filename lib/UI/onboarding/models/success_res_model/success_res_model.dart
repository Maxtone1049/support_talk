import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'success_res_model.g.dart';

@JsonSerializable()
class SuccessResModel {
  String? message;
  bool? success;
  Data? data;

  SuccessResModel({this.message, this.success, this.data});

  factory SuccessResModel.fromJson(Map<String, dynamic> json) {
    return _$SuccessResModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SuccessResModelToJson(this);
}
