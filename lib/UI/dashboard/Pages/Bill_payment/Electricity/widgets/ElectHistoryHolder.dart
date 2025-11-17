import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wepay/assets/app_colors.dart';
import 'package:wepay/assets/app_image.dart';
import 'package:wepay/common/Gap.dart';
import 'package:wepay/common/Image/ImageView.dart';
import 'package:wepay/common/Image/Model/ImageConfig.dart';
import 'package:wepay/common/TextView/Models/TextViewConfig.dart';
import 'package:wepay/common/TextView/TextView.dart';

class ElectHistoryHolder extends StatelessWidget {
  const ElectHistoryHolder({super.key, this.date, this.amount, this.status});
  final String? date, amount, status;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageView(
          imageConfig: ImageConfig(
            imageURL: AppImage.electricity,
            imageType: ImageType.svg,
          ),
        ),
        Gap(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextView(
                config: TextViewConfig(
                  text: "Electricity",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),
              ),
              Gap(height: 4),
              TextView(
                config: TextViewConfig(
                  text: date.toString(),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white.withAlpha((0.70 * 225).toInt()),
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextView(
              config: TextViewConfig(
                text: "- ₦${amount.toString()}.00",
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.white,
              ),
            ),
            Gap(height: 4),
            Container(
              padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w),
              decoration: BoxDecoration(
                color:
                    status.toString().contains('Success')
                        ? AppColors.thickGreen
                        : AppColors.vineColor,
                borderRadius: BorderRadius.circular(21.r),
              ),
              child: TextView(
                config: TextViewConfig(
                  text: status.toString(),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color:
                      status.toString().contains('Success')
                          ? AppColors.primary.withAlpha((0.51 * 225).toInt())
                          : AppColors.thickyellow,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
