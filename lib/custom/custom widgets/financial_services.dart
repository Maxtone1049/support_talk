import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wepay/assets/app_colors.dart';
import 'package:wepay/common/Gap.dart';
import 'package:wepay/common/Image/ImageView.dart';
import 'package:wepay/common/Image/Model/ImageConfig.dart';
import 'package:wepay/common/TextView/Models/TextViewConfig.dart';
import 'package:wepay/common/TextView/TextView.dart';
import 'package:wepay/custom/app_colors.dart';

class FinancialServicesCard extends StatelessWidget {
  final double height;
  final double width;
  final String? text;
  final String? image;
  final VoidCallback onTap;
  const FinancialServicesCard({
    super.key,
    required this.height,
    required this.width,
    required this.text,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        margin: EdgeInsets.only(right: 12.w),
        // padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 23.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          color: k181C20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageView(
              imageConfig: ImageConfig(
                imageURL: image!,
                imageType: ImageType.svg,
              ),
            ),
            Gap(height: 8),
            TextView(
              config: TextViewConfig(
                text: text!,
                fontSize: 14,
                color: AppColors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
