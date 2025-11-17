import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:wepay/custom/app_colors.dart';
import 'package:wepay/custom/ui_helper.dart';

class PinWidget extends StatefulWidget {
  final int length;
  final GestureTapCallback onTap;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onCompleted;
  const PinWidget({
    super.key,
    required this.length,
    required this.onChanged,
    required this.onTap,
    required this.onCompleted,
  });

  @override
  State<PinWidget> createState() => _PinWidgetState();
}

class _PinWidgetState extends State<PinWidget> {
  PinTheme get _defaultPinTheme => PinTheme(
    width: (responsiveScreenWidth - (16.sp * 1) - 32.sp) / 6,
    height: (responsiveScreenWidth - (16.sp * 2) - 32.sp) / 6,
    textStyle: kInter600Responsive(20),
    decoration: BoxDecoration(
      borderRadius: k10pxBorderRadius,
      color: Colors.transparent,
      border: Border.all(color: k009721),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        verticalSpaceCustom(10),
        Pinput(
          length: widget.length,
          defaultPinTheme: _defaultPinTheme,
          separatorBuilder: (index) => horizontalSpaceCustom(12),
          onChanged: widget.onChanged,
          onCompleted: widget.onCompleted,
          focusedPinTheme: _defaultPinTheme.copyWith(
            decoration: _defaultPinTheme.decoration?.copyWith(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: k005312),
              color: Colors.transparent,
            ),
          ),

          keyboardType: TextInputType.number,
        ),
        verticalSpaceCustom(16),
      ],
    );
  }
}
