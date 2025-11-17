import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wepay/assets/app_colors.dart';
import 'package:wepay/assets/app_image.dart';
import 'package:wepay/common/Body/BodyWidget.dart';
import 'package:wepay/common/Body/Model/BodyConfig.dart';
import 'package:wepay/common/Image/ImageView.dart';
import 'package:wepay/common/Image/Model/ImageConfig.dart';
import 'package:wepay/common/TextView/Models/TextViewConfig.dart';
import 'package:wepay/common/TextView/TextView.dart';

class CardView extends StatelessWidget {
  const CardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BodyWidget(
      config: BodyConfig(
        appBarTitle: "Cards",
        showAppBar: true,
        fontSize: 15.sp,
        centerTitle: false,
        appbarBackgroundColor: Color(0xff0C1013),
        automaticallyImplyLeading: false,
        appbarTitleColor: AppColors.white,
        childPadding: EdgeInsets.zero,
        backgroundColor: Color(0xff0C1013),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              ImageView(
                imageConfig: ImageConfig(
                  imageURL: AppImage.atmcard,
                  imageType: ImageType.asset,
                ),
              ),
              TextView(
                config: TextViewConfig(
                  text: "COMING SOON!!!",
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
