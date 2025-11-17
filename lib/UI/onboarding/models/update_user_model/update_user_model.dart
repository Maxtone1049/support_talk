class UpdateUserModel {
  UpdateUserModel({
    required this.email,
    required this.occupation,
    required this.education,
    required this.religion,
    required this.maritalStatus,
    required this.address,
  });

  final String? email;
  final String? occupation;
  final String? education;
  final String? religion;
  final String? maritalStatus;
  final Address? address;

  factory UpdateUserModel.fromJson(Map<String, dynamic> json) {
    return UpdateUserModel(
      email: json["email"],
      occupation: json["occupation"],
      education: json["education"],
      religion: json["religion"],
      maritalStatus: json["maritalStatus"],
      address:
          json["address"] == null ? null : Address.fromJson(json["address"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "email": email,
    "occupation": occupation,
    "education": education,
    "religion": religion,
    "maritalStatus": maritalStatus,
    "address": address?.toJson(),
  };
}

class Address {
  Address({
    required this.country,
    required this.state,
    required this.city,
    required this.streetLine,
  });

  final String? country;
  final String? state;
  final String? city;
  final String? streetLine;

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      country: json["country"],
      state: json["state"],
      city: json["city"],
      streetLine: json["streetLine"],
    );
  }

  Map<String, dynamic> toJson() => {
    "country": country,
    "state": state,
    "city": city,
    "streetLine": streetLine,
  };
}
