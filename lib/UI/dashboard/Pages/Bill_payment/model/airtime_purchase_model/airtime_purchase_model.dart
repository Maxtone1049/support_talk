class AirtimePurchaseModel {
    AirtimePurchaseModel({
        required this.number,
        required this.amount,
        required this.country,
    });

    final String? number;
    final String? amount;
    final String? country;

    factory AirtimePurchaseModel.fromJson(Map<String, dynamic> json){ 
        return AirtimePurchaseModel(
            number: json["number"],
            amount: json["amount"],
            country: json["country"],
        );
    }

    Map<String, dynamic> toJson() => {
        "number": number,
        "amount": amount,
        "country": country,
    };

}
