import 'dart:io';
import 'dart:math';

// import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wepay/common/AppUtils/app_ui_components.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class AppHelpers {
  // static final logger = getLogger('AppHelpers');

  static void copy(String text) async {
    if (text.isNotEmpty) {
      await Clipboard.setData(ClipboardData(text: text));
      await HapticFeedback.heavyImpact();
      AppUiComponents.triggerNotification('Copied to clip board');
      return;
    } else {
      throw ('Please enter a valid text');
    }
  }

  static Future<void> launchURL(
    Uri uri, {
    LaunchMode mode = LaunchMode.platformDefault,
  }) async {
    try {
      await launchUrl(uri, mode: mode);
    } catch (e) {
      // logger.e('Could not launch => $e => ${uri.data}');
      throw 'Could not launch';
    }
  }

  static void shareReceiptPDF(ScreenshotController screenshotController) async {
    await screenshotController.capture().then((imageFile) async {
      if (imageFile != null) {
        final directory = await getApplicationDocumentsDirectory();
        final imagePath = await File('${directory.path}/image.png').create();
        await imagePath.writeAsBytes(imageFile);

        /// Share Plugin
        await Share.shareXFiles([XFile(imagePath.path)], text: 'Receipt');
        // shareToPdf();
      }
    });
  }

  static double getDeviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height.h;

  static double getDeviceWidth(BuildContext context) =>
      MediaQuery.of(context).size.width.w;

  static void share({
    required BuildContext context,
    required String title,
    String? subject,
  }) async {
    final box = context.findRenderObject() as RenderBox?;

    await Share.share(
      title,
      subject: subject,
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    );
  }

  static Future<PackageInfo> appsInfo() async =>
      await PackageInfo.fromPlatform();

  // static Future<void> launchAppStore() async {
  //   try {
  //     final details = await appsInfo();
  //     await LaunchApp.openApp(
  //         androidPackageName: details.packageName,
  //         iosUrlScheme: '${details.appName}://',
  //         // appStoreLink: 'itms-apps://itunes.apple.com/us/app/pulse-secure/id945832041',
  //         openStore: true);
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }

  //* getting local path
  static Future<Directory> findLocalPath() async {
    final directory =
        Platform.isAndroid
            ? await getExternalStorageDirectory()
            : await getApplicationDocumentsDirectory();
    return directory!;
  }

  //* generate key
  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  static final Random _rnd = Random();

  static String generateKey(int length) => String.fromCharCodes(
    Iterable.generate(
      length,
      (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length)),
    ),
  );
}
