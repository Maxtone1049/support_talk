class VerifyPaymentPinResModel {
    VerifyPaymentPinResModel({
        required this.message,
        required this.success,
        required this.data,
    });

    final String? message;
    final bool? success;
    final Data? data;

    factory VerifyPaymentPinResModel.fromJson(Map<String, dynamic> json){ 
        return VerifyPaymentPinResModel(
            message: json["message"],
            success: json["success"],
            data: json["data"] == null ? null : Data.fromJson(json["data"]),
        );
    }

    Map<String, dynamic> toJson() => {
        "message": message,
        "success": success,
        "data": data?.toJson(),
    };

}

class Data {
    Data({
        required this.isVerified,
    });

    final bool? isVerified;

    factory Data.fromJson(Map<String, dynamic> json){ 
        return Data(
            isVerified: json["isVerified"],
        );
    }

    Map<String, dynamic> toJson() => {
        "isVerified": isVerified,
    };

}
