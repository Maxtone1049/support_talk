import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wepay/UI/dashboard/Pages/Add_Money/add_money_view.dart';
import 'package:wepay/UI/dashboard/Pages/Bill_payment/Airtime/airtime_screen.dart';
import 'package:wepay/UI/dashboard/Pages/Bill_payment/Data/data_screen.dart';
import 'package:wepay/UI/dashboard/Pages/Bill_payment/Electricity/electricity_benefeciary.dart';
import 'package:wepay/UI/dashboard/Pages/Bill_payment/Electricity/electricity_history.dart';
import 'package:wepay/UI/dashboard/Pages/Bill_payment/Electricity/utility_payment.dart';
import 'package:wepay/UI/dashboard/Pages/Bill_payment/Betting/betting_view.dart';
import 'package:wepay/UI/dashboard/Pages/Bill_payment/viewmodel/BillViewModel.dart';
import 'package:wepay/UI/dashboard/Pages/Transfer/Protocol/protocol_x.dart';
import 'package:wepay/UI/dashboard/Pages/Transfer/Protocol/receive_payment.dart';
import 'package:wepay/UI/dashboard/Pages/Transfer/To_Wepay/preview_screen.dart';
import 'package:wepay/UI/dashboard/Pages/Transfer/To_Wepay/to_wepay.dart';
import 'package:wepay/UI/dashboard/Pages/Transfer/api/payment_api.dart';
import 'package:wepay/UI/dashboard/Pages/Transfer/other_banks/bank_transfer.dart';
import 'package:wepay/UI/dashboard/Pages/Transfer/other_banks/preview_transfer.dart';
import 'package:wepay/UI/dashboard/Pages/Transfer/repository/payment_repo_impl.dart';
import 'package:wepay/UI/dashboard/Pages/Transfer/viewmodel/payment_view_model.dart';
import 'package:wepay/UI/dashboard/dashboard_view.dart';
import 'package:wepay/UI/dashboard/dashview_model.dart';
import 'package:wepay/UI/dashboard/home_page.dart';
import 'package:wepay/UI/dashboard/viewmodel/home_page_view_model.dart';
import 'package:wepay/UI/onboarding/Authentication/login.dart';
import 'package:wepay/UI/onboarding/BVN/bvn_detail_screen.dart';
import 'package:wepay/UI/onboarding/BVN/bvn_otp_screen.dart';
import 'package:wepay/UI/onboarding/BVN/bvn_screen.dart';
import 'package:wepay/UI/onboarding/Forgot_Pin/forgot_pin_view.dart';
import 'package:wepay/UI/onboarding/Location%20Details/location_details.dart';
import 'package:wepay/UI/onboarding/Profile%20Details/create_pin.dart';
import 'package:wepay/UI/onboarding/Profile%20Details/profile_details.dart';
import 'package:wepay/UI/onboarding/api/auth_api.dart';
import 'package:wepay/UI/onboarding/repository/auth_repo_impl.dart';
import 'package:wepay/UI/onboarding/splash_screen.dart';
import 'package:wepay/UI/onboarding/viewmodel/auth_view_model.dart';
import 'package:wepay/UI/onboarding/widgets/account_success.dart';
import 'package:wepay/UI/widgets/pin_screen.dart';
import 'package:wepay/UI/widgets/success_tansaction.dart';
import 'package:wepay/UI/widgets/thumb_print.dart';
import 'package:wepay/common/appmanager/shared_preferences.dart';

@StackedApp(
  routes: [
    CupertinoRoute(page: SplashScreen, initial: true),
    CupertinoRoute(page: HomePageScreen),
    CupertinoRoute(page: BvnScreen),
    CupertinoRoute(page: LoginScreen),
    CupertinoRoute(page: BvnOtpScreen),
    CupertinoRoute(page: BvnDetailScreen),
    CupertinoRoute(page: ProfileDetails),
    CupertinoRoute(page: LocationDetails),
    CupertinoRoute(page: CreatePin),
    CupertinoRoute(page: AccountSuccessWidget),
    CupertinoRoute(page: ToWepayScreen),
    CupertinoRoute(page: ProtocolXScreen),
    CupertinoRoute(page: BankTransferScreen),
    CupertinoRoute(page: ReceivePaymentScreen),
    CupertinoRoute(page: PreviewScreen),
    CupertinoRoute(page: ThumbPrintScreen),
    CupertinoRoute(page: SuccessTansactionScreen),
    CupertinoRoute(page: AirtimeScreen),
    CupertinoRoute(page: DataScreen),
    CupertinoRoute(page: UtilityPayment),
    CupertinoRoute(page: DashboardView),
    CupertinoRoute(page: PreviewTransferScreen),
    CupertinoRoute(page: EnterPinScreen),
    CupertinoRoute(page: ElectricityHistory),
    CupertinoRoute(page: ElectricityBenefeciary),
    CupertinoRoute(page: BettingView),
    CupertinoRoute(page: AddMoneyView),
    CupertinoRoute(page: ForgotPinView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: SharedPreferencesService),
    LazySingleton(classType: DashboardViewModel),
    LazySingleton(classType: BillViewModel),
    LazySingleton(classType: AuthRepoImpl),
    LazySingleton(classType: PaymentRepoImpl),
    LazySingleton(classType: AuthViewModel),
    LazySingleton(classType: AuthApi),
    LazySingleton(classType: PaymentApi),
    LazySingleton(classType: HomePageViewModel),
    LazySingleton(classType: PaymentViewModel),
    // LazySingleton(classType: DashboardViewModel),
    // LazySingleton(classType: HomeViewmodel),
    // LazySingleton(classType: CartViewmodel),
    // LazySingleton(classType: AuthRepoImpl),
    // LazySingleton(classType: AuthApi),
    // LazySingleton(classType: CartApi),
    // LazySingleton(classType: ProfileViewmodel),
  ],
  logger: StackedLogger(),
)
class App {}
