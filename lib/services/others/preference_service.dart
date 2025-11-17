import 'package:shared_preferences/shared_preferences.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wepay/Models/BVN/bvn_response_model.dart';

class PreferencesService {
  // BVN Verification Data
  static const String _bvnIdKey = 'bvn_id';
  static const String _bvnKey = 'bvn';
  static const String _otpIdKey = 'otp_id';

  // User Personal Data
  static const String _fullNameKey = 'full_name';
  static const String _firstNameKey = 'first_name';
  static const String _middleNameKey = 'middle_name';
  static const String _lastNameKey = 'last_name';
  static const String _phoneNumberKey = 'phone_number';
  static const String _phoneNumber2Key = 'phone_number2';
  static const String _genderKey = 'gender';
  static const String _dobKey = 'dob';
  static const String _emailKey = 'email';
  static const String _maritalStatusKey = 'marital_status';
  static const String _nationalityKey = 'nationality';

  // Address Data
  static const String _residentialAddressKey = 'residential_address';
  static const String _stateOfResidenceKey = 'state_of_residence';
  static const String _lgaOfResidenceKey = 'lga_of_residence';

  // Other Data
  static const String _occupationKey = 'occupation';
  static const String _educationLevelKey = 'education_level';
  static const String _religionKey = 'religion';
  static const String _countryKey = 'country';
  static const String _cityKey = 'city';
  static const String _officeAddressKey = 'office_address';

  // Save BVN Verification Data
  static Future<void> saveBvnVerificationData(BvnData data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_bvnIdKey, data.id ?? '');
    await prefs.setString(_otpIdKey, data.otpId ?? '');

    if (data.providerResponse != null) {
      await saveBvnProviderData(data.providerResponse!);
    }
  }

  // Save BVN Provider Data
  static Future<void> saveBvnProviderData(ProviderResponse data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_bvnKey, data.bvn ?? '');
    await prefs.setString(_fullNameKey, data.fullName ?? '');
    await prefs.setString(_firstNameKey, data.firstName ?? '');
    await prefs.setString(_middleNameKey, data.middleName ?? '');
    await prefs.setString(_lastNameKey, data.lastName ?? '');
    await prefs.setString(_dobKey, data.dateOfBirth ?? '');
    await prefs.setString(_phoneNumberKey, data.phoneNumber1 ?? '');
    await prefs.setString(_phoneNumber2Key, data.phoneNumber2 ?? '');
    await prefs.setString(_genderKey, data.gender ?? '');
    await prefs.setString(_emailKey, data.email ?? '');
    await prefs.setString(_maritalStatusKey, data.maritalStatus ?? '');
    await prefs.setString(_nationalityKey, data.nationality ?? '');
    await prefs.setString(
      _residentialAddressKey,
      data.residentialAddress ?? '',
    );
    await prefs.setString(_stateOfResidenceKey, data.stateOfResidence ?? '');
    await prefs.setString(_lgaOfResidenceKey, data.lgaOfResidence ?? '');
  }

  // Get BVN Verification Data
  static Future<Map<String, dynamic>> getBvnVerificationData() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'bvn_id': prefs.getString(_bvnIdKey),
      'otp_id': prefs.getString(_otpIdKey),
      'bvn': prefs.getString(_bvnKey),
    };
  }

  // Get User Personal Data
  static Future<Map<String, dynamic>> getUserPersonalData() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'full_name': prefs.getString(_fullNameKey),
      'first_name': prefs.getString(_firstNameKey),
      'middle_name': prefs.getString(_middleNameKey),
      'last_name': prefs.getString(_lastNameKey),
      'phone_number': prefs.getString(_phoneNumberKey),
      'phone_number2': prefs.getString(_phoneNumber2Key),
      'gender': prefs.getString(_genderKey),
      'dob': prefs.getString(_dobKey),
      'email': prefs.getString(_emailKey),
      'marital_status': prefs.getString(_maritalStatusKey),
      'nationality': prefs.getString(_nationalityKey),
      'residential_address': prefs.getString(_residentialAddressKey),
      'state_of_residence': prefs.getString(_stateOfResidenceKey),
      'lga_of_residence': prefs.getString(_lgaOfResidenceKey),
    };
  }

  // Save Additional User Data
  static Future<void> saveAdditionalUserData(Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    if (data['occupation'] != null) {
      await prefs.setString(_occupationKey, data['occupation']);
    }
    if (data['education_level'] != null) {
      await prefs.setString(_educationLevelKey, data['education_level']);
    }
    if (data['religion'] != null) {
      await prefs.setString(_religionKey, data['religion']);
    }
    if (data['country'] != null) {
      await prefs.setString(_countryKey, data['country']);
    }
    if (data['city'] != null) {
      await prefs.setString(_cityKey, data['city']);
    }
    if (data['office_address'] != null) {
      await prefs.setString(_officeAddressKey, data['office_address']);
    }
  }

  // Save Profile Details
  static Future<void> saveProfileDetails({
    required String email,
    required String occupation,
    required String educationLevel,
    required String religion,
    required String maritalStatus,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_emailKey, email);
    await prefs.setString(_occupationKey, occupation);
    await prefs.setString(_educationLevelKey, educationLevel);
    await prefs.setString(_religionKey, religion);
    await prefs.setString(_maritalStatusKey, maritalStatus);
  }

  // Save Location Details
  static Future<void> saveLocationDetails({
    required String country,
    required String state,
    required String city,
    required String currentAddress,
    String? officeAddress,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_countryKey, country);
    await prefs.setString(_stateOfResidenceKey, state);
    await prefs.setString(_cityKey, city);
    await prefs.setString(_residentialAddressKey, currentAddress);
    if (officeAddress != null) {
      await prefs.setString(_officeAddressKey, officeAddress);
    }
  }

  // Get all user data for registration
  static Future<Map<String, dynamic>> getAllUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final personalData = await getUserPersonalData();
    final additionalData = {
      'occupation': prefs.getString(_occupationKey),
      'education_level': prefs.getString(_educationLevelKey),
      'religion': prefs.getString(_religionKey),
      'marital_status': prefs.getString(_maritalStatusKey),
      'country': prefs.getString(_countryKey),
      'state': prefs.getString(_stateOfResidenceKey),
      'city': prefs.getString(_cityKey),
      'current_address': prefs.getString(_residentialAddressKey),
      'office_address': prefs.getString(_officeAddressKey),
    };

    return {...personalData, ...additionalData};
  }

  // Clear all data
  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
// class PreferencesService {
//   static const String _bvnIdKey = 'bvn_id';
//   static const String _fullNameKey = 'full_name';
//   static const String _phoneNumberKey = 'phone_number';
//   static const String _genderKey = 'gender';
//   static const String _dobKey = 'dob';
//   static const String _emailKey = 'email';
//   static const String _occupationKey = 'occupation';
//   static const String _educationLevelKey = 'education_level';
//   static const String _religionKey = 'religion';
//   static const String _maritalStatusKey = 'marital_status';
//   static const String _countryKey = 'country';
//   static const String _stateKey = 'state';
//   static const String _cityKey = 'city';
//   static const String _currentAddressKey = 'current_address';
//   static const String _officeAddressKey = 'office_address';

//   static Future<void> saveBvnId(String id) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString(_bvnIdKey, id);
//   }

//   static Future<String?> getBvnId() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getString(_bvnIdKey);
//   }

//   static Future<void> saveUserDetails(Map<String, dynamic> details) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString(_fullNameKey, details['full_name'] ?? '');
//     await prefs.setString(_phoneNumberKey, details['phone_number'] ?? '');
//     await prefs.setString(_genderKey, details['gender'] ?? '');
//     await prefs.setString(_dobKey, details['dob'] ?? '');
//     await prefs.setString(_emailKey, details['email'] ?? '');
//     await prefs.setString(_occupationKey, details['occupation'] ?? '');
//     await prefs.setString(_educationLevelKey, details['education_level'] ?? '');
//     await prefs.setString(_religionKey, details['religion'] ?? '');
//     await prefs.setString(_maritalStatusKey, details['marital_status'] ?? '');
//     await prefs.setString(_countryKey, details['country'] ?? '');
//     await prefs.setString(_stateKey, details['state'] ?? '');
//     await prefs.setString(_cityKey, details['city'] ?? '');
//     await prefs.setString(_currentAddressKey, details['current_address'] ?? '');
//     await prefs.setString(_officeAddressKey, details['office_address'] ?? '');
//   }

//   static Future<Map<String, dynamic>> getUserDetails() async {
//     final prefs = await SharedPreferences.getInstance();
//     return {
//       'full_name': prefs.getString(_fullNameKey),
//       'phone_number': prefs.getString(_phoneNumberKey),
//       'gender': prefs.getString(_genderKey),
//       'dob': prefs.getString(_dobKey),
//       'email': prefs.getString(_emailKey),
//       'occupation': prefs.getString(_occupationKey),
//       'education_level': prefs.getString(_educationLevelKey),
//       'religion': prefs.getString(_religionKey),
//       'marital_status': prefs.getString(_maritalStatusKey),
//       'country': prefs.getString(_countryKey),
//       'state': prefs.getString(_stateKey),
//       'city': prefs.getString(_cityKey),
//       'current_address': prefs.getString(_currentAddressKey),
//       'office_address': prefs.getString(_officeAddressKey),
//     };
//   }

//   static Future<void> clearAll() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.clear();
//   }
// }
