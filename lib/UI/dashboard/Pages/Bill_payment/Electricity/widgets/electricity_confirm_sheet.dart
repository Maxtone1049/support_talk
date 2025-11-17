import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wepay/assets/app_colors.dart';
import 'package:wepay/common/Button/ButtonWidget.dart';
import 'package:wepay/common/Button/Model/ButtonConfig.dart';
import 'package:wepay/common/Gap.dart';
import 'package:wepay/common/TextView/Models/TextViewConfig.dart';
import 'package:wepay/common/TextView/TextView.dart';
import 'package:wepay/custom/app_colors.dart';
import 'package:wepay/custom/custom%20widgets/naira_sign.dart';
import 'package:wepay/custom/custom_card.dart';
import 'package:wepay/custom/responsive_icons.dart';
import 'package:wepay/custom/ui_helper.dart';

class ElectricityConfirmSheet extends StatelessWidget {
  const ElectricityConfirmSheet({
    super.key,
    required this.amount,
    required this.accountName,
    required this.meterNumber,
    required this.tap,
    required this.transFee,
  });

  final String amount, accountName, meterNumber, transFee;
  final Function() tap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: CustomCard(
        borderRadius: BorderRadius.circular(37.r),
        padding: kMainPadding,
        color: AppColors.kcDarkGreenColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(height: 10),
            Center(child: bottomSheetHeader),
            Gap(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.h,
                      horizontal: 10.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: AppColors.offshadeprimary,
                    ),
                    child: ResponsiveIcon(Icons.close, color: kWhiteColor),
                  ),
                ),
              ],
            ),
            Gap(height: 20),
            Center(
              child: NairaSignWidget(
                price: int.tryParse(amount),
                style: GoogleFonts.inter(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),
              ),
            ),
            Gap(height: 16),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      config: TextViewConfig(
                        text: "Account Number",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white.withAlpha((0.70 * 225).toInt()),
                      ),
                    ),
                    TextView(
                      config: TextViewConfig(
                        text: meterNumber,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                Gap(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      config: TextViewConfig(
                        text: "Name",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white.withAlpha((0.70 * 225).toInt()),
                      ),
                    ),
                    TextView(
                      config: TextViewConfig(
                        text: accountName,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                Gap(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      config: TextViewConfig(
                        text: "Amount",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white.withAlpha((0.70 * 225).toInt()),
                      ),
                    ),
                    NairaSignWidget(
                      price: int.tryParse(amount),
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                Gap(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      config: TextViewConfig(
                        text: "Transaction Fee",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white.withAlpha((0.70 * 225).toInt()),
                      ),
                    ),
                    NairaSignWidget(
                      price: int.tryParse(transFee),
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Gap(height: 16),
            ButtonWidget(
              config: ButtonConfig(
                text: "Confirm",
                fontSize: 18.sp,
                textColor: AppColors.white,
                fontWeight: FontWeight.w600,
                height: 54,
                buttonColor: AppColors.primary.withAlpha((0.51 * 225).toInt()),
                buttonOutlinedColor: AppColors.kTransparent,
                radius: 50.r,
                onPressed: tap,
              ),
            ),

            Gap(height: 20),
          ],
        ),
      ),
    );
  }
}
