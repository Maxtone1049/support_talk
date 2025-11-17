class TransferToBankModel {
  TransferToBankModel({
    required this.destinationAccountName,
    required this.destinationBank,
    required this.amount,
    required this.currency,
    required this.reason,
    required this.destinationAccountNumber,
  });

  final String? destinationAccountName;
  final String? destinationBank;
  final String? amount;
  final String? currency;
  final String? reason;
  final String? destinationAccountNumber;

  factory TransferToBankModel.fromJson(Map<String, dynamic> json) {
    return TransferToBankModel(
      destinationAccountName: json["destinationAccountName"],
      destinationBank: json["destinationBank"],
      amount: json["amount"],
      currency: json["currency"],
      reason: json["reason"],
      destinationAccountNumber: json["destinationAccountNumber"],
    );
  }

  Map<String, dynamic> toJson() => {
    "destinationAccountName": destinationAccountName,
    "destinationBank": destinationBank,
    "amount": amount,
    "currency": currency,
    "reason": reason,
    "destinationAccountNumber": destinationAccountNumber,
  };
}
