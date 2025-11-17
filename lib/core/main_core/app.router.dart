// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/cupertino.dart' as _i30;
import 'package:flutter/material.dart' as _i31;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i33;
import 'package:wepay/UI/dashboard/dashboard_view.dart' as _i22;
import 'package:wepay/UI/dashboard/home_page.dart' as _i3;
import 'package:wepay/UI/dashboard/Pages/Add_Money/add_money_view.dart' as _i28;
import 'package:wepay/UI/dashboard/Pages/Bill_payment/Airtime/airtime_screen.dart'
    as _i19;
import 'package:wepay/UI/dashboard/Pages/Bill_payment/Betting/betting_view.dart'
    as _i27;
import 'package:wepay/UI/dashboard/Pages/Bill_payment/Data/data_screen.dart'
    as _i20;
import 'package:wepay/UI/dashboard/Pages/Bill_payment/Electricity/electricity_benefeciary.dart'
    as _i26;
import 'package:wepay/UI/dashboard/Pages/Bill_payment/Electricity/electricity_history.dart'
    as _i25;
import 'package:wepay/UI/dashboard/Pages/Bill_payment/Electricity/utility_payment.dart'
    as _i21;
import 'package:wepay/UI/dashboard/Pages/Transfer/other_banks/bank_transfer.dart'
    as _i14;
import 'package:wepay/UI/dashboard/Pages/Transfer/other_banks/preview_transfer.dart'
    as _i23;
import 'package:wepay/UI/dashboard/Pages/Transfer/Protocol/protocol_x.dart'
    as _i13;
import 'package:wepay/UI/dashboard/Pages/Transfer/Protocol/receive_payment.dart'
    as _i15;
import 'package:wepay/UI/dashboard/Pages/Transfer/To_Wepay/preview_screen.dart'
    as _i16;
import 'package:wepay/UI/dashboard/Pages/Transfer/To_Wepay/to_wepay.dart'
    as _i12;
import 'package:wepay/UI/onboarding/Authentication/login.dart' as _i5;
import 'package:wepay/UI/onboarding/BVN/bvn_detail_screen.dart' as _i7;
import 'package:wepay/UI/onboarding/BVN/bvn_otp_screen.dart' as _i6;
import 'package:wepay/UI/onboarding/BVN/bvn_screen.dart' as _i4;
import 'package:wepay/UI/onboarding/Forgot_Pin/forgot_pin_view.dart' as _i29;
import 'package:wepay/UI/onboarding/Location%20Details/location_details.dart'
    as _i9;
import 'package:wepay/UI/onboarding/models/success_res_model/success_res_model.dart'
    as _i32;
import 'package:wepay/UI/onboarding/Profile%20Details/create_pin.dart' as _i10;
import 'package:wepay/UI/onboarding/Profile%20Details/profile_details.dart'
    as _i8;
import 'package:wepay/UI/onboarding/splash_screen.dart' as _i2;
import 'package:wepay/UI/onboarding/widgets/account_success.dart' as _i11;
import 'package:wepay/UI/widgets/pin_screen.dart' as _i24;
import 'package:wepay/UI/widgets/success_tansaction.dart' as _i18;
import 'package:wepay/UI/widgets/thumb_print.dart' as _i17;

class Routes {
  static const splashScreen = '/';

  static const homePageScreen = '/home-page-screen';

  static const bvnScreen = '/bvn-screen';

  static const loginScreen = '/login-screen';

  static const bvnOtpScreen = '/bvn-otp-screen';

  static const bvnDetailScreen = '/bvn-detail-screen';

  static const profileDetails = '/profile-details';

  static const locationDetails = '/location-details';

  static const createPin = '/create-pin';

  static const accountSuccessWidget = '/account-success-widget';

  static const toWepayScreen = '/to-wepay-screen';

  static const protocolXScreen = '/protocol-xScreen';

  static const bankTransferScreen = '/bank-transfer-screen';

  static const receivePaymentScreen = '/receive-payment-screen';

  static const previewScreen = '/preview-screen';

  static const thumbPrintScreen = '/thumb-print-screen';

  static const successTansactionScreen = '/success-tansaction-screen';

  static const airtimeScreen = '/airtime-screen';

  static const dataScreen = '/data-screen';

  static const utilityPayment = '/utility-payment';

  static const dashboardView = '/dashboard-view';

  static const previewTransferScreen = '/preview-transfer-screen';

  static const enterPinScreen = '/enter-pin-screen';

  static const electricityHistory = '/electricity-history';

  static const electricityBenefeciary = '/electricity-benefeciary';

  static const bettingView = '/betting-view';

  static const addMoneyView = '/add-money-view';

  static const forgotPinView = '/forgot-pin-view';

  static const all = <String>{
    splashScreen,
    homePageScreen,
    bvnScreen,
    loginScreen,
    bvnOtpScreen,
    bvnDetailScreen,
    profileDetails,
    locationDetails,
    createPin,
    accountSuccessWidget,
    toWepayScreen,
    protocolXScreen,
    bankTransferScreen,
    receivePaymentScreen,
    previewScreen,
    thumbPrintScreen,
    successTansactionScreen,
    airtimeScreen,
    dataScreen,
    utilityPayment,
    dashboardView,
    previewTransferScreen,
    enterPinScreen,
    electricityHistory,
    electricityBenefeciary,
    bettingView,
    addMoneyView,
    forgotPinView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.splashScreen,
      page: _i2.SplashScreen,
    ),
    _i1.RouteDef(
      Routes.homePageScreen,
      page: _i3.HomePageScreen,
    ),
    _i1.RouteDef(
      Routes.bvnScreen,
      page: _i4.BvnScreen,
    ),
    _i1.RouteDef(
      Routes.loginScreen,
      page: _i5.LoginScreen,
    ),
    _i1.RouteDef(
      Routes.bvnOtpScreen,
      page: _i6.BvnOtpScreen,
    ),
    _i1.RouteDef(
      Routes.bvnDetailScreen,
      page: _i7.BvnDetailScreen,
    ),
    _i1.RouteDef(
      Routes.profileDetails,
      page: _i8.ProfileDetails,
    ),
    _i1.RouteDef(
      Routes.locationDetails,
      page: _i9.LocationDetails,
    ),
    _i1.RouteDef(
      Routes.createPin,
      page: _i10.CreatePin,
    ),
    _i1.RouteDef(
      Routes.accountSuccessWidget,
      page: _i11.AccountSuccessWidget,
    ),
    _i1.RouteDef(
      Routes.toWepayScreen,
      page: _i12.ToWepayScreen,
    ),
    _i1.RouteDef(
      Routes.protocolXScreen,
      page: _i13.ProtocolXScreen,
    ),
    _i1.RouteDef(
      Routes.bankTransferScreen,
      page: _i14.BankTransferScreen,
    ),
    _i1.RouteDef(
      Routes.receivePaymentScreen,
      page: _i15.ReceivePaymentScreen,
    ),
    _i1.RouteDef(
      Routes.previewScreen,
      page: _i16.PreviewScreen,
    ),
    _i1.RouteDef(
      Routes.thumbPrintScreen,
      page: _i17.ThumbPrintScreen,
    ),
    _i1.RouteDef(
      Routes.successTansactionScreen,
      page: _i18.SuccessTansactionScreen,
    ),
    _i1.RouteDef(
      Routes.airtimeScreen,
      page: _i19.AirtimeScreen,
    ),
    _i1.RouteDef(
      Routes.dataScreen,
      page: _i20.DataScreen,
    ),
    _i1.RouteDef(
      Routes.utilityPayment,
      page: _i21.UtilityPayment,
    ),
    _i1.RouteDef(
      Routes.dashboardView,
      page: _i22.DashboardView,
    ),
    _i1.RouteDef(
      Routes.previewTransferScreen,
      page: _i23.PreviewTransferScreen,
    ),
    _i1.RouteDef(
      Routes.enterPinScreen,
      page: _i24.EnterPinScreen,
    ),
    _i1.RouteDef(
      Routes.electricityHistory,
      page: _i25.ElectricityHistory,
    ),
    _i1.RouteDef(
      Routes.electricityBenefeciary,
      page: _i26.ElectricityBenefeciary,
    ),
    _i1.RouteDef(
      Routes.bettingView,
      page: _i27.BettingView,
    ),
    _i1.RouteDef(
      Routes.addMoneyView,
      page: _i28.AddMoneyView,
    ),
    _i1.RouteDef(
      Routes.forgotPinView,
      page: _i29.ForgotPinView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.SplashScreen: (data) {
      return _i30.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i2.SplashScreen(),
        settings: data,
      );
    },
    _i3.HomePageScreen: (data) {
      return _i30.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i3.HomePageScreen(),
        settings: data,
      );
    },
    _i4.BvnScreen: (data) {
      return _i30.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i4.BvnScreen(),
        settings: data,
      );
    },
    _i5.LoginScreen: (data) {
      return _i30.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i5.LoginScreen(),
        settings: data,
      );
    },
    _i6.BvnOtpScreen: (data) {
      final args = data.getArgs<BvnOtpScreenArguments>(nullOk: false);
      return _i30.CupertinoPageRoute<dynamic>(
        builder: (context) =>
            _i6.BvnOtpScreen(key: args.key, userId: args.userId),
        settings: data,
      );
    },
    _i7.BvnDetailScreen: (data) {
      final args = data.getArgs<BvnDetailScreenArguments>(nullOk: false);
      return _i30.CupertinoPageRoute<dynamic>(
        builder: (context) => _i7.BvnDetailScreen(
            key: args.key, userId: args.userId, model: args.model),
        settings: data,
      );
    },
    _i8.ProfileDetails: (data) {
      final args = data.getArgs<ProfileDetailsArguments>(nullOk: false);
      return _i30.CupertinoPageRoute<dynamic>(
        builder: (context) =>
            _i8.ProfileDetails(key: args.key, userId: args.userId),
        settings: data,
      );
    },
    _i9.LocationDetails: (data) {
      final args = data.getArgs<LocationDetailsArguments>(nullOk: false);
      return _i30.CupertinoPageRoute<dynamic>(
        builder: (context) => _i9.LocationDetails(args.userId, args.email,
            args.occupation, args.education, args.religion, args.marital,
            key: args.key),
        settings: data,
      );
    },
    _i10.CreatePin: (data) {
      final args = data.getArgs<CreatePinArguments>(nullOk: false);
      return _i30.CupertinoPageRoute<dynamic>(
        builder: (context) => _i10.CreatePin(args.userId, key: args.key),
        settings: data,
      );
    },
    _i11.AccountSuccessWidget: (data) {
      return _i30.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i11.AccountSuccessWidget(),
        settings: data,
      );
    },
    _i12.ToWepayScreen: (data) {
      return _i30.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i12.ToWepayScreen(),
        settings: data,
      );
    },
    _i13.ProtocolXScreen: (data) {
      return _i30.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i13.ProtocolXScreen(),
        settings: data,
      );
    },
    _i14.BankTransferScreen: (data) {
      return _i30.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i14.BankTransferScreen(),
        settings: data,
      );
    },
    _i15.ReceivePaymentScreen: (data) {
      return _i30.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i15.ReceivePaymentScreen(),
        settings: data,
      );
    },
    _i16.PreviewScreen: (data) {
      final args = data.getArgs<PreviewScreenArguments>(nullOk: false);
      return _i30.CupertinoPageRoute<dynamic>(
        builder: (context) => _i16.PreviewScreen(
            key: args.key,
            accountnumber: args.accountnumber,
            accountName: args.accountName),
        settings: data,
      );
    },
    _i17.ThumbPrintScreen: (data) {
      final args = data.getArgs<ThumbPrintScreenArguments>(
        orElse: () => const ThumbPrintScreenArguments(),
      );
      return _i30.CupertinoPageRoute<dynamic>(
        builder: (context) => _i17.ThumbPrintScreen(
            key: args.key, amount: args.amount, id: args.id),
        settings: data,
      );
    },
    _i18.SuccessTansactionScreen: (data) {
      final args = data.getArgs<SuccessTansactionScreenArguments>(
        orElse: () => const SuccessTansactionScreenArguments(),
      );
      return _i30.CupertinoPageRoute<dynamic>(
        builder: (context) => _i18.SuccessTansactionScreen(
            key: args.key, amount: args.amount, id: args.id),
        settings: data,
      );
    },
    _i19.AirtimeScreen: (data) {
      final args = data.getArgs<AirtimeScreenArguments>(nullOk: false);
      return _i30.CupertinoPageRoute<dynamic>(
        builder: (context) => _i19.AirtimeScreen(key: args.key, id: args.id),
        settings: data,
      );
    },
    _i20.DataScreen: (data) {
      final args = data.getArgs<DataScreenArguments>(nullOk: false);
      return _i30.CupertinoPageRoute<dynamic>(
        builder: (context) => _i20.DataScreen(key: args.key, id: args.id),
        settings: data,
      );
    },
    _i21.UtilityPayment: (data) {
      final args = data.getArgs<UtilityPaymentArguments>(nullOk: false);
      return _i30.CupertinoPageRoute<dynamic>(
        builder: (context) => _i21.UtilityPayment(key: args.key, id: args.id),
        settings: data,
      );
    },
    _i22.DashboardView: (data) {
      return _i30.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i22.DashboardView(),
        settings: data,
      );
    },
    _i23.PreviewTransferScreen: (data) {
      final args = data.getArgs<PreviewTransferScreenArguments>(nullOk: false);
      return _i30.CupertinoPageRoute<dynamic>(
        builder: (context) => _i23.PreviewTransferScreen(
            key: args.key,
            accountNo: args.accountNo,
            accountName: args.accountName,
            bankName: args.bankName),
        settings: data,
      );
    },
    _i24.EnterPinScreen: (data) {
      return _i30.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i24.EnterPinScreen(),
        settings: data,
      );
    },
    _i25.ElectricityHistory: (data) {
      return _i30.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i25.ElectricityHistory(),
        settings: data,
      );
    },
    _i26.ElectricityBenefeciary: (data) {
      return _i30.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i26.ElectricityBenefeciary(),
        settings: data,
      );
    },
    _i27.BettingView: (data) {
      final args = data.getArgs<BettingViewArguments>(nullOk: false);
      return _i30.CupertinoPageRoute<dynamic>(
        builder: (context) => _i27.BettingView(key: args.key, id: args.id),
        settings: data,
      );
    },
    _i28.AddMoneyView: (data) {
      return _i30.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i28.AddMoneyView(),
        settings: data,
      );
    },
    _i29.ForgotPinView: (data) {
      return _i30.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i29.ForgotPinView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class BvnOtpScreenArguments {
  const BvnOtpScreenArguments({
    this.key,
    required this.userId,
  });

  final _i31.Key? key;

  final String userId;

  @override
  String toString() {
    return '{"key": "$key", "userId": "$userId"}';
  }

  @override
  bool operator ==(covariant BvnOtpScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.userId == userId;
  }

  @override
  int get hashCode {
    return key.hashCode ^ userId.hashCode;
  }
}

class BvnDetailScreenArguments {
  const BvnDetailScreenArguments({
    this.key,
    required this.userId,
    this.model,
  });

  final _i31.Key? key;

  final String userId;

  final _i32.SuccessResModel? model;

  @override
  String toString() {
    return '{"key": "$key", "userId": "$userId", "model": "$model"}';
  }

  @override
  bool operator ==(covariant BvnDetailScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.userId == userId && other.model == model;
  }

  @override
  int get hashCode {
    return key.hashCode ^ userId.hashCode ^ model.hashCode;
  }
}

class ProfileDetailsArguments {
  const ProfileDetailsArguments({
    this.key,
    required this.userId,
  });

  final _i31.Key? key;

  final String userId;

  @override
  String toString() {
    return '{"key": "$key", "userId": "$userId"}';
  }

  @override
  bool operator ==(covariant ProfileDetailsArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.userId == userId;
  }

  @override
  int get hashCode {
    return key.hashCode ^ userId.hashCode;
  }
}

class LocationDetailsArguments {
  const LocationDetailsArguments({
    required this.userId,
    required this.email,
    required this.occupation,
    required this.education,
    required this.religion,
    required this.marital,
    this.key,
  });

  final String userId;

  final String email;

  final String occupation;

  final String education;

  final String religion;

  final String marital;

  final _i31.Key? key;

  @override
  String toString() {
    return '{"userId": "$userId", "email": "$email", "occupation": "$occupation", "education": "$education", "religion": "$religion", "marital": "$marital", "key": "$key"}';
  }

  @override
  bool operator ==(covariant LocationDetailsArguments other) {
    if (identical(this, other)) return true;
    return other.userId == userId &&
        other.email == email &&
        other.occupation == occupation &&
        other.education == education &&
        other.religion == religion &&
        other.marital == marital &&
        other.key == key;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        email.hashCode ^
        occupation.hashCode ^
        education.hashCode ^
        religion.hashCode ^
        marital.hashCode ^
        key.hashCode;
  }
}

class CreatePinArguments {
  const CreatePinArguments({
    required this.userId,
    this.key,
  });

  final String userId;

  final _i31.Key? key;

  @override
  String toString() {
    return '{"userId": "$userId", "key": "$key"}';
  }

  @override
  bool operator ==(covariant CreatePinArguments other) {
    if (identical(this, other)) return true;
    return other.userId == userId && other.key == key;
  }

  @override
  int get hashCode {
    return userId.hashCode ^ key.hashCode;
  }
}

class PreviewScreenArguments {
  const PreviewScreenArguments({
    this.key,
    required this.accountnumber,
    this.accountName,
  });

  final _i31.Key? key;

  final String accountnumber;

  final String? accountName;

  @override
  String toString() {
    return '{"key": "$key", "accountnumber": "$accountnumber", "accountName": "$accountName"}';
  }

  @override
  bool operator ==(covariant PreviewScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.accountnumber == accountnumber &&
        other.accountName == accountName;
  }

  @override
  int get hashCode {
    return key.hashCode ^ accountnumber.hashCode ^ accountName.hashCode;
  }
}

class ThumbPrintScreenArguments {
  const ThumbPrintScreenArguments({
    this.key,
    this.amount,
    this.id,
  });

  final _i31.Key? key;

  final String? amount;

  final String? id;

  @override
  String toString() {
    return '{"key": "$key", "amount": "$amount", "id": "$id"}';
  }

  @override
  bool operator ==(covariant ThumbPrintScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.amount == amount && other.id == id;
  }

  @override
  int get hashCode {
    return key.hashCode ^ amount.hashCode ^ id.hashCode;
  }
}

class SuccessTansactionScreenArguments {
  const SuccessTansactionScreenArguments({
    this.key,
    this.amount,
    this.id,
  });

  final _i31.Key? key;

  final String? amount;

  final String? id;

  @override
  String toString() {
    return '{"key": "$key", "amount": "$amount", "id": "$id"}';
  }

  @override
  bool operator ==(covariant SuccessTansactionScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.amount == amount && other.id == id;
  }

  @override
  int get hashCode {
    return key.hashCode ^ amount.hashCode ^ id.hashCode;
  }
}

class AirtimeScreenArguments {
  const AirtimeScreenArguments({
    this.key,
    required this.id,
  });

  final _i31.Key? key;

  final String id;

  @override
  String toString() {
    return '{"key": "$key", "id": "$id"}';
  }

  @override
  bool operator ==(covariant AirtimeScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.id == id;
  }

  @override
  int get hashCode {
    return key.hashCode ^ id.hashCode;
  }
}

class DataScreenArguments {
  const DataScreenArguments({
    this.key,
    required this.id,
  });

  final _i31.Key? key;

  final String id;

  @override
  String toString() {
    return '{"key": "$key", "id": "$id"}';
  }

  @override
  bool operator ==(covariant DataScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.id == id;
  }

  @override
  int get hashCode {
    return key.hashCode ^ id.hashCode;
  }
}

class UtilityPaymentArguments {
  const UtilityPaymentArguments({
    this.key,
    required this.id,
  });

  final _i31.Key? key;

  final String id;

  @override
  String toString() {
    return '{"key": "$key", "id": "$id"}';
  }

  @override
  bool operator ==(covariant UtilityPaymentArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.id == id;
  }

  @override
  int get hashCode {
    return key.hashCode ^ id.hashCode;
  }
}

class PreviewTransferScreenArguments {
  const PreviewTransferScreenArguments({
    this.key,
    required this.accountNo,
    required this.accountName,
    required this.bankName,
  });

  final _i31.Key? key;

  final String accountNo;

  final String accountName;

  final String bankName;

  @override
  String toString() {
    return '{"key": "$key", "accountNo": "$accountNo", "accountName": "$accountName", "bankName": "$bankName"}';
  }

  @override
  bool operator ==(covariant PreviewTransferScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.accountNo == accountNo &&
        other.accountName == accountName &&
        other.bankName == bankName;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        accountNo.hashCode ^
        accountName.hashCode ^
        bankName.hashCode;
  }
}

class BettingViewArguments {
  const BettingViewArguments({
    this.key,
    required this.id,
  });

  final _i31.Key? key;

  final String id;

  @override
  String toString() {
    return '{"key": "$key", "id": "$id"}';
  }

  @override
  bool operator ==(covariant BettingViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.id == id;
  }

  @override
  int get hashCode {
    return key.hashCode ^ id.hashCode;
  }
}

extension NavigatorStateExtension on _i33.NavigationService {
  Future<dynamic> navigateToSplashScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHomePageScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homePageScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBvnScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.bvnScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBvnOtpScreen({
    _i31.Key? key,
    required String userId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.bvnOtpScreen,
        arguments: BvnOtpScreenArguments(key: key, userId: userId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBvnDetailScreen({
    _i31.Key? key,
    required String userId,
    _i32.SuccessResModel? model,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.bvnDetailScreen,
        arguments:
            BvnDetailScreenArguments(key: key, userId: userId, model: model),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProfileDetails({
    _i31.Key? key,
    required String userId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.profileDetails,
        arguments: ProfileDetailsArguments(key: key, userId: userId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLocationDetails({
    required String userId,
    required String email,
    required String occupation,
    required String education,
    required String religion,
    required String marital,
    _i31.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.locationDetails,
        arguments: LocationDetailsArguments(
            userId: userId,
            email: email,
            occupation: occupation,
            education: education,
            religion: religion,
            marital: marital,
            key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreatePin({
    required String userId,
    _i31.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.createPin,
        arguments: CreatePinArguments(userId: userId, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAccountSuccessWidget([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.accountSuccessWidget,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToToWepayScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.toWepayScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProtocolXScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.protocolXScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBankTransferScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.bankTransferScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToReceivePaymentScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.receivePaymentScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPreviewScreen({
    _i31.Key? key,
    required String accountnumber,
    String? accountName,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.previewScreen,
        arguments: PreviewScreenArguments(
            key: key, accountnumber: accountnumber, accountName: accountName),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToThumbPrintScreen({
    _i31.Key? key,
    String? amount,
    String? id,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.thumbPrintScreen,
        arguments: ThumbPrintScreenArguments(key: key, amount: amount, id: id),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSuccessTansactionScreen({
    _i31.Key? key,
    String? amount,
    String? id,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.successTansactionScreen,
        arguments:
            SuccessTansactionScreenArguments(key: key, amount: amount, id: id),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAirtimeScreen({
    _i31.Key? key,
    required String id,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.airtimeScreen,
        arguments: AirtimeScreenArguments(key: key, id: id),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDataScreen({
    _i31.Key? key,
    required String id,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.dataScreen,
        arguments: DataScreenArguments(key: key, id: id),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUtilityPayment({
    _i31.Key? key,
    required String id,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.utilityPayment,
        arguments: UtilityPaymentArguments(key: key, id: id),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDashboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.dashboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPreviewTransferScreen({
    _i31.Key? key,
    required String accountNo,
    required String accountName,
    required String bankName,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.previewTransferScreen,
        arguments: PreviewTransferScreenArguments(
            key: key,
            accountNo: accountNo,
            accountName: accountName,
            bankName: bankName),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEnterPinScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.enterPinScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToElectricityHistory([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.electricityHistory,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToElectricityBenefeciary([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.electricityBenefeciary,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBettingView({
    _i31.Key? key,
    required String id,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.bettingView,
        arguments: BettingViewArguments(key: key, id: id),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddMoneyView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.addMoneyView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToForgotPinView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.forgotPinView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splashScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomePageScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homePageScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBvnScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.bvnScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBvnOtpScreen({
    _i31.Key? key,
    required String userId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.bvnOtpScreen,
        arguments: BvnOtpScreenArguments(key: key, userId: userId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBvnDetailScreen({
    _i31.Key? key,
    required String userId,
    _i32.SuccessResModel? model,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.bvnDetailScreen,
        arguments:
            BvnDetailScreenArguments(key: key, userId: userId, model: model),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProfileDetails({
    _i31.Key? key,
    required String userId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.profileDetails,
        arguments: ProfileDetailsArguments(key: key, userId: userId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLocationDetails({
    required String userId,
    required String email,
    required String occupation,
    required String education,
    required String religion,
    required String marital,
    _i31.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.locationDetails,
        arguments: LocationDetailsArguments(
            userId: userId,
            email: email,
            occupation: occupation,
            education: education,
            religion: religion,
            marital: marital,
            key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCreatePin({
    required String userId,
    _i31.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.createPin,
        arguments: CreatePinArguments(userId: userId, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAccountSuccessWidget([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.accountSuccessWidget,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithToWepayScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.toWepayScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProtocolXScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.protocolXScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBankTransferScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.bankTransferScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithReceivePaymentScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.receivePaymentScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPreviewScreen({
    _i31.Key? key,
    required String accountnumber,
    String? accountName,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.previewScreen,
        arguments: PreviewScreenArguments(
            key: key, accountnumber: accountnumber, accountName: accountName),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithThumbPrintScreen({
    _i31.Key? key,
    String? amount,
    String? id,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.thumbPrintScreen,
        arguments: ThumbPrintScreenArguments(key: key, amount: amount, id: id),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSuccessTansactionScreen({
    _i31.Key? key,
    String? amount,
    String? id,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.successTansactionScreen,
        arguments:
            SuccessTansactionScreenArguments(key: key, amount: amount, id: id),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAirtimeScreen({
    _i31.Key? key,
    required String id,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.airtimeScreen,
        arguments: AirtimeScreenArguments(key: key, id: id),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDataScreen({
    _i31.Key? key,
    required String id,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.dataScreen,
        arguments: DataScreenArguments(key: key, id: id),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithUtilityPayment({
    _i31.Key? key,
    required String id,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.utilityPayment,
        arguments: UtilityPaymentArguments(key: key, id: id),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDashboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.dashboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPreviewTransferScreen({
    _i31.Key? key,
    required String accountNo,
    required String accountName,
    required String bankName,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.previewTransferScreen,
        arguments: PreviewTransferScreenArguments(
            key: key,
            accountNo: accountNo,
            accountName: accountName,
            bankName: bankName),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEnterPinScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.enterPinScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithElectricityHistory([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.electricityHistory,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithElectricityBenefeciary([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.electricityBenefeciary,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBettingView({
    _i31.Key? key,
    required String id,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.bettingView,
        arguments: BettingViewArguments(key: key, id: id),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddMoneyView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.addMoneyView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithForgotPinView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.forgotPinView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
