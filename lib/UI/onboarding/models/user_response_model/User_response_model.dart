class UserResponseModel {
  UserResponseModel({
    required this.message,
    required this.success,
    required this.data,
  });

  final String? message;
  final bool? success;
  final Data? data;

  factory UserResponseModel.fromJson(Map<String, dynamic> json) {
    return UserResponseModel(
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
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });

  final String? accessToken;
  final String? refreshToken;
  final User? user;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      accessToken: json["accessToken"],
      refreshToken: json["refreshToken"],
      user: json["user"] == null ? null : User.fromJson(json["user"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "accessToken": accessToken,
    "refreshToken": refreshToken,
    "user": user?.toJson(),
  };
}

class User {
  User({
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

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      email: json["email"],
      password: json["password"],
      name: json["name"],
      embedlyCustomerId: json["embedlyCustomerId"],
      country: json["country"],
      bvn: json["bvn"],
      gender: json["gender"],
      dob: DateTime.tryParse(json["dob"] ?? ""),
      phone: json["phone"],
      emailVerified: json["emailVerified"],
      occupation: json["occupation"],
      education: json["education"],
      religion: json["religion"],
      maritalStatus: json["maritalStatus"],
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
