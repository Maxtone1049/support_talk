import 'package:json_annotation/json_annotation.dart';

part 'register_user_model.g.dart';

@JsonSerializable()
class RegisterUserModel {
  String? bvn;
  String? role;

  RegisterUserModel({this.bvn, this.role});

  factory RegisterUserModel.fromJson(Map<String, dynamic> json) {
    return _$RegisterUserModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RegisterUserModelToJson(this);
}
