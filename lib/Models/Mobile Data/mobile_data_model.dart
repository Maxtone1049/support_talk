class DataPlanResponse {
  final int? statusCode;
  final String? message;
  final List<DataPlan>? data;

  DataPlanResponse({this.statusCode, this.message, this.data});

  factory DataPlanResponse.fromJson(Map<String, dynamic> json) {
    return DataPlanResponse(
      statusCode: json['statusCode'],
      message: json['message'],
      data:
          (json['data'] as List)
              .map((item) => DataPlan.fromJson(item))
              .toList(),
    );
  }
}

class DataPlan {
  final String? validity;
  final String? bundleCode;
  final double? amount;
  final bool? isAmountFixed;

  DataPlan({this.validity, this.bundleCode, this.amount, this.isAmountFixed});

  factory DataPlan.fromJson(Map<String, dynamic> json) {
    return DataPlan(
      validity: json['validity'],
      bundleCode: json['bundleCode'],
      amount: json['amount'].toDouble(),
      isAmountFixed: json['isAmountFixed'],
    );
  }

  // Helper method to parse the validity string into components
  Map<String, String> parseValidity() {
    final parts = validity?.split('@');
    final dataPart = parts![0];
    final rest = parts[1].split(' ');

    return {'data': dataPart, 'price': rest[0], 'duration': rest[1]};
  }
}
