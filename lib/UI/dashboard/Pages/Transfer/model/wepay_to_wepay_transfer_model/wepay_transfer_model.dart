class WepayTransferModel {
    WepayTransferModel({
        required this.sender,
        required this.receiver,
        required this.amount,
        required this.currency,
        required this.reason,
    });

    final String? sender;
    final String? receiver;
    final String? amount;
    final String? currency;
    final String? reason;

    factory WepayTransferModel.fromJson(Map<String, dynamic> json){ 
        return WepayTransferModel(
            sender: json["sender"],
            receiver: json["receiver"],
            amount: json["amount"],
            currency: json["currency"],
            reason: json["reason"],
        );
    }

    Map<String, dynamic> toJson() => {
        "sender": sender,
        "receiver": receiver,
        "amount": amount,
        "currency": currency,
        "reason": reason,
    };

}
