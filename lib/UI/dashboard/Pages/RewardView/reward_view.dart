import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wepay/Common/Image/ImageView.dart';
import 'package:wepay/Common/Image/Model/ImageConfig.dart';
import 'package:wepay/assets/app_colors.dart';
import 'package:wepay/assets/app_image.dart';
import 'package:wepay/common/Body/BodyWidget.dart';
import 'package:wepay/common/Body/Model/BodyConfig.dart';
import 'package:wepay/common/Gap.dart';
import 'package:wepay/common/TextView/Models/TextViewConfig.dart';
import 'package:wepay/common/TextView/TextView.dart';

class RewardView extends StatelessWidget {
  const RewardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BodyWidget(
      config: BodyConfig(
        appBarTitle: "Rewards",
        showAppBar: true,
        fontSize: 15.sp,
        centerTitle: false,
        automaticallyImplyLeading: false,
        appbarBackgroundColor: Color(0xff0C1013),
        appbarTitleColor: AppColors.white,
        childPadding: EdgeInsets.zero,
        backgroundColor: Color(0xff0C1013),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff154A34), Color(0xff32B07C)],
                  ),
                ),
                child: Column(
                  children: [
                    TextView(
                      config: TextViewConfig(
                        text: "Reward",
                        fontSize: 32,
                        color: AppColors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Gap(height: 2),
                    TextView(
                      config: TextViewConfig(
                        text: "A Chance to win exciting Reward!",
                        fontSize: 16,
                        color: AppColors.white.withAlpha((0.70 * 225).toInt()),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Gap(height: 1),
                    ImageView(
                      imageConfig: ImageConfig(
                        imageURL: AppImage.reward,
                        imageType: ImageType.asset,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                transform: Matrix4.translationValues(0, 0, 0),
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      config: TextViewConfig(
                        text: "My rewards",
                        fontSize: 16,
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextView(
                      config: TextViewConfig(
                        text: "View all",
                        fontSize: 12,
                        color: AppColors.black.withAlpha((0.70 * 225).toInt()),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
