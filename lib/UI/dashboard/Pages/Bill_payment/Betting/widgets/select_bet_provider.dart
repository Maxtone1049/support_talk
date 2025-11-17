import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wepay/assets/app_colors.dart';
import 'package:wepay/common/EditField/EditFieldView.dart';
import 'package:wepay/common/EditField/Model/EditFieldConfig.dart';
import 'package:wepay/common/Gap.dart';
import 'package:wepay/common/TextView/Models/TextViewConfig.dart';
import 'package:wepay/common/TextView/TextView.dart';
import 'package:wepay/core/router/page_router.dart';
import 'package:wepay/custom/buttons/green_back_button.dart';
import 'package:wepay/custom/ui_helper.dart';

class SelectBetProvider extends StatefulWidget {
  const SelectBetProvider({super.key, required this.selectedProvider});
  final TextEditingController selectedProvider;

  @override
  State<SelectBetProvider> createState() => _SelectBetProviderState();
}

class _SelectBetProviderState extends State<SelectBetProvider> {
  final sportBrand = ["Sporty", "Bet9ja", "BetKing", "BetBonanza", "Betspae"];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.h,
        left: 10.w,
        right: 10.w,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16.0,
      ),
      child: Column(
        children: [
          Row(
            children: [
              GreenBackButton(onTap: () => PageRouter.pop()),
              Gap(width: 12),
              Expanded(
                child: EditFormField(
                  config: EditFieldConfig(
                    radius: 50.r,
                    filledColor: AppColors.offshadeprimary,
                    height: 30,
                    prefixIconWidget: Icon(
                      CupertinoIcons.search,
                      size: 20.sp,
                      color: AppColors.white.withAlpha((0.70 * 225).toInt()),
                    ),
                    border: InputBorder.none,
                    label: "Search Provider",
                    labelStyle: GoogleFonts.inter(
                      color: AppColors.white.withAlpha((0.70 * 225).toInt()),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    onChange: (val) {},
                  ),
                ),
              ),
            ],
          ),
          Gap(height: 10),
          thinDivider(),
          Gap(height: 10),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 2.h),
            itemCount: sportBrand.length,
            itemBuilder: (context, index) {
              final provider = sportBrand[index];
              return ListTile(
                title: TextView(
                  config: TextViewConfig(
                    text: provider,
                    fontSize: 14,
                    color: AppColors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                // trailing: const Icon(Icons.check, color: Colors.green),
                onTap: () {
                  setState(() {
                    widget.selectedProvider.text = provider;
                  });
                  PageRouter.pop(context);
                  print("Selected Provider: ${provider}");
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
