import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wepay/custom/app_values.dart';
import 'package:wepay/custom/ui_helper.dart';

class NairaSignWidget extends StatelessWidget {
  final num? price;
  final TextStyle? style;
  final double? fontSize;
  final bool indicateNull;
  final Color? color;

  const NairaSignWidget({
    required this.price,
    super.key,
    this.style,
    this.fontSize,
    this.indicateNull = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          if (price?.isNegative == true)
            TextSpan(text: '-', style: style ?? kInter600Responsive(16)),
          TextSpan(
            text: nairaSign,
            style: TextStyle(
              color: style?.color ?? Colors.white,
              fontWeight: style?.fontWeight ?? FontWeight.w600,
              fontSize: (fontSize ?? style?.fontSize) ?? 16.sp,
              fontFamily: DefaultTextStyle.of(context).style.fontFamily,
            ),
          ),
          if (price == null && indicateNull)
            TextSpan(
              text: '-,---',
              style:
                  style ?? kInter600Responsive(16).copyWith(fontSize: fontSize),
            ),
          if (indicateNull == true && price != null)
            TextSpan(
              text: numberFormatter.format((price ?? 0).abs()),
              style:
                  style ?? kInter600Responsive(16).copyWith(fontSize: fontSize),
            ),
          if (indicateNull == false)
            TextSpan(
              text: numberFormatter.format((price ?? 0).abs()),
              style:
                  style ?? kInter600Responsive(16).copyWith(fontSize: fontSize),
            ),
        ],
      ),
    );
  }
}
