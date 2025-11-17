import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wepay/assets/app_colors.dart';
import 'package:wepay/common/Gap.dart';
import 'package:wepay/common/Image/ImageView.dart';
import 'package:wepay/common/Image/Model/ImageConfig.dart';
import 'package:wepay/common/TextView/Models/TextViewConfig.dart';
import 'package:wepay/common/TextView/TextView.dart';
import 'package:wepay/custom/app_colors.dart';
import 'package:wepay/custom/circular_button.dart';

class BillPaymentCard extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final String image;
  final Function() onTap;
  final EdgeInsets? margin;
  const BillPaymentCard({
    super.key,
    required this.height,
    required this.width,
    required this.text,
    required this.image,
    required this.onTap,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        // height: height,
        width: width,
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: k181C20,
        ),
        margin: margin,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularButton(
              size: 40,
              onTap: onTap,
              color: kcDarkGreenColor,
              child: Center(
                child: ImageView(
                  imageConfig: ImageConfig(
                    imageURL: image,
                    imageType: ImageType.svg,
                    height: 43.h,
                  ),
                ),
              ),
            ),
            Gap(height: 8),
            TextView(
              config: TextViewConfig(
                text: text,
                fontSize: 12,
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
