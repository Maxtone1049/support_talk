import 'dart:convert'; // For jsonEncode in safeString

String? _safeString(dynamic value, {String? fallbackKey}) {
  if (value == null) return null;
  if (value is String) return value;
  if (value is Map<String, dynamic>) {
    // Try common nested keys for hashed/sensitive fields like 'pin'
    final extracted =
        value[fallbackKey ?? 'value'] ??
        value['hash'] ??
        value['pin'] ??
        value['hashed'];
    if (extracted is String) return extracted;
    // Fallback: stringify the map (e.g., for debugging)
    print(
      'Warning: Non-string value for string field: ${jsonEncode(value)}',
    ); // Log for debugging
    return jsonEncode(value);
  }
  return null;
}

// Helper to safely extract string from potentially nested JSON

// Helper for safe DateTime parsing

class GetUserResModel {
  GetUserResModel({
    required this.msg,
    required this.data,
    required this.success,
  });

  final String? msg;
  final Data? data;
  final bool? success;

  factory GetUserResModel.fromJson(Map<String, dynamic> json) {
    return GetUserResModel(
      msg: json["msg"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
      success: json["success"],
    );
  }

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "data": data?.toJson(),
    "success": success,
  };
}

class Data {
  Data({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.embedlyCustomerId,
    required this.country,
    required this.bvn,
    required this.gender,
    required this.dob,
    required this.phone,
    required this.emailVerified,
    required this.occupation,
    required this.education,
    required this.religion,
    required this.maritalStatus,
    required this.pin,
    required this.isLocked,
    required this.failedLoginAttempts,
    required this.lockUntil,
    required this.passwordResetTokenHash,
    required this.passwordResetExpires,
    required this.createdAt,
    required this.updatedAt,
    required this.role,
    required this.addressId,
    required this.merchantId,
    required this.instutionId,
    required this.intitutionId,
    required this.merchant,
    required this.agent,
    required this.wallets,
    required this.address,
  });

  final String? id;
  final String? email;
  final dynamic password;
  final String? name;
  final String? embedlyCustomerId;
  final String? country;
  final String? bvn;
  final String? gender;
  final DateTime? dob;
  final String? phone;
  final bool? emailVerified;
  final String? occupation;
  final String? education;
  final String? religion;
  final String? maritalStatus;
  final String? pin;
  final bool? isLocked;
  final int? failedLoginAttempts;
  final dynamic lockUntil;
  final dynamic passwordResetTokenHash;
  final dynamic passwordResetExpires;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? role;
  final String? addressId;
  final dynamic merchantId;
  final dynamic instutionId;
  final dynamic intitutionId;
  final dynamic merchant;
  final dynamic agent;
  final List<Wallet> wallets;
  final Address? address;

  static DateTime? _safeDateTime(dynamic value) {
    final str = _safeString(value);
    return str != null ? DateTime.tryParse(str) : null;
  }

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: _safeString(json["id"]),
      email: _safeString(json["email"]),
      password: _safeString(json["password"]),
      name: _safeString(json["name"]),
      embedlyCustomerId: _safeString(json["embedlyCustomerId"]),
      country: _safeString(json["country"]),
      bvn: _safeString(json["bvn"]),
      gender: _safeString(json["gender"]),
      dob: _safeDateTime(json["dob"] ?? ""),
      phone: _safeString(json["phone"]),
      emailVerified: json["emailVerified"],
      occupation: _safeString(json["occupation"]),
      education: _safeString(json["education"]),
      religion: _safeString(json["religion"]),
      maritalStatus: _safeString(json["maritalStatus"]),
      pin: json["pin"],
      isLocked: json["isLocked"],
      failedLoginAttempts: json["failedLoginAttempts"],
      lockUntil: json["lockUntil"],
      passwordResetTokenHash: json["passwordResetTokenHash"],
      passwordResetExpires: json["passwordResetExpires"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      role: json["role"],
      addressId: json["addressId"],
      merchantId: json["merchantId"],
      instutionId: json["instutionId"],
      intitutionId: json["intitutionId"],
      merchant: json["merchant"],
      agent: json["agent"],
      wallets:
          json["wallets"] == null
              ? []
              : List<Wallet>.from(
                json["wallets"]!.map((x) => Wallet.fromJson(x)),
              ),
      address:
          json["address"] == null ? null : Address.fromJson(json["address"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "password": password,
    "name": name,
    "embedlyCustomerId": embedlyCustomerId,
    "country": country,
    "bvn": bvn,
    "gender": gender,
    "dob": dob?.toIso8601String(),
    "phone": phone,
    "emailVerified": emailVerified,
    "occupation": occupation,
    "education": education,
    "religion": religion,
    "maritalStatus": maritalStatus,
    "pin": pin,
    "isLocked": isLocked,
    "failedLoginAttempts": failedLoginAttempts,
    "lockUntil": lockUntil,
    "passwordResetTokenHash": passwordResetTokenHash,
    "passwordResetExpires": passwordResetExpires,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "role": role,
    "addressId": addressId,
    "merchantId": merchantId,
    "instutionId": instutionId,
    "intitutionId": intitutionId,
    "merchant": merchant,
    "agent": agent,
    "wallets": wallets.map((x) => x.toJson()).toList(),
    "address": address?.toJson(),
  };
}

class Address {
  Address({
    required this.id,
    required this.streetLine,
    required this.city,
    required this.state,
    required this.country,
    required this.officeAddress,
    required this.landmark,
    required this.homeAddress,
    required this.lga,
    required this.updatedAt,
    required this.createdAt,
  });

  final String? id;
  final String? streetLine;
  final String? city;
  final String? state;
  final String? country;
  final dynamic officeAddress;
  final dynamic landmark;
  final dynamic homeAddress;
  final dynamic lga;
  final DateTime? updatedAt;
  final DateTime? createdAt;

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json["id"],
      streetLine: json["streetLine"],
      city: json["city"],
      state: json["state"],
      country: json["country"],
      officeAddress: json["office_address"],
      landmark: json["landmark"],
      homeAddress: json["homeAddress"],
      lga: json["lga"],
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "streetLine": streetLine,
    "city": city,
    "state": state,
    "country": country,
    "office_address": officeAddress,
    "landmark": landmark,
    "homeAddress": homeAddress,
    "lga": lga,
    "updatedAt": updatedAt?.toIso8601String(),
    "createdAt": createdAt?.toIso8601String(),
  };
}

class Wallet {
  Wallet({
    required this.id,
    required this.userId,
    required this.walletId,
    required this.bankName,
    required this.bankCode,
    required this.accountNumber,
    required this.availableBalance,
    required this.ledgerBalance,
    required this.reservedBalance,
    required this.version,
    required this.createdAt,
    required this.updatedAt,
  });

  final String? id;
  final String? userId;
  final String? walletId;
  final String? bankName;
  final String? bankCode;
  final String? accountNumber;
  final int? availableBalance;
  final int? ledgerBalance;
  final int? reservedBalance;
  final int? version;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Wallet.fromJson(Map<String, dynamic> json) {
    return Wallet(
      id: json["id"],
      userId: json["userId"],
      walletId: json["walletId"],
      bankName: json["bankName"],
      bankCode: json["bankCode"],
      accountNumber: json["accountNumber"],
      availableBalance: json["availableBalance"],
      ledgerBalance: json["ledgerBalance"],
      reservedBalance: json["reservedBalance"],
      version: json["version"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "walletId": walletId,
    "bankName": bankName,
    "bankCode": bankCode,
    "accountNumber": accountNumber,
    "availableBalance": availableBalance,
    "ledgerBalance": ledgerBalance,
    "reservedBalance": reservedBalance,
    "version": version,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}