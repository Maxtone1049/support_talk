import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wepay/custom/app_colors.dart';

class ResponsiveText extends StatelessWidget {
  final String data;
  final num? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final bool? softWrap;
  final TextOverflow? overflow;
  final GestureTapCallback? onTap;
  final TextDecoration? decoration;
  final FontStyle? fontStyle;

  const ResponsiveText(
    this.data, {
    super.key,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.maxLines,
    this.softWrap,
    this.overflow,
    this.onTap,
    this.decoration,
    this.fontStyle,
  });

  const ResponsiveText.w300(
    this.data, {
    super.key,
    this.fontSize,
    this.color,
    this.fontWeight = FontWeight.w300,
    this.textAlign,
    this.maxLines,
    this.softWrap,
    this.overflow,
    this.onTap,
    this.decoration,
    this.fontStyle,
  });

  const ResponsiveText.w400(
    this.data, {
    super.key,
    this.fontSize,
    this.color,
    this.fontWeight = FontWeight.w400,
    this.textAlign,
    this.maxLines,
    this.softWrap,
    this.overflow,
    this.onTap,
    this.decoration,
    this.fontStyle,
  });

  const ResponsiveText.w500(
    this.data, {
    super.key,
    this.fontSize,
    this.color,
    this.fontWeight = FontWeight.w500,
    this.textAlign,
    this.maxLines,
    this.softWrap,
    this.overflow,
    this.onTap,
    this.decoration,
    this.fontStyle,
  });

  const ResponsiveText.w600(
    this.data, {
    super.key,
    this.fontSize,
    this.color,
    this.fontWeight = FontWeight.w600,
    this.textAlign,
    this.maxLines,
    this.softWrap,
    this.overflow,
    this.onTap,
    this.decoration,
    this.fontStyle,
  });

  const ResponsiveText.w700(
    this.data, {
    super.key,
    this.fontSize,
    this.color,
    this.fontWeight = FontWeight.w700,
    this.textAlign,
    this.maxLines,
    this.softWrap,
    this.overflow,
    this.onTap,
    this.decoration,
    this.fontStyle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        data,
        textAlign: textAlign,
        maxLines: maxLines,
        softWrap: softWrap,
        overflow: overflow,
        style: GoogleFonts.inter(
          decoration: decoration,
          fontWeight: fontWeight ?? FontWeight.w300,
          fontStyle: fontStyle,
          fontSize: (fontSize ?? 16).sp,
          color: color ?? kEBEBEB,
          // letterSpacing: -0.64,
        ),
      ),
    );
  }
}
