import 'package:overlay_support/overlay_support.dart';
import 'package:wepay/custom/app_colors.dart';
import 'package:wepay/custom/app_values.dart';
import 'package:wepay/custom/image_card.dart';
import 'package:wepay/custom/overlay_widget.dart';

class ToastService {
  static showSuccessToast({String? message}) {
    showOverlayNotification(
      (_) => ToastOverlay(
        message: message ?? '',
        backgroundColor: kEFFEF2,
        borderColor: k009721,
        leading: const ImageCard.local('check_icon.svg', size: 20),
      ),
      duration: twoSeconds,
    );
  }

  static showErrorToast({String? message}) {
    showOverlayNotification(
      (_) => ToastOverlay(
        message: message ?? '',
        borderColor: kF69600,
        backgroundColor: kFEEBCD,
        leading: const ImageCard.local('logo.svg', size: 20),
      ),
      duration: fiveSeconds,
    );
  }
}
