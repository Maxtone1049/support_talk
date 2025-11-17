class ForgetPinResModel {
    ForgetPinResModel({
        required this.message,
        required this.success,
        required this.data,
    });

    final String? message;
    final bool? success;
    final Data? data;

    factory ForgetPinResModel.fromJson(Map<String, dynamic> json){ 
        return ForgetPinResModel(
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
        required this.codeSent,
    });

    final bool? codeSent;

    factory Data.fromJson(Map<String, dynamic> json){ 
        return Data(
            codeSent: json["codeSent"],
        );
    }

    Map<String, dynamic> toJson() => {
        "codeSent": codeSent,
    };

}
