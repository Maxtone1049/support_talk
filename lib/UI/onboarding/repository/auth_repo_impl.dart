import 'package:wepay/UI/onboarding/models/create_pin_model/create_pin_model.dart';
import 'package:wepay/UI/onboarding/models/forget_pin_model/forget_pin_model.dart';
import 'package:wepay/UI/onboarding/models/forget_pin_res_model/forget_pin_res_model.dart';
import 'package:wepay/UI/onboarding/models/get_user_res_model/get_user_res_model.dart';
import 'package:wepay/UI/onboarding/models/login_model/login_model.dart';
import 'package:wepay/UI/onboarding/models/update_user_model/update_user_model.dart';
import 'package:wepay/UI/onboarding/models/user_response_model/User_response_model.dart';
import 'package:wepay/common/appmanager/shared_preferences.dart';
import 'package:wepay/UI/onboarding/api/auth_api.dart';
import 'package:wepay/core/main_core/app.locator.dart';
import 'package:wepay/UI/onboarding/models/register_user_model/register_user_model.dart';
import 'package:wepay/UI/onboarding/models/success_res_model/success_res_model.dart';
import 'package:wepay/UI/onboarding/models/verify_otp_model/verify_otp_model.dart';
import 'package:wepay/UI/onboarding/repository/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final _authApi = locator<AuthApi>();
  final _session = locator<SharedPreferencesService>();

  @override
  Future<SuccessResModel> createUser(RegisterUserModel createUser) async =>
      await _authApi.createUser(createUser);

  @override
  Future<SuccessResModel> verifyOTP(VerifyOtpModel verify, String id) async =>
      await _authApi.verifyOtp(verify, id);

  @override
  Future<UserResponseModel> loginUser(LoginModel login) async {
    final res = await _authApi.loginUser(login);
    _session.authToken = res.data?.accessToken ?? '';
    if (res.data!.accessToken!.isNotEmpty) {
      _session.isLoggedIn = true;
    }
    return res;
  }

  @override
  Future<ForgetPinResModel> forgetPin(ForgetPinModel forgetPass) async =>
      await _authApi.forgetPin(forgetPass);

  @override
  Future<SuccessResModel> createPin(CreatePinModel create, String id) async =>
      await _authApi.createPin(create, id);

  @override
  Future<SuccessResModel> updateUser(UpdateUserModel create, String id) async =>
      await _authApi.updateUser(create, id);

  @override
  Future<GetUserResModel> getUser() async {
    final res = await _authApi.getUser();
    if (res.msg!.isNotEmpty) {
      _session.usersData = res.data?.toJson();
    }
    return res;
  }

  @override
  Future<SuccessResModel> resendOTP(String id) async =>
      await _authApi.fetchOTP(id);
}
