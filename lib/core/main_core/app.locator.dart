// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_services/src/snackbar/snackbar_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../../UI/dashboard/Pages/Bill_payment/viewmodel/BillViewModel.dart';
import '../../UI/dashboard/Pages/Transfer/api/payment_api.dart';
import '../../UI/dashboard/Pages/Transfer/repository/payment_repo_impl.dart';
import '../../UI/dashboard/Pages/Transfer/viewmodel/payment_view_model.dart';
import '../../UI/dashboard/dashview_model.dart';
import '../../UI/dashboard/viewmodel/home_page_view_model.dart';
import '../../UI/onboarding/api/auth_api.dart';
import '../../UI/onboarding/repository/auth_repo_impl.dart';
import '../../UI/onboarding/viewmodel/auth_view_model.dart';
import '../../common/appmanager/shared_preferences.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => SharedPreferencesService());
  locator.registerLazySingleton(() => DashboardViewModel());
  locator.registerLazySingleton(() => BillViewModel());
  locator.registerLazySingleton(() => AuthRepoImpl());
  locator.registerLazySingleton(() => PaymentRepoImpl());
  locator.registerLazySingleton(() => AuthViewModel());
  locator.registerLazySingleton(() => AuthApi());
  locator.registerLazySingleton(() => PaymentApi());
  locator.registerLazySingleton(() => HomePageViewModel());
  locator.registerLazySingleton(() => PaymentViewModel());
}
