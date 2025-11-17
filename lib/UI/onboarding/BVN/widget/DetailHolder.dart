import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wepay/assets/app_colors.dart';
import 'package:wepay/assets/app_image.dart';
import 'package:wepay/common/Gap.dart';
import 'package:wepay/common/Image/ImageView.dart';
import 'package:wepay/common/Image/Model/ImageConfig.dart';
import 'package:wepay/common/TextView/Models/TextViewConfig.dart';
import 'package:wepay/common/TextView/TextView.dart';

class DetailHolder extends StatelessWidget {
  const DetailHolder({
    super.key,
    required this.controller,
    required this.caption,
  });

  final TextEditingController controller;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
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
              color: AppColors.textColor.withAlpha((0.70 * 225).toInt()),
            ),
          ),
          Gap(height: 4),
          caption.contains('PHONE')
              ? Row(
                children: [
                  ImageView(
                    imageConfig: ImageConfig(
                      imageURL: AppImage.flag,
                      imageType: ImageType.svg,
                    ),
                  ),
                  Gap(width: 4),
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    size: 20.sp,
                    color: AppColors.white,
                  ),
                  Gap(width: 8),
                  TextView(
                    config: TextViewConfig(
                      text:
                          '| +234 ${controller.text.length > 5 ? List.filled(controller.text.length - 3, '*').join() + controller.text.substring(controller.text.length - 3) : controller.text}',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor,
                    ),
                  ),
                ],
              )
              : TextView(
                config: TextViewConfig(
                  text: controller.text,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColor,
                ),
              ),
        ],
      ),
    );
  }
}
