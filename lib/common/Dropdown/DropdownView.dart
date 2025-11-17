import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../assets/app_colors.dart';
import '../Gap.dart';
import '../TextView/Models/TextViewConfig.dart';
import '../TextView/TextView.dart';
import 'DropDownTextField.dart';
import 'Model/DropdownConfig.dart';

class DropDownView extends StatelessWidget {
  final DropdownConfig config;

  const DropDownView({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (config.title != null)
          Row(
            children: [
              Flexible(
                child: TextView(
                  config: TextViewConfig(
                    text: config.title ?? '',
                    fontSize: 14,
                    textAlign: TextAlign.left,
                    color: AppColors.grey700,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              if (config.isRequired) const Gap(width: 3),
              if (config.isRequired)
                TextView(
                  config: TextViewConfig(
                    text: '*',
                    fontSize: 12,
                    color: AppColors.primary,
                    textAlign: TextAlign.right,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              if (config.hintRight != null) const Spacer(),
              if (config.hintRight != null)
                TextView(
                  config: TextViewConfig(
                    text: config.hintRight ?? '',
                    fontSize: 12,
                    textAlign: TextAlign.right,
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ],
          ),
        if (config.title != null) const Gap(height: 8),
        DropDownTextField(
          textEditingController: config.controller,
          clearOption: true,
          dropdownRadius: 8.r,
          padding: EdgeInsets.zero,
          autovalidateMode: config.autoValidateMode,
          validator: config.stringValidator,
          dropDownIconProperty: IconProperty(icon: Icons.keyboard_arrow_down),
          listTextStyle: config.textStyle,
          textStyle: config.textStyle,
          textFieldDecoration: InputDecoration(
            labelText: config.label,
            hintStyle: config.hintStyle,
            labelStyle: config.labelStyle,
            filled: config.filled,
            fillColor: config.filledColor,
            prefix: config.prefixWidget,
            prefixIcon: config.prefixIconWidget,
            hintText: config.hint,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(config.radius.r),
              borderSide: const BorderSide(color: AppColors.accent, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(config.radius.r),
              borderSide: const BorderSide(color: AppColors.grey300),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(config.radius.r),
              borderSide: const BorderSide(color: AppColors.grey300),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(config.radius.r),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(config.radius.r),
              borderSide: const BorderSide(color: Colors.red),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(config.radius.r),
              borderSide: const BorderSide(color: AppColors.primary),
            ),
            floatingLabelBehavior: config.floatingLabelBehavior,
            alignLabelWithHint: config.alignLabelWithHint,
            contentPadding:
                config.edgeInsetsGeometry ??
                EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
            suffixIcon: Align(
              widthFactor: 1.0,
              heightFactor: 1.0,
              child: config.suffixIconWidget,
            ),
          ),
          dropDownItemCount: config.dropDownList.length,
          dropDownList: config.dropDownList,
          onChanged: config.onChanged,
        ),
      ],
    );
  }
}
