import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:wepay/assets/app_colors.dart';

class PincodeWidget extends StatelessWidget {
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final Function(String)? onCompleted;
  final String? Function(String?)? validator;
  final double errorTextSpace;
  final bool enabled;
  final int length;
  final double? hieght, width;

  const PincodeWidget({
    super.key,
    this.focusNode,
    this.controller,
    this.onCompleted,
    this.errorTextSpace = 30,
    this.enabled = true,
    this.validator,
    required this.length,
    this.hieght,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: length,
      obscureText: false,
      animationType: AnimationType.fade,
      scrollPadding: EdgeInsets.zero,
      cursorColor: AppColors.primary,
      hintCharacter: '*',
      autoDisposeControllers: false,
      errorTextSpace: errorTextSpace,
      enabled: enabled,
      hintStyle: Theme.of(context).textTheme.headlineLarge?.copyWith(
        color: AppColors.grey300,
        fontSize: 24,
      ),
      textStyle: Theme.of(context).textTheme.headlineLarge?.copyWith(
        color: AppColors.primary,
        fontSize: 24,
      ),
      keyboardType: TextInputType.none,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      animationCurve: Curves.ease,
      pinTheme: PinTheme(
        borderRadius: BorderRadius.circular(10.r),
        shape: PinCodeFieldShape.box,
        fieldOuterPadding: const EdgeInsets.symmetric(horizontal: 3.75),
        fieldWidth: width?.h,
        fieldHeight: hieght?.h,
        activeFillColor: Color(0xffF4f4f4).withAlpha((.70 * 225).toInt()),
        disabledColor: Color(0xffD7D7D7),
        inactiveColor: Color(0xffD7D7D7),
        inactiveFillColor: AppColors.dimgrey.withAlpha((0.2 * 255).toInt()),
        selectedColor: AppColors.primary,
        selectedFillColor: Colors.transparent,
        activeColor: AppColors.primary,
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      enableActiveFill: true,
      controller: controller,
      focusNode: focusNode,
      inputFormatters: [
        LengthLimitingTextInputFormatter(4),
        FilteringTextInputFormatter.digitsOnly,
      ],
      onCompleted: onCompleted,
      onChanged: (value) {},
      beforeTextPaste: (text) => true,
    );
  }
}
