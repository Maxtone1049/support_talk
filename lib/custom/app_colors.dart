import 'package:flutter/material.dart';

const Color kBackgroundColor = Color(0xFF06140F);
const Color kLightGreen = Color(0xFF00EA48);
const Color kcDarkGreenColor = Color(0xFF154A34);
const Color kLemonGreenColor = Color(0xFFB9EFCA);
const Color kcMediumGrey = Color(0xFF474A54);
const Color kcLightGrey = Color.fromARGB(255, 187, 187, 187);
const Color kcVeryLightGrey = Color(0xFFE3E3E3);
const Color kPrimaryColor = Color(0xff035734);
const Color kGreen = Color(0xFF005F37);
const Color kTextColor = Color(0xff000000);
const Color kDeactivatedColor = Color(0xff4D7359);
const Color k666666 = Color(0xff666666);
const Color k8A8A8A = Color(0xff8A8A8A);
const Color k989898 = Color(0xff989898);
const Color k858585 = Color(0xff858585);
const Color k545454 = Color(0xff545454);
const Color kB0B0B0 = Color(0xffB0B0B0);
const Color k333333 = Color(0xff333333);
const Color kEBEBEB = Color(0xffEBEBEB);
const Color kWhiteColor = Color(0xffFFFFFF);
const Color k2D2D2D = Color(0xff2D2D2D);
const Color kD4D4D4 = Color(0xffD4D4D4);
const Color kEFFEF2 = Color(0xffEFFEF2);
const Color kFEEBCD = Color(0xffFEEBCD);
const Color kE6E6E6 = Color(0xffE6E6E6);
const Color k828282 = Color(0xff828282);
const Color kE0E0E0 = Color(0xffE0E0E0);
const Color kBDBDBD = Color(0xffBDBDBD);
const Color k001A00 = Color(0xff001A00);
const Color k009721 = Color(0xff009721);
const Color kF69600 = Color(0xffF69600);
const Color kF6F7F9 = Color(0xffF6F7F9);
const Color kE1E1E1 = Color(0xffE1E1E1);
const Color kF5EAF7 = Color(0xffF5EAF7);
const Color kFFF9C4 = Color(0xffFFF9C4);
const Color kF5E000 = Color(0xffF5E000);
const Color kC9252D = Color(0xffC9252D);
const Color kEDCA12 = Color(0xffEDCA12);
const Color kE0BCE7 = Color(0xffE0BCE7);
const Color kF7F7F7 = Color(0xffF7F7F7);
const Color k5D5D5D = Color(0xff5D5D5D);
const Color k188C18 = Color(0xff188C18);
const Color kA0D426 = Color(0xffA0D426);
const Color kEB1100 = Color(0xffEB1100);
const Color k484848 = Color(0xff484848);
const Color kBF0303 = Color(0xffBF0303);
const Color kFCEFED = Color(0xffFCEFED);
const Color kB9B9B9 = Color(0xffB9B9B9);
const Color kF9DEDC = Color(0xffF9DEDC);
const Color kE6F5E9 = Color(0xffE6F5E9);
const Color kF5F0F7 = Color(0xffF5F0F7);
const Color k005312 = Color(0xff005312);
const Color kFBFBFB = Color(0xffFBFBFB);
const Color k939A9B = Color(0xff939A9B);
const Color kDFBDE7 = Color(0xffDFBDE7);
const Color kFEFBFF = Color(0xffFEFBFF);
const Color kE4BF00 = Color(0xffE4BF00);
const Color kD19CDB = Color(0xffD19CDB);
const Color kWallet = Color(0xff386BF6);
const Color kEarnings = Color(0xffFFA187);
const Color kReviews = Color(0xffF09800);
const Color kDarkPurple = Color(0xff42114A);
const Color kMilk = Color(0xffFEF5E6);
const Color kTextFieldColor = Color(0xff23432D);
const Color k181C20 = Color(0xff181C20);
const Color k055140 = Color(0xff055140);
const Color dropdownColor = Color(0xFF0C2A20);
const kTransparent = Colors.transparent;

class AppGradients {
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

  // You can add more gradients as needed
  static LinearGradient customGradient(
    List<Color> colors,
    AlignmentGeometry begin,
    AlignmentGeometry end,
  ) {
    return LinearGradient(colors: colors, begin: begin, end: end);
  }
}
