import 'dart:convert';

import 'package:wepay/UI/onboarding/models/create_pin_model/create_pin_model.dart';
import 'package:wepay/UI/onboarding/models/forget_pin_model/forget_pin_model.dart';
import 'package:wepay/UI/onboarding/models/forget_pin_res_model/forget_pin_res_model.dart';
import 'package:wepay/UI/onboarding/models/get_user_res_model/get_user_res_model.dart';
import 'package:wepay/UI/onboarding/models/login_model/login_model.dart';
import 'package:wepay/UI/onboarding/models/update_user_model/update_user_model.dart';
import 'package:wepay/UI/onboarding/models/user_response_model/User_response_model.dart';
import 'package:wepay/common/appmanager/shared_preferences.dart';
import 'package:wepay/core/Network/Network_Service.dart';
import 'package:wepay/core/Network/UrlPath.dart';
import 'package:wepay/core/main_core/app.locator.dart';
import 'package:wepay/UI/onboarding/models/register_user_model/register_user_model.dart';
import 'package:wepay/UI/onboarding/models/success_res_model/success_res_model.dart';
import 'package:wepay/UI/onboarding/models/verify_otp_model/verify_otp_model.dart';

class AuthApi extends NetworkService {
  final _session = locator<SharedPreferencesService>();

  Future<SuccessResModel> createUser(RegisterUserModel regUser) async {
    try {
      _session.isFound401erorr = false;
      final response = await call(
        method: RequestMethod.post,
        path: UrlConfig.register_user,
        data: regUser.toJson(),
      );
      return SuccessResModel.fromJson(response.data);
    } catch (e) {
      _session.isFound401erorr = true;
      rethrow;
    }
  }

  Future<SuccessResModel> fetchOTP(String userId) async {
    try {
      _session.isFound401erorr = false;
      final response = await call(
        method: RequestMethod.post,
        path: "auth/$userId/otp",
      );
      return SuccessResModel.fromJson(response.data);
    } catch (e) {
      _session.isFound401erorr = true;
      rethrow;
    }
  }

  Future<SuccessResModel> verifyOtp(VerifyOtpModel otp, String userId) async {
    try {
      _session.isFound401erorr = false;
      final response = await call(
        method: RequestMethod.put,
        path: "auth/$userId/verify",
        data: otp.toJson(),
      );
      return SuccessResModel.fromJson(response.data);
    } catch (e) {
      _session.isFound401erorr = true;
      rethrow;
    }
  }

  Future<UserResponseModel> loginUser(LoginModel login) async {
    try {
      _session.isFound401erorr = false;
      final response = await call(
        method: RequestMethod.post,
        path: UrlConfig.login,
        data: login.toJson(),
      );
      return UserResponseModel.fromJson(response.data);
    } catch (e) {
      _session.isFound401erorr = true;
      rethrow;
    }
  }

  // Future<GetUserResModel> getUser() async {
  //   try {
  //     _session.isFound401erorr = false;
  //     final response = await call(
  //       method: RequestMethod.get,
  //       path: UrlConfig.getUser,
  //     );
  //     return GetUserResModel.fromJson(response.data);
  //   } catch (e) {
  //     _session.isFound401erorr = true;
  //     rethrow;
  //   }
  // }
  // Assuming _session and call() are defined elsewhere
  Future<GetUserResModel> getUser() async {
    try {
      _session.isFound401erorr = false;
      final response = await call(
        method: RequestMethod.get,
        path: UrlConfig.getUser,
      );

      // Debug logging: Print type and snippet of response.data
      print('Response data type: ${response.data.runtimeType}');
      if (response.data is Map<String, dynamic>) {
        print(
          'Sample data: ${jsonEncode(response.data)}'.substring(0, 500),
        ); // Truncated for logs
        if (response.data['data']?['pin'] != null) {
          print(
            'Pin type in response: ${response.data['data']['pin'].runtimeType}',
          );
        }
      }

      return GetUserResModel.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      print('Error in getUser: $e'); // Enhanced logging
      _session.isFound401erorr = true;
      rethrow;
    }
  }

  Future<ForgetPinResModel> forgetPin(ForgetPinModel pin) async {
    try {
      _session.isFound401erorr = false;
      final response = await call(
        method: RequestMethod.post,
        path: UrlConfig.forgotPin,
        data: pin.toJson(),
      );
      return ForgetPinResModel.fromJson(response.data);
    } catch (e) {
      _session.isFound401erorr = true;
      rethrow;
    }
  }

  Future<SuccessResModel> createPin(CreatePinModel pin, String id) async {
    try {
      _session.isFound401erorr = false;
      final response = await call(
        method: RequestMethod.post,
        path: "${UrlConfig.createPin}/$id/pin",
        data: pin.toJson(),
      );
      return SuccessResModel.fromJson(response.data);
    } catch (e) {
      _session.isFound401erorr = true;
      rethrow;
    }
  }

  Future<SuccessResModel> updateUser(UpdateUserModel user, String id) async {
    try {
      _session.isFound401erorr = false;
      final response = await call(
        method: RequestMethod.put,
        path: "${UrlConfig.createPin}/$id",
        data: user.toJson(),
      );
      return SuccessResModel.fromJson(response.data);
    } catch (e) {
      _session.isFound401erorr = true;
      rethrow;
    }
  }
}
