import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
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
import 'package:wepay/UI/onboarding/repository/auth_repo_impl.dart';
import 'package:wepay/common/AppUtils/app_ui_components.dart';
import 'package:wepay/common/appmanager/shared_preferences.dart';
import 'package:wepay/core/main_core/app.logger.dart';
import 'package:wepay/core/main_core/app.router.dart';
import 'package:wepay/core/router/page_router.dart';

class AuthViewModel extends BaseViewModel {
  AuthViewModel();

  final logger = getLogger('AuthViewModel');
  final repo = AuthRepoImpl();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> otpKey = GlobalKey<FormState>();
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  GlobalKey<FormState> signUpKey = GlobalKey<FormState>();
  GlobalKey<FormState> nameTagKey = GlobalKey<FormState>();
  GlobalKey<FormState> pinKey = GlobalKey<FormState>();
  GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  GlobalKey<FormState> resetOtp = GlobalKey<FormState>();
  GlobalKey<FormState> resetPass = GlobalKey<FormState>();
  GlobalKey<FormState> forgetPass = GlobalKey<FormState>();
  GlobalKey<FormState> emailToken = GlobalKey<FormState>();
  bool _passwordVisibility = true;
  bool get passwordVisibility => _passwordVisibility;
  bool _confirmPasswordVisibility = true;
  bool get confirmPasswordVisibility => _confirmPasswordVisibility;
  bool _rememberMe = true;
  bool get rememberMe => _rememberMe;
  bool? _isLoading;
  bool? get isLoading => _isLoading;
  void togglePasswordVisibility() {
    _passwordVisibility = !_passwordVisibility;
    notifyListeners();
  }

  void toggleRememberMe() {
    _rememberMe = !_rememberMe;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    _confirmPasswordVisibility = !_confirmPasswordVisibility;
    notifyListeners();
  }

  final session = SharedPreferencesService();

  Timer? countdownTimer;
  Duration myDuration = const Duration(minutes: 3);
  bool get canResendCode =>
      ((myDuration.inMinutes == 0) && (myDuration.inSeconds == 0));
  void startTimer() {
    countdownTimer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => _setCountDown(),
    );
  }

  void _setCountDown() {
    const reduceSecondsBy = 1;
    final seconds = myDuration.inSeconds - reduceSecondsBy;
    if (seconds < 0) {
      countdownTimer!.cancel();
    } else {
      myDuration = Duration(seconds: seconds);
    }
    notifyListeners();
  }

  void _stopTimer() {
    countdownTimer?.cancel();
    notifyListeners();
  }

  void _resetTimer() {
    _stopTimer();
    myDuration = const Duration(minutes: 3);
    // notifyListeners();
  }

  void refreshTimer() {
    _resetTimer();
    startTimer();
  }

  String strDigits(int n) => n.toString().padLeft(2, '0');

  SuccessResModel? _successResModel;
  SuccessResModel? get successResModel => _successResModel;

  Future<void> signUpUser(RegisterUserModel user) async {
    try {
      _isLoading = true;
      _successResModel = await runBusyFuture(
        repo.createUser(user),
        throwException: true,
      );
      _isLoading = false;
      AppUiComponents.triggerNotification("Otp Sent", error: false);

      await PageRouter.pushNamed(
        Routes.bvnOtpScreen,
        args: BvnOtpScreenArguments(
          userId: _successResModel!.data!.id.toString(),
        ),
      );
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUiComponents.triggerNotification(e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> vertUser(VerifyOtpModel otp, String id) async {
    try {
      _isLoading = true;
      _successResModel = await runBusyFuture(
        repo.verifyOTP(otp, id),
        throwException: true,
      );
      _isLoading = false;
      AppUiComponents.triggerNotification("Otp Verified", error: false);

      await PageRouter.pushNamed(
        Routes.bvnDetailScreen,
        args: BvnDetailScreenArguments(
          userId: _successResModel!.data!.id.toString(),
          model: _successResModel,
        ),
      );
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUiComponents.triggerNotification(e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> updateUserInfo(UpdateUserModel update, String id) async {
    try {
      _isLoading = true;
      _successResModel = await runBusyFuture(
        repo.updateUser(update, id),
        throwException: true,
      );
      _isLoading = false;
      AppUiComponents.triggerNotification("Details Submitted", error: false);
      await PageRouter.pushNamed(
        Routes.createPin,
        args: CreatePinArguments(userId: _successResModel!.data!.id.toString()),
      );
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUiComponents.triggerNotification(e.toString(), error: true);
    }
    notifyListeners();
  }

  ForgetPinResModel? _forgetPinResModel;
  ForgetPinResModel? get forgetPinResModel => _forgetPinResModel;
  Future<void> forgotPin(ForgetPinModel update) async {
    try {
      _isLoading = true;
      _forgetPinResModel = await runBusyFuture(
        repo.forgetPin(update),
        throwException: true,
      );
      _isLoading = false;
      AppUiComponents.triggerNotification("Otp Sent", error: false);
      await PageRouter.pushNamed(
        Routes.bvnOtpScreen,
        args: BvnOtpScreenArguments(userId: ""),
      );
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUiComponents.triggerNotification(e.toString(), error: true);
    }
    notifyListeners();
  }

  SuccessResModel? _resendOtpModel;
  SuccessResModel? get resendOtpModel => _resendOtpModel;
  Future<void> resendOTP(String id) async {
    try {
      _isLoading = true;
      _resendOtpModel = await runBusyFuture(
        repo.resendOTP(id),
        throwException: true,
      );
      _isLoading = false;
      AppUiComponents.triggerNotification("Otp Resent", error: false);
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUiComponents.triggerNotification(e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> createPin(CreatePinModel update, String id) async {
    try {
      _isLoading = true;
      _successResModel = await runBusyFuture(
        repo.createPin(update, id),
        throwException: true,
      );
      _isLoading = false;
      AppUiComponents.triggerNotification("Pin Created", error: false);
      await PageRouter.pushNamed(Routes.accountSuccessWidget);
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUiComponents.triggerNotification(e.toString(), error: true);
    }
    notifyListeners();
  }

  UserResponseModel? _loginModel;
  UserResponseModel? get loginModel => _loginModel;
  Future<void> loginUser(LoginModel update) async {
    try {
      _isLoading = true;
      _loginModel = await runBusyFuture(
        repo.loginUser(update),
        throwException: true,
      );
      _isLoading = false;
      session.authToken = _loginModel!.data!.accessToken!.toString();
      await currentUser();
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUiComponents.triggerNotification(e.toString(), error: true);
    }
    notifyListeners();
  }

  GetUserResModel? _getUserResModel;
  GetUserResModel? get getUserResModel => _getUserResModel;
  Future<void> currentUser() async {
    try {
      _isLoading = true;
      _getUserResModel = await runBusyFuture(
        repo.getUser(),
        throwException: true,
      );
      _isLoading = false;
      session.usersData = _getUserResModel!.data!.toJson();
      AppUiComponents.triggerNotification("Login Successful", error: false);
      await PageRouter.pushReplacement(Routes.dashboardView);
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUiComponents.triggerNotification(e.toString(), error: true);
    }
    notifyListeners();
  }
}
