import 'package:wepay/UI/onboarding/models/create_pin_model/create_pin_model.dart';
import 'package:wepay/UI/onboarding/models/forget_pin_model/forget_pin_model.dart';
import 'package:wepay/UI/onboarding/models/forget_pin_res_model/forget_pin_res_model.dart';
import 'package:wepay/UI/onboarding/models/get_user_res_model/get_user_res_model.dart';
import 'package:wepay/UI/onboarding/models/login_model/login_model.dart';
import 'package:wepay/UI/onboarding/models/register_user_model/register_user_model.dart';
import 'package:wepay/UI/onboarding/models/success_res_model/success_res_model.dart';
import 'package:wepay/UI/onboarding/models/update_user_model/update_user_model.dart';
import 'package:wepay/UI/onboarding/models/user_response_model/User_response_model.dart';
import 'package:wepay/UI/onboarding/models/verify_otp_model/verify_otp_model.dart';

abstract class AuthRepo {
  Future<SuccessResModel> createUser(RegisterUserModel createUser);
  Future<SuccessResModel> verifyOTP(VerifyOtpModel verify, String id);
  Future<UserResponseModel> loginUser(LoginModel login);
  Future<ForgetPinResModel> forgetPin(ForgetPinModel forgetPass);
  Future<SuccessResModel> resendOTP(String id);
  Future<SuccessResModel> createPin(CreatePinModel create, String id);
  Future<SuccessResModel> updateUser(UpdateUserModel create, String id);
  Future<GetUserResModel> getUser();
  // Future<CreateUserResModel> resetPass(ResetPassModelEntity resetPass);
  // Future<CreateUserResModel> changePass(ChangePassModelEntity changePass);
  // Future<CreateUserResModel> updateUser(UpdateUserModelEntity updateUser);
}
