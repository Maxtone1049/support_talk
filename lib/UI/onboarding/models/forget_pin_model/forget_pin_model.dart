class ForgetPinModel {
  ForgetPinModel({required this.phone});

  final String? phone;

  factory ForgetPinModel.fromJson(Map<String, dynamic> json) {
    return ForgetPinModel(phone: json["phone"]);
  }

  Map<String, dynamic> toJson() => {"phone": phone};
}
