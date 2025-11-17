import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wepay/assets/app_colors.dart';
import 'package:wepay/common/appmanager/shared_preferences.dart';
import 'package:wepay/core/Network/http_overrides.dart';
import 'package:wepay/core/main_core/app.locator.dart';
import 'package:wepay/core/main_core/app.router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = AppHttpOverrides();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
  await setupLocator();
  await locator<SharedPreferencesService>().initilize();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: ScreenUtilInit(
        designSize: const Size(370, 852),
        rebuildFactor: RebuildFactors.change,
        builder:
            (_, __) => KeyboardVisibilityProvider(
              child: MaterialApp(
                title: 'Wepay',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: AppColors.primary,
                  ),
                ),
                // initialRoute:
                //     SharedPreferencesService.instance.isLoggedIn == true
                //         ? Routes.dashboardView
                //         : Routes.splashScreen,
                initialRoute: Routes.splashScreen,
                navigatorKey: StackedService.navigatorKey,
                navigatorObservers: [StackedService.routeObserver],
                onGenerateRoute: StackedRouter().onGenerateRoute,
              ),
            ),
      ),
    );
  }
}
