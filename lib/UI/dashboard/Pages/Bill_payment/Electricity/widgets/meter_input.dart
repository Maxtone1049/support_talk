import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wepay/assets/app_colors.dart';
import 'package:wepay/common/Gap.dart';
import 'package:wepay/common/TextView/Models/TextViewConfig.dart';
import 'package:wepay/common/TextView/TextView.dart';
import 'package:wepay/common/Utils/App_Theme/app_theme.dart';
import 'package:wepay/common/Utils/Custom_Icons/custom_icons.dart';
import 'package:wepay/custom/app_colors.dart';
import 'package:wepay/custom/custom_card.dart';
import 'package:wepay/custom/responsive_icons.dart';

class MeterInputField extends StatelessWidget {
  final TextEditingController controller;
  final String paymentType;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;

  const MeterInputField({
    super.key,
    required this.controller,
    required this.paymentType,
    this.errorText,
    this.onChanged,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      // margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      color: k181C20,
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
      borderRadius: BorderRadius.circular(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              TextView(
                config: TextViewConfig(
                  text:
                      paymentType == 'Prepaid'
                          ? 'Meter Number'
                          : 'Account Number',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: onTap,
                child: Row(
                  children: [
                    TextView(
                      config: TextViewConfig(
                        text: "Beneficiaries",
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white.withAlpha((0.70 * 225).toInt()),
                      ),
                    ),
                    Gap(width: 5),
                    ResponsiveIcon(
                      Icons.arrow_forward_ios,
                      color: kWhiteColor,
                      size: 10.sp,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 1.h),
          TextFormField(
            controller: controller,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(20),
            ],
            onChanged: onChanged,
            style: TextStyle(color: kWhiteColor),
            decoration: InputDecoration(
              labelText:
                  paymentType == 'Prepaid'
                      ? "Enter Meter Number"
                      : 'Enter Account Number',
              labelStyle: TextStyle(fontSize: 18),
              hintText:
                  paymentType == 'Prepaid'
                      ? 'Enter Meter Number'
                      : 'Enter Account Number',
              hintStyle: AppTheme.lightTheme.textTheme.bodyLarge?.copyWith(
                color: AppTheme.lightTheme.colorScheme.onSurface.withValues(
                  alpha: 0.6,
                ),

                fontSize: 16.sp,
              ),
              //filled: true,
              // fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 4.w,
                vertical: 2.h,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: AppTheme.lightTheme.colorScheme.secondary,
                  width: 2,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: AppTheme.lightTheme.colorScheme.error,
                  width: 1,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: AppTheme.lightTheme.colorScheme.error,
                  width: 2,
                ),
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.all(3.w),
                child: CustomIconWidget(
                  iconName:
                      paymentType == 'Prepaid'
                          ? 'electric_meter'
                          : 'receipt_long',
                  color: AppTheme.lightTheme.colorScheme.secondary,
                  size: 24,
                ),
              ),
            ),
          ),
          if (errorText != null) ...[
            SizedBox(height: 1.h),
            Padding(
              padding: EdgeInsets.only(left: 2.w),
              child: Text(
                errorText!,
                style: AppTheme.lightTheme.textTheme.bodySmall?.copyWith(
                  color: AppTheme.lightTheme.colorScheme.error,
                  fontSize: 12.sp,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
