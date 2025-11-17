// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF00EA48);
  static const Color lightprimary = Color(0xFF4D7359);
  static const Color offprimary = Color(0xffE3FFEC);
  static const Color offshadeprimary = Color(0xff005F37);
  static const Color boxFix = Color(0xff081E16);
  static const Color thickGreen = Color(0xff05301E);
  static const Color inputFill = Color(0xff23432D);
  static const Color textColor = Color(0xffDCEEFF);
  static const Color borderColor = Color(0xff055140);
  static const Color borderColorone = Color(0xff292F35);
  static const Color kBackgroundColor = Color(0xFF06140F);
  static const Color kcDarkGreenColor = Color(0xFF154A34);
  static const Color kLemonGreenColor = Color(0xFFB9EFCA);
  static const Color kcMediumGrey = Color(0xFF474A54);
  static const Color vineColor = Color(0xFF272905);
  static const Color kTransparent = Colors.transparent;
  static Color shadepri5 = Color(0xffEB203E).withAlpha((.05 * 255).toInt());
  static const Color secondaryButton = Color(0xffE5EEFD);
  static const Color primaryLight = Color(0xff8CB976);
  static const Color primaryLight100 = Color(0xffEEE8FF);
  static const Color secondary = Color(0xff717171);
  static const Color lightGrey = Color(0xffECECEC);
  static const Color grey100 = Color(0xffE4E6E7);
  static const Color dimgrey = Color(0xffF4F4F4);
  static const Color primaryDim = Color(0xfff4aa0b);
  static const Color orange = Color(0xffFB8C00);
  static const Color white = Color(0xffFFFFFF);
  static const Color black = Color(0xff000000);
  static const Color accent = Color(0xffB9A0FE);
  static const Color red500 = Color(0xffFF0000);
  static const Color yellow = Color(0xffF6E204);
  static const Color thickyellow = Color(0xffF1FF2D);
  static const Color greybold = Color(0xffCED2D9);
  static const Color grey = Color(0xffEAECF0);
  static const Color containerDark = Color(0xff181C20);
  static const Color containerLight = Color(0xffB9EFCA);
  static const Color grey200 = Color(0xff979797);
  static const Color grey300 = Color(0xffD0D5DD);
  static const Color grey500 = Color(0xff667085);
  static const Color grey700 = Color(0xff344054);
  static const Color grey900 = Color(0xff101828);
  static const Color grey400 = Color(0xffD9D9D9);
  static const Color grey600 = Color(0xffD1D1D1);
  static const Color success500 = Color(0xff12B76A);
  static const Color grey50 = Color(0xffF9FAFB);
  static const Color primary25 = Color(0xffFAF9FF);
  static const Color border = Color(0xffFE8F0F1);
  static Color shadegrey70 = Color(0xffF4F4F4).withAlpha((.70 * 225).toInt());

  static const greenGradient = LinearGradient(
    colors: [Colors.green, Colors.greenAccent],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const pinkGradient = LinearGradient(
    colors: [Colors.pink, Colors.pinkAccent],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const purpleGradient = LinearGradient(
    colors: [Colors.purple, Colors.deepPurpleAccent],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static LinearGradient customGradient(
    List<Color> colors,
    AlignmentGeometry begin,
    AlignmentGeometry end,
  ) {
    return LinearGradient(colors: colors, begin: begin, end: end);
  }
}
