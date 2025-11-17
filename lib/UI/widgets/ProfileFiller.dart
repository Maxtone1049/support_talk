import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wepay/assets/app_colors.dart';
import 'package:wepay/common/TextView/Models/TextViewConfig.dart';
import 'package:wepay/common/TextView/TextView.dart';

class ProfileFiller extends StatelessWidget {
  const ProfileFiller({super.key, required this.widget, required this.caption});

  final Widget widget;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.inputFill,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView(
            config: TextViewConfig(
              text: caption,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.textColor,
            ),
          ),
          widget,
        ],
      ),
    );
  }
}
