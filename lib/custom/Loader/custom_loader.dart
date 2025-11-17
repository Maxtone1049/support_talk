import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wepay/custom/app_colors.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: SpinKitThreeBounce(color: kLightGreen));
  }
}

class LoaderManager {
  static final OverlayEntry _loaderEntry = OverlayEntry(
    builder:
        (context) => Positioned(
          child: Material(color: Colors.black54, child: CustomLoader()),
        ),
  );

  static void showLoader(BuildContext context) {
    Overlay.of(context).insert(_loaderEntry);
  }

  static void hideLoader() {
    _loaderEntry.remove();
  }
}
