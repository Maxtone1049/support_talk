class VerifyPaymentPinModel {
    VerifyPaymentPinModel({
        required this.pin,
    });

    final String? pin;

    factory VerifyPaymentPinModel.fromJson(Map<String, dynamic> json){ 
        return VerifyPaymentPinModel(
            pin: json["pin"],
        );
    }

    Map<String, dynamic> toJson() => {
        "pin": pin,
    };

}
