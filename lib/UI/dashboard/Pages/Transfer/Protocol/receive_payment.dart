import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wepay/assets/app_colors.dart';
import 'package:wepay/common/Body/BodyWidget.dart';
import 'package:wepay/common/Body/Model/BodyConfig.dart';
import 'package:wepay/common/Button/ButtonWidget.dart';
import 'package:wepay/common/Button/Model/ButtonConfig.dart';
import 'package:wepay/common/Gap.dart';
import 'package:wepay/common/TextView/Models/TextViewConfig.dart';
import 'package:wepay/common/TextView/TextView.dart';
import 'package:wepay/core/main_core/app.router.dart';
import 'package:wepay/core/router/page_router.dart';
import 'package:wepay/custom/app_colors.dart';
import 'package:wepay/custom/buttons/green_back_button.dart';
import 'package:wepay/custom/ripple_card.dart';
import 'package:wepay/custom/ui_helper.dart';

class ReceivePaymentScreen extends StatefulWidget {
  const ReceivePaymentScreen({super.key});

  @override
  State<ReceivePaymentScreen> createState() => _ReceivePaymentScreenState();
}

class _ReceivePaymentScreenState extends State<ReceivePaymentScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

    return BodyWidget(
      config: BodyConfig(
        showAppBar: true,
        appbarBackgroundColor: AppColors.kTransparent,
        backgroundColor: AppColors.kBackgroundColor,
        appBarTitle: "Protocol X -> Receive Payment",
        appbarTitleColor: AppColors.white,
        centerTitle: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: TextView(
              config: TextViewConfig(
                text: "Records",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.primary.withAlpha((0.51 * 225).toInt()),
              ),
            ),
          ),
        ],
        showLeadingWidget: true,
        childPadding: EdgeInsets.zero,
        leadingWidget: GreenBackButton(onTap: () => PageRouter.pop()),
        fontSize: 14.sp,
        child: SingleChildScrollView(
          padding: kMainPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpaceCustom(20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: k181C20,
                ),
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      config: TextViewConfig(
                        text: "Amount",
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    ),
                    Gap(height: 16),
                    Row(
                      children: [
                        TextView(
                          config: TextViewConfig(
                            text: "₦",
                            color: kWhiteColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            style: TextStyle(color: kWhiteColor),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "10.00-5,000,000.00",
                              labelStyle: GoogleFonts.inter(fontSize: 14),
                              contentPadding: EdgeInsets.all(10),
                              // contentPadding: edgeInsetsOnlyResponsive(
                              //   bottom: (40) / 2,
                              //   left: 12,
                              //   right: 12,
                              //   top: 20,
                              // ),
                              focusedBorder: OutlineInputBorder(
                                // gapPadding: 10,
                                borderRadius: k5pxBorderRadius,
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.transparent,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                // gapPadding: 10,
                                borderRadius: k5pxBorderRadius,
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Colors.transparent,
                                ),
                              ),
                              disabledBorder: OutlineInputBorder(
                                // gapPadding: 10,
                                borderRadius: k5pxBorderRadius,
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    thinDivider(),
                    Gap(height: 19),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          RippleCard(
                            height: height * 0.035,
                            width: 82,
                            borderRadius: BorderRadius.circular(20),
                            color: k181C20,
                            border: Border.all(color: AppColors.borderColorone),
                            child: Center(
                              child: TextView(
                                config: TextViewConfig(
                                  text: "₦500.00",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.white.withAlpha(
                                    (0.70 * 225).toInt(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          horizontalSpaceSmall,
                          RippleCard(
                            height: height * 0.035,
                            width: 82,
                            borderRadius: BorderRadius.circular(20),
                            color: k181C20,
                            border: Border.all(color: AppColors.borderColorone),
                            child: Center(
                              child: TextView(
                                config: TextViewConfig(
                                  text: "₦1000.00",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.white.withAlpha(
                                    (0.70 * 225).toInt(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          horizontalSpaceSmall,
                          RippleCard(
                            height: height * 0.035,
                            width: 82,
                            borderRadius: BorderRadius.circular(20),
                            color: k181C20,
                            border: Border.all(color: AppColors.borderColorone),
                            child: Center(
                              child: TextView(
                                config: TextViewConfig(
                                  text: "₦2000.00",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.white.withAlpha(
                                    (0.70 * 225).toInt(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          horizontalSpaceSmall,
                          RippleCard(
                            height: height * 0.035,
                            width: 82,
                            borderRadius: BorderRadius.circular(20),
                            color: k181C20,
                            border: Border.all(color: AppColors.borderColorone),
                            child: Center(
                              child: TextView(
                                config: TextViewConfig(
                                  text: "₦3000.00",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.white.withAlpha(
                                    (0.70 * 225).toInt(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          horizontalSpaceSmall,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Gap(height: 16),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: k181C20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      config: TextViewConfig(
                        text: "Remark",
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    ),
                    Gap(height: 16),
                    TextField(
                      style: TextStyle(color: kWhiteColor),
                      decoration: InputDecoration(
                        labelText: "What's this payment for? (Optional)",
                        labelStyle: GoogleFonts.inter(fontSize: 12),
                        contentPadding: EdgeInsets.all(10),
                        // contentPadding: edgeInsetsOnlyResponsive(
                        //   bottom: (40) / 2,
                        //   left: 12,
                        //   right: 12,
                        //   top: 20,
                        // ),
                        focusedBorder: OutlineInputBorder(
                          gapPadding: 10,
                          borderRadius: k5pxBorderRadius,
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.transparent,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          // gapPadding: 10,
                          borderRadius: k5pxBorderRadius,
                          borderSide: BorderSide(
                            width: 0.5,
                            color: Colors.transparent,
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          // gapPadding: 10,
                          borderRadius: k5pxBorderRadius,
                          borderSide: BorderSide(
                            width: 0.5,
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                    thinDivider(),
                  ],
                ),
              ),
              Gap(height: 120),
              ButtonWidget(
                config: ButtonConfig(
                  height: 54,
                  textColor: AppColors.white,
                  fontSize: 18,
                  radius: 50.r,
                  text: "Confirm",
                  onPressed: () {
                    PageRouter.pushNamed(Routes.enterPinScreen);
                  },
                ),
              ),
              verticalSpaceCustom(40),
            ],
          ),
        ),
      ),
    );
  }
}
