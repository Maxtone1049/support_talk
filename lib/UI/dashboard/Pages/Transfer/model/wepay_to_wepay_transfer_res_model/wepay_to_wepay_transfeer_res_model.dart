class WepayTransferResModel {
    WepayTransferResModel({
        required this.message,
        required this.success,
        required this.data,
    });

    final String? message;
    final bool? success;
    final Data? data;

    factory WepayTransferResModel.fromJson(Map<String, dynamic> json){ 
        return WepayTransferResModel(
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
        required this.transferId,
        required this.journalId,
        required this.debitLedgerId,
        required this.creditLedgerId,
        required this.status,
    });

    final String? transferId;
    final String? journalId;
    final String? debitLedgerId;
    final String? creditLedgerId;
    final String? status;

    factory Data.fromJson(Map<String, dynamic> json){ 
        return Data(
            transferId: json["transferId"],
            journalId: json["journalId"],
            debitLedgerId: json["debitLedgerId"],
            creditLedgerId: json["creditLedgerId"],
            status: json["status"],
        );
    }

    Map<String, dynamic> toJson() => {
        "transferId": transferId,
        "journalId": journalId,
        "debitLedgerId": debitLedgerId,
        "creditLedgerId": creditLedgerId,
        "status": status,
    };

}
