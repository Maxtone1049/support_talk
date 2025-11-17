import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wepay/UI/dashboard/Pages/Bill_payment/Electricity/widgets/beneficiaries.dart';
import 'package:wepay/assets/app_colors.dart';
import 'package:wepay/assets/app_image.dart';
import 'package:wepay/common/Body/BodyWidget.dart';
import 'package:wepay/common/Body/Model/BodyConfig.dart';
import 'package:wepay/common/Gap.dart';
import 'package:wepay/common/TextView/Models/TextViewConfig.dart';
import 'package:wepay/common/TextView/TextView.dart';
import 'package:wepay/core/main_core/app.router.dart';
import 'package:wepay/core/router/page_router.dart';
import 'package:wepay/custom/buttons/green_back_button.dart';

class ElectricityBenefeciary extends StatelessWidget {
  const ElectricityBenefeciary({super.key});

  @override
  Widget build(BuildContext context) {
    return BodyWidget(
      config: BodyConfig(
        showAppBar: true,
        appbarBackgroundColor: AppColors.kTransparent,
        backgroundColor: AppColors.kBackgroundColor,
        appBarTitle: "Electricity Beneficiary",
        appbarTitleColor: AppColors.white,
        centerTitle: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: TextView(
              config: TextViewConfig(
                text: "History",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.primary.withAlpha((0.51 * 225).toInt()),
                onTap: () {
                  PageRouter.pop();
                  PageRouter.pushNamed(Routes.electricityHistory);
                },
              ),
            ),
          ),
        ],
        showLeadingWidget: true,
        childPadding: EdgeInsets.zero,
        leadingWidget: GreenBackButton(onTap: () => PageRouter.pop()),
        fontSize: 14.sp,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              Gap(height: 18),
              ElectBeneficiaryHolder(
                img: AppImage.electricity,
                discoCompany: "Ibadan Electricity",
                meterNumber: "01***(93736788292737)",
              ),
              ElectBeneficiaryHolder(
                img: AppImage.electricity,
                discoCompany: "Ibadan Electricity",
                meterNumber: "01***(93736788292737)",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
