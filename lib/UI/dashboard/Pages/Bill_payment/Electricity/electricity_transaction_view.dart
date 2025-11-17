import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wepay/UI/dashboard/Pages/Bill_payment/Electricity/widgets/ElectHistoryHolder.dart';
import 'package:wepay/assets/app_colors.dart';
import 'package:wepay/common/Gap.dart';
import 'package:wepay/common/TextView/Models/TextViewConfig.dart';
import 'package:wepay/common/TextView/TextView.dart';

class ElectricityTransactionView extends StatelessWidget {
  const ElectricityTransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(height: 20),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.containerDark,
            borderRadius: BorderRadius.circular(12.r),
          ),
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                children: [
                  TextView(
                    config: TextViewConfig(
                      text: "May, 2025",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                  Gap(width: 8),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.white,
                    size: 20.sp,
                  ),
                ],
              ),
              Gap(height: 8),
              Wrap(
                children: [
                  TextView(
                    config: TextViewConfig(
                      text: "In: ₦0.00",
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),
                  ),
                  Gap(width: 24),
                  TextView(
                    config: TextViewConfig(
                      text: "Out: ₦1,000.00",
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
              Gap(height: 16),
              ElectHistoryHolder(
                date: "May 1, 2025",
                amount: "1,000",
                status: "Successful",
              ),
              Gap(height: 12),
              ElectHistoryHolder(
                date: "May 1, 2025",
                amount: "1,000",
                status: "Pending",
              ),
              Gap(height: 16),
              TextView(
                config: TextViewConfig(
                  text:
                      "Only transaction made within the past 1 year are displayed",
                  fontSize: 11,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white.withAlpha((0.70 * 225).toInt()),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
