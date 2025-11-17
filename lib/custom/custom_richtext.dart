import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wepay/custom/app_colors.dart';
import 'package:wepay/custom/app_values.dart';
import 'package:wepay/custom/extensions/extensions.dart';
import 'package:wepay/custom/ui_helper.dart';

class CustomString {
  String? string;
  TextStyle? textStyle;

  CustomString({this.string, this.textStyle});
}

class CustomRichText extends StatelessWidget {
  final String? text;
  final List<InlineSpan>? children;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextStyle? style;
  final TextAlign? textAlign;

  final bool _splitByNairaSign;
  final List<CustomString>? customString;

  const CustomRichText({
    super.key,
    this.text,
    this.children,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.style,
    this.textAlign,
    this.customString,
  }) : _splitByNairaSign = false;

  const CustomRichText.split({
    super.key,
    this.text,
    this.children,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.style,
    this.textAlign,
    this.customString,
  }) : _splitByNairaSign = true;

  TextStyle? _textStyle(String text) =>
      customString?.nullableFirstWhere((e) => e.string == text)?.textStyle;

  List<String> get _splitString {
    var list = text?.splitByNairaSign ?? [];
    List<String> result = [];
    var parameters = customString?.map((e) => e.string ?? '').toList() ?? [];

    for (String item in list) {
      bool foundParameter = false;
      for (String parameter in parameters) {
        if (item.contains(parameter)) {
          var splitItems = item
            .split(parameter)
            .insertBetweenElements(parameter)..removeWhere((e) => e.isEmpty);
          result.addAll(splitItems);

          foundParameter = true;
          break;
        }
      }
      if (!foundParameter) {
        result.add(item);
      }
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign ?? TextAlign.start,
      text: TextSpan(
        style: style ?? kInter500Responsive(fontSize?.sp ?? 16),
        children:
            _splitByNairaSign
                ? _splitString
                    .map(
                      (e) => TextSpan(
                        text: e,
                        style:
                            e == nairaSign
                                ? DefaultTextStyle.of(context).style.copyWith(
                                  color: kWhiteColor,
                                  fontSize: style?.fontSize?.sp,
                                  fontWeight:
                                      style?.fontWeight ?? FontWeight.w500,
                                  letterSpacing: style?.letterSpacing,
                                )
                                : (_textStyle(e) ??
                                    style ??
                                    kInter500Responsive(16)),
                      ),
                    )
                    .toList()
                : children,
      ),
    );
  }
}
