import 'package:json_annotation/json_annotation.dart';

part 'agent.g.dart';

@JsonSerializable()
class Agent {
  String? id;
  String? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic nextOfKinId;

  Agent({
    this.id,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.nextOfKinId,
  });

  factory Agent.fromJson(Map<String, dynamic> json) => _$AgentFromJson(json);

  Map<String, dynamic> toJson() => _$AgentToJson(this);
}
