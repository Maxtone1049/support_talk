import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:wepay/custom/app_colors.dart';
import 'package:wepay/custom/app_values.dart';
import 'package:wepay/custom/custom_richtext.dart';
import 'package:wepay/custom/extensions/extensions.dart';
import 'package:wepay/custom/ui_helper.dart';

class OTPWidget extends StatefulWidget {
  final int length;
  final GestureTapCallback onTap;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onCompleted;
  final bool? otpType;

  const OTPWidget({
    required this.length,
    required this.onChanged,
    required this.onTap,
    required this.onCompleted,
    super.key, this.otpType,
  });

  @override
  State<OTPWidget> createState() => _OTPWidgetState();
}

class _OTPWidgetState extends State<OTPWidget> {
  Timer? _timer;
  late DateTime _now;
  late DateTime _target;

  void _startTimer() {
    _now = DateTime.now();
    _target = _now.add(oneMinute);
    _timer = Timer.periodic(oneSecond, (timer) {
      setState(() => _now = DateTime.now());
      if (_target.difference(_now).inSeconds == 0) timer.cancel();
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  PinTheme get _defaultPinTheme => PinTheme(
    width: (responsiveScreenWidth - (16.sp * 5) - 32.sp) / 6,
    height: (responsiveScreenWidth - (16.sp * 5) - 32.sp) / 6,
    textStyle: kInter600Responsive(20),
    decoration: BoxDecoration(
      borderRadius: k10pxBorderRadius,
      color: Colors.transparent,
      border: Border.all(color: k009721),
    ),
  );

  @override
  Widget build(BuildContext context) {
    var difference = _target.difference(_now);
    var elapsed = difference.inSeconds == 0;
    var trailingText =
        'Resend OTP in ${elapsed ? 'resend' : ' in ${difference.formatDuration}'}';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // CustomRichText.split(
        //   text: 'Enter the 4 digit code that was sent to you',
        //   style: kInter600Responsive(14).copyWith(color: k545454),
        //   customString: [
        //     // CustomString(
        //     //   string: ,
        //     //   textStyle: kInter700Responsive(20),
        //     // ),
        //   ],
        // ),
        GestureDetector(
          onTap: () {
            if (elapsed) widget.onTap();
          },
          child: CustomRichText.split(
            text: trailingText,
            style: kInter500Responsive(12),
            customString: [
              CustomString(
                string: 'resend',
                textStyle: kInter700Responsive(
                  14,
                ).copyWith(color: kPrimaryColor),
              ),
            ],
          ),
        ),
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
