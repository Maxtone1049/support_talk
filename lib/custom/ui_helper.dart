import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wepay/custom/custom_card.dart';

import 'app_colors.dart';

const double _tinySize = 5.0;
const double _smallSize = 10.0;
const double _mediumSize = 25.0;
const double _largeSize = 50.0;
const double _massiveSize = 120.0;

const Widget horizontalSpaceTiny = SizedBox(width: _tinySize);
const Widget horizontalSpaceSmall = SizedBox(width: _smallSize);
const Widget horizontalSpaceMedium = SizedBox(width: _mediumSize);
const Widget horizontalSpaceLarge = SizedBox(width: _largeSize);
Widget horizontalSpaceCustom(double width) => SizedBox(width: width.sp);

const Widget verticalSpaceTiny = SizedBox(height: _tinySize);
const Widget verticalSpaceSmall = SizedBox(height: _smallSize);
const Widget verticalSpaceMedium = SizedBox(height: _mediumSize);
const Widget verticalSpaceLarge = SizedBox(height: _largeSize);
const Widget verticalSpaceMassive = SizedBox(height: _massiveSize);
Widget verticalSpaceCustom(double height) => SizedBox(height: height.sp);

Widget thickDivider({double height = 8, Color? color}) =>
    Container(height: height.sp, color: color ?? kEBEBEB);

Widget thinDivider() => const Divider(height: 0, thickness: 0.3);
Widget thinGreenDivider() =>
    const Divider(height: 0, thickness: 0.3, color: kcDarkGreenColor);
Widget greenDivider() => CustomCard(
  height: 60,
  width: 2,
  gradient: LinearGradient(
    colors: [k181C20, k009721, k005312],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ),
);

Widget bottomSheetHeader = Container(
  width: 80,
  height: 5,
  decoration: const BoxDecoration(
    borderRadius: k32pxBorderRadius,
    color: kB0B0B0,
  ),
);

//TEXT-STYLES

final kInter300 = TextStyle(
  fontFamily: 'Inter',
  color: kEBEBEB,
  fontWeight: FontWeight.w300,
  fontSize: 14.sp,
  // letterSpacing: -0.64,
);

TextStyle kInter300Responsive(double fontSize) => TextStyle(
  fontFamily: 'Inter',
  color: kEBEBEB,
  fontWeight: FontWeight.w300,
  fontSize: fontSize.sp,
  // letterSpacing: -0.64,
);

final kInter400 = TextStyle(
  fontFamily: 'Inter',
  color: kEBEBEB,
  fontWeight: FontWeight.w400,
  fontSize: 14.sp,
  // letterSpacing: -0.64,
);

TextStyle kInter400Responsive(double fontSize) => TextStyle(
  fontFamily: 'Inter',
  color: kEBEBEB,
  fontWeight: FontWeight.w400,
  fontSize: fontSize.sp,
  // letterSpacing: -0.64,
);

final kInter500 = TextStyle(
  fontFamily: 'Inter',
  color: kEBEBEB,
  fontWeight: FontWeight.w500,
  fontSize: 14.sp,
  // letterSpacing: -0.64,
);

TextStyle kInter500Responsive(double fontSize) => TextStyle(
  fontFamily: 'Inter',
  color: kEBEBEB,
  fontWeight: FontWeight.w500,
  fontSize: fontSize.sp,
  // letterSpacing: -0.64,
);

final kInter600 = TextStyle(
  fontFamily: 'Inter',
  color: kEBEBEB,
  fontWeight: FontWeight.w600,
  fontSize: 14.sp,
  // letterSpacing: -0.64,
);

TextStyle kInter600Responsive(double fontSize) => TextStyle(
  fontFamily: 'Inter',
  color: kEBEBEB,
  fontWeight: FontWeight.w600,
  fontSize: fontSize.sp,
  // letterSpacing: -0.64,
);

final kInter700 = TextStyle(
  fontFamily: 'Inter',
  color: kEBEBEB,
  fontWeight: FontWeight.w700,
  fontSize: 14.sp,
  // letterSpacing: -0.64,
);

TextStyle kInter700Responsive(double fontSize) => TextStyle(
  fontFamily: 'Inter',
  color: kEBEBEB,
  fontWeight: FontWeight.w700,
  fontSize: fontSize.sp,
  // letterSpacing: -0.64,
);

Widget spacedDivider = const Column(
  children: <Widget>[
    verticalSpaceMedium,
    Divider(color: Colors.blueGrey, height: 5.0),
    verticalSpaceMedium,
  ],
);

Widget verticalSpace(double height) => SizedBox(height: height);

double screenWidth(BuildContext context) => MediaQuery.sizeOf(context).width;

double get responsiveScreenWidth => 393;
double get responsiveScreenHeight => 852;

double screenHeight(BuildContext context) => MediaQuery.sizeOf(context).height;

double screenHeightFraction(
  BuildContext context, {
  int dividedBy = 1,
  double offsetBy = 0,
  double max = 3000,
}) => min((screenHeight(context) - offsetBy) / dividedBy, max);

double screenWidthFraction(
  BuildContext context, {
  int dividedBy = 1,
  double offsetBy = 0,
  double max = 3000,
}) => min((screenWidth(context) - offsetBy) / dividedBy, max);

double halfScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 2);

double thirdScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 3);

double quarterScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 4);

double getResponsiveHorizontalSpaceMedium(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 10);
double getResponsiveSmallFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 14, max: 15);

double getResponsiveMediumFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 16, max: 17);

double getResponsiveLargeFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 21, max: 31);

double getResponsiveExtraLargeFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 25);

double getResponsiveMassiveFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 30);

double getResponsiveFontSize(
  BuildContext context, {
  double? fontSize,
  double? max,
}) {
  max ??= 100;

  var responsiveSize = min(
    screenWidthFraction(context, dividedBy: 10) * ((fontSize ?? 100) / 100),
    max,
  );

  return responsiveSize;
}

const k120pxBorderRadius = BorderRadius.all(Radius.circular(120));
const k100pxBorderRadius = BorderRadius.all(Radius.circular(100));
const k80pxBorderRadius = BorderRadius.all(Radius.circular(80));
const k64pxBorderRadius = BorderRadius.all(Radius.circular(64));
const k40pxBorderRadius = BorderRadius.all(Radius.circular(40));
const k32pxBorderRadius = BorderRadius.all(Radius.circular(32));
const k24pxBorderRadius = BorderRadius.all(Radius.circular(24));
const k20pxBorderRadius = BorderRadius.all(Radius.circular(20));
const k16pxBorderRadius = BorderRadius.all(Radius.circular(16));
const k12pxBorderRadius = BorderRadius.all(Radius.circular(12));
const k10pxBorderRadius = BorderRadius.all(Radius.circular(10));
const k8pxBorderRadius = BorderRadius.all(Radius.circular(8));
const k5pxBorderRadius = BorderRadius.all(Radius.circular(5));
const k4pxBorderRadius = BorderRadius.all(Radius.circular(4));

const k20pxSheetRadius = BorderRadius.vertical(top: Radius.circular(20));

final kMainPadding = EdgeInsets.symmetric(horizontal: 20.sp);

final k1pxBorder = Border.all(color: kEBEBEB, width: 1);
final kHalfpxBorder = Border.all(color: kE6E6E6, width: 0.5);

// final sheetMargin = edgeInsetsOnlyResponsive(bottom: 32, left: 10, right: 10);

EdgeInsets edgeInsetsSymetricResponsive({
  num vertical = 0,
  num horizontal = 0,
}) => EdgeInsets.symmetric(horizontal: horizontal.sp, vertical: vertical.sp);

EdgeInsets edgeInsetsAllResponsive(num value) => EdgeInsets.all(value.sp);

EdgeInsets edgeInsetsOnlyResponsive({
  num left = 0,
  num right = 0,
  num top = 0,
  num bottom = 0,
}) => EdgeInsets.only(
  top: top.sp,
  right: right.sp,
  bottom: bottom.sp,
  left: left.sp,
);
