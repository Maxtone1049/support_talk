class AirtimePurchaseResModel {
    AirtimePurchaseResModel({
        required this.message,
        required this.success,
        required this.data,
    });

    final String? message;
    final bool? success;
    final Data? data;

    factory AirtimePurchaseResModel.fromJson(Map<String, dynamic> json){ 
        return AirtimePurchaseResModel(
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
        required this.transaction,
        required this.journalId,
        required this.debitLedgerId,
    });

    final Transaction? transaction;
    final String? journalId;
    final String? debitLedgerId;

    factory Data.fromJson(Map<String, dynamic> json){ 
        return Data(
            transaction: json["transaction"] == null ? null : Transaction.fromJson(json["transaction"]),
            journalId: json["journalId"],
            debitLedgerId: json["debitLedgerId"],
        );
    }

    Map<String, dynamic> toJson() => {
        "transaction": transaction?.toJson(),
        "journalId": journalId,
        "debitLedgerId": debitLedgerId,
    };

}

class Transaction {
    Transaction({
        required this.id,
        required this.idempotencyKey,
        required this.userId,
        required this.walletId,
        required this.provider,
        required this.phoneNumber,
        required this.network,
        required this.amount,
        required this.currency,
        required this.status,
        required this.error,
        required this.reference,
        required this.createdAt,
        required this.updatedAt,
        required this.ledgerEntryId,
    });

    final String? id;
    final String? idempotencyKey;
    final String? userId;
    final String? walletId;
    final String? provider;
    final String? phoneNumber;
    final String? network;
    final int? amount;
    final String? currency;
    final String? status;
    final dynamic error;
    final dynamic reference;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final dynamic ledgerEntryId;

    factory Transaction.fromJson(Map<String, dynamic> json){ 
        return Transaction(
            id: json["id"],
            idempotencyKey: json["idempotencyKey"],
            userId: json["userId"],
            walletId: json["walletId"],
            provider: json["provider"],
            phoneNumber: json["phoneNumber"],
            network: json["network"],
            amount: json["amount"],
            currency: json["currency"],
            status: json["status"],
            error: json["error"],
            reference: json["reference"],
            createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
            updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
            ledgerEntryId: json["ledgerEntryId"],
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "idempotencyKey": idempotencyKey,
        "userId": userId,
        "walletId": walletId,
        "provider": provider,
        "phoneNumber": phoneNumber,
        "network": network,
        "amount": amount,
        "currency": currency,
        "status": status,
        "error": error,
        "reference": reference,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "ledgerEntryId": ledgerEntryId,
    };

}
