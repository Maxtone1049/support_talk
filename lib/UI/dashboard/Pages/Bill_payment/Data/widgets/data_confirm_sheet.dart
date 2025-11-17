import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wepay/assets/app_colors.dart' show AppColors;
import 'package:wepay/common/Button/ButtonWidget.dart';
import 'package:wepay/common/Button/Model/ButtonConfig.dart';
import 'package:wepay/common/Gap.dart';
import 'package:wepay/common/TextView/Models/TextViewConfig.dart';
import 'package:wepay/common/TextView/TextView.dart';
import 'package:wepay/core/main_core/app.router.dart';
import 'package:wepay/core/router/page_router.dart';
import 'package:wepay/custom/app_colors.dart';
import 'package:wepay/custom/custom%20widgets/naira_sign.dart';
import 'package:wepay/custom/custom_card.dart';
import 'package:wepay/custom/responsive_icons.dart';
import 'package:wepay/custom/ui_helper.dart';

class DataConfirmSheet extends StatelessWidget {
  const DataConfirmSheet({
    super.key,
    required this.phoneController,
    this.amount,
  });

  final TextEditingController phoneController;
  final String? amount;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      borderRadius: k20pxSheetRadius,
      padding: kMainPadding,
      color: AppColors.kcDarkGreenColor,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(height: 10),
            Center(child: bottomSheetHeader),
            Gap(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            Gap(height: 16),
            Center(
              child: NairaSignWidget(
                price: int.tryParse(amount!),
                style: GoogleFonts.inter(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w500,
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
                        text: "Product",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white.withAlpha((0.70 * 225).toInt()),
                      ),
                    ),
                    TextView(
                      config: TextViewConfig(
                        text: "Mobile Data",
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
                        text: "Recipient Phone",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white.withAlpha((0.70 * 225).toInt()),
                      ),
                    ),
                    TextView(
                      config: TextViewConfig(
                        text: phoneController.text,
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
                        text: "Data Bundle",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white.withAlpha((0.70 * 225).toInt()),
                      ),
                    ),
                    TextView(
                      config: TextViewConfig(
                        text: "data",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                // Gap(height: 12),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     TextView(
                //       config: TextViewConfig(
                //         text: "Duration",
                //         fontSize: 14,
                //         fontWeight: FontWeight.w400,
                //         color: AppColors.white.withAlpha((0.70 * 225).toInt()),
                //       ),
                //     ),
                //     TextView(
                //       config: TextViewConfig(
                //         text: "duration",
                //         fontSize: 14,
                //         fontWeight: FontWeight.w400,
                //         color: AppColors.white,
                //       ),
                //     ),
                //   ],
                // ),
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
                      price: int.tryParse(amount!),
                      style: GoogleFonts.inter(fontSize: 14.sp),
                    ),
                    // TextView(
                    //   config: TextViewConfig(
                    //     text: "$amount",
                    //     fontSize: 14,
                    //     fontWeight: FontWeight.w400,
                    //     color: AppColors.white,
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
            Gap(height: 20),
            ButtonWidget(
              config: ButtonConfig(
                text: "Pay",
                onPressed: () {
                  PageRouter.pop();
                  PageRouter.pushNamed(
                    Routes.thumbPrintScreen,
                    args: ThumbPrintScreenArguments(amount: amount),
                  );
                },
                height: 54,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                buttonColor: AppColors.primary.withAlpha((0.51 * 225).toInt()),
                buttonOutlinedColor: AppColors.kTransparent,
                radius: 50.r,
              ),
            ),

            Gap(height: 40),
          ],
        ),
      ),
    );
  }
}
