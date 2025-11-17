import 'package:flutter/material.dart';
import 'package:wepay/custom/app_colors.dart';
import 'package:wepay/custom/custom_richtext.dart';
import 'package:wepay/custom/ui_helper.dart';

class AuthFormHeader extends StatelessWidget {
  final String title;
  final bool optional;
  final double? fontSize;

  const AuthFormHeader({
    super.key,
    required this.title,
    this.optional = false,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return CustomRichText.split(
      text: '$title ${optional ? '(optional)' : '*'}',
      fontSize: fontSize ?? 16,
      customString: [
        CustomString(
          string: optional ? '(optional)' : '*',
          textStyle:
              optional
                  ? kInter500Responsive(
                    12,
                  ).copyWith(fontStyle: FontStyle.italic)
                  : kInter600Responsive(16).copyWith(color: kBF0303),
        ),
      ],
      style:
          fontSize != null
              ? kInter300Responsive(fontSize!)
              : kInter300Responsive(16),
    );
  }
}
