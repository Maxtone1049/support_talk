import 'package:stacked/stacked.dart';
import 'package:wepay/UI/onboarding/models/get_user_res_model/get_user_res_model.dart';
import 'package:wepay/UI/onboarding/repository/auth_repo_impl.dart';
import 'package:wepay/common/AppUtils/app_ui_components.dart';
import 'package:wepay/common/appmanager/shared_preferences.dart';
import 'package:wepay/core/main_core/app.locator.dart';
import 'package:wepay/core/main_core/app.logger.dart';

class HomePageViewModel extends BaseViewModel {
  HomePageViewModel();

  bool? _isLoading;
  bool? get isLoading => _isLoading;

  final logger = getLogger('HomeViewmodel');
  final session = locator<SharedPreferencesService>();
  // final homeRepo = HomeRepoImpl();
  String get name => session.usersData["name"] ?? '';
  String get email => session.usersData["email"] ?? '';
  String get phone => session.usersData["phone"] ?? '';
  String get address => session.usersData["address"] ?? '';
  String get userId => session.usersData["id"] ?? '';

  final repo = AuthRepoImpl();

  // New wallet-specific getters
  List<Map<String, dynamic>> get wallets {
    final walletsJson = session.usersData["wallets"];
    if (walletsJson == null) return [];
    return List<Map<String, dynamic>>.from(walletsJson);
  }

  String get accountNumber =>
      wallets.isNotEmpty ? (wallets.first['accountNumber'] ?? 'N/A') : 'N/A';

  String get bankName =>
      wallets.isNotEmpty ? (wallets.first['bankName'] ?? 'N/A') : 'N/A';

  int get availableBalance =>
      wallets.isNotEmpty ? (wallets.first['availableBalance'] ?? 0) : 0;

  String get formattedBalance {
    final balance = availableBalance.toString();
    // Simple comma formatting for display (e.g., 10000 -> 10,000)
    final formatted = balance.replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
    return formatted;
  }

  int get ledgerBalance =>
      wallets.isNotEmpty ? (wallets.first['ledgerBalance'] ?? 0) : 0;

  bool _showBalance = true;
  bool get showBalance => _showBalance;

  void showBal() {
    _showBalance = !_showBalance;
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
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUiComponents.triggerNotification(e.toString(), error: true);
    }
    notifyListeners();
  }
}
