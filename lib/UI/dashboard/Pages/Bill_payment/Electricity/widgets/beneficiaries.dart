import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wepay/assets/app_colors.dart';
import 'package:wepay/common/Gap.dart';
import 'package:wepay/common/Image/ImageView.dart';
import 'package:wepay/common/Image/Model/ImageConfig.dart';
import 'package:wepay/common/TextView/Models/TextViewConfig.dart';
import 'package:wepay/common/TextView/TextView.dart';

class ElectBeneficiaryHolder extends StatelessWidget {
  const ElectBeneficiaryHolder({
    super.key,
    this.img,
    this.discoCompany,
    this.meterNumber,
  });
  final String? img, discoCompany, meterNumber;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 18.h),
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: AppColors.white.withAlpha((0.09 * 225).toInt()),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          ImageView(
            imageConfig: ImageConfig(
              imageURL: img.toString(),
              imageType: ImageType.svg,
            ),
          ),
          Gap(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  config: TextViewConfig(
                    text: discoCompany.toString(),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                  ),
                ),
                Gap(height: 0.5),
                TextView(
                  config: TextViewConfig(
                    text: meterNumber.toString(),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_sharp,
            size: 20.sp,
            color: AppColors.white,
          ),
        ],
      ),
    );
  }
}
