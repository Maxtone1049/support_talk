// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wepay/assets/app_colors.dart';
import 'package:wepay/common/Gap.dart';
import 'package:wepay/common/TextView/Models/TextViewConfig.dart';
import 'package:wepay/common/TextView/TextView.dart';
import 'package:wepay/custom/app_colors.dart';
import 'package:wepay/custom/custom_card.dart';

class CustomDropdownField<T> extends StatelessWidget {
  final String labelText;
  final String hintText;
  final T? value;
  final List<T> items;
  final ValueChanged<T?> onChanged;
  final String? Function(T?)? validator;

  const CustomDropdownField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.value,
    required this.items,
    required this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 10.h),
      margin: EdgeInsets.only(bottom: 12.h),
      border: Border.all(color: kTextFieldColor),
      color: kTextFieldColor,
      borderRadius: BorderRadius.circular(10.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView(
            config: TextViewConfig(
              text: labelText,
              fontSize: 12,
              color: AppColors.textColor,
              fontWeight: FontWeight.w400,
            ),
          ),
          Gap(height: 4),
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: kTextFieldColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: DropdownButtonFormField<T>(
              initialValue: value,
              decoration: const InputDecoration(
                border: InputBorder.none,
                isDense: true,
              ),
              isExpanded: true,
              dropdownColor: dropdownColor,
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
                size: 20.sp,
              ),
              hint: TextView(
                config: TextViewConfig(
                  text: hintText,
                  fontSize: 10,
                  color: AppColors.textColor.withAlpha((0.70 * 225).toInt()),
                  fontWeight: FontWeight.w500,
                ),
              ),
              items:
                  items
                      .toSet()
                      .toList()
                      .map(
                        (item) => DropdownMenuItem<T>(
                          value: item,
                          child: TextView(
                            config: TextViewConfig(
                              text: item.toString(),
                              fontSize: 12,
                              color: AppColors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                      .toList(),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
