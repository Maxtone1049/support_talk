class GetBankResModel {
  GetBankResModel({required this.banks});

  final List<Bank> banks;

  factory GetBankResModel.fromJson(Map<String, dynamic> json) {
    return GetBankResModel(
      banks:
          json["banks"] == null
              ? []
              : List<Bank>.from(json["banks"]!.map((x) => Bank.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "banks": banks.map((x) => x.toJson()).toList(),
  };
}

class Bank {
  Bank({required this.bankName, required this.bankCode});

  final String? bankName;
  final String? bankCode;

  factory Bank.fromJson(Map<String, dynamic> json) {
    return Bank(bankName: json["bankName"], bankCode: json["bankCode"]);
  }

  Map<String, dynamic> toJson() => {"bankName": bankName, "bankCode": bankCode};
}
