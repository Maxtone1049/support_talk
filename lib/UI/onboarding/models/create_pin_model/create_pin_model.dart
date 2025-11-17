import 'package:json_annotation/json_annotation.dart';

part 'create_pin_model.g.dart';

@JsonSerializable()
class CreatePinModel {
  String? pin;

  CreatePinModel({this.pin});

  factory CreatePinModel.fromJson(Map<String, dynamic> json) {
    return _$CreatePinModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreatePinModelToJson(this);
}
