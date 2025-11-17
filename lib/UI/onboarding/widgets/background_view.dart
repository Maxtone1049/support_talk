import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wepay/assets/app_image.dart';

class BackgroundView extends StatelessWidget {
  const BackgroundView({super.key, this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AppImage.onboardbg)),
      ),
      child: child,
    );
  }
}
