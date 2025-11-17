import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wepay/UI/onboarding/widgets/background_view.dart';
import 'package:wepay/assets/app_colors.dart';
import 'package:wepay/assets/app_image.dart';
import 'package:wepay/common/Body/BodyWidget.dart';
import 'package:wepay/common/Body/Model/BodyConfig.dart';
import 'package:wepay/common/Button/ButtonWidget.dart';
import 'package:wepay/common/Button/Model/ButtonConfig.dart';
import 'package:wepay/common/Gap.dart';
import 'package:wepay/common/Image/ImageView.dart';
import 'package:wepay/common/Image/Model/ImageConfig.dart';
import 'package:wepay/common/TextView/Models/TextViewConfig.dart';
import 'package:wepay/common/TextView/TextView.dart';
import 'package:wepay/core/main_core/app.router.dart';
import 'package:wepay/core/router/page_router.dart';
import 'package:wepay/custom/app_colors.dart';
import 'package:wepay/custom/custom_richtext.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundView(
      child: BodyWidget(
        config: BodyConfig(
          childPadding: EdgeInsets.zero,
          backgroundColor: AppColors.kTransparent,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Gap(height: 30),
                Center(
                  child: ImageView(
                    imageConfig: ImageConfig(
                      imageURL: AppImage.logo,
                      imageType: ImageType.asset,
                    ),
                  ),
                ),
                Gap(height: 30),
                ImageView(
                  imageConfig: ImageConfig(
                    imageURL: AppImage.thumbicon,
                    imageType: ImageType.svg,
                    height: 200.h,
                  ),
                ),
                Gap(height: 40),
                CustomRichText.split(
                  text: "Your Money at Your Fingertips",
                  style: GoogleFonts.inter(
                    fontSize: 35,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                  customString: [
                    CustomString(
                      string: 'Money',
                      textStyle: GoogleFonts.inter(
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                        color: kLightGreen,
                      ),
                    ),
                  ],
                ),
                Gap(height: 8),
                TextView(
                  config: TextViewConfig(
                    text:
                        "Experience secure, seamless banking.\nSend money, pay bills, and make\npurchases instantly.",
                    textAlign: TextAlign.center,
                    textStyle: GoogleFonts.inter(
                      fontSize: 15,
                      color: AppColors.white.withAlpha((0.70 * 225).toInt()),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),

                Gap(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 7,
                      width: 90,
                      decoration: BoxDecoration(
                        color: kLightGreen,
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    ),
                  ],
                ),
                Gap(height: 24),
                ButtonWidget(
                  config: ButtonConfig(
                    text: "Get Started",
                    onPressed: () {
                      PageRouter.pushNamed(Routes.bvnScreen);
                      // PageRouter.pushNamed(
                      //   Routes.locationDetails,
                      //   args: LocationDetailsArguments(
                      //     userId: "userId",
                      //     email: "tonymax1049@gmail.com",
                      //     occupation: "occupation",
                      //     education: "education",
                      //     religion: "religion",
                      //     marital: "marital",
                      //   ),
                      // );
                    },
                    radius: 50.r,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    height: 54,
                    textColor: AppColors.black,
                  ),
                ),

                Gap(height: 20),
                GestureDetector(
                  onTap: () {
                    PageRouter.pushNamed(Routes.loginScreen);
                  },
                  child: CustomRichText.split(
                    text: "Already have an account? Log In",
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,

                    customString: [
                      CustomString(
                        string: 'Log In',
                        textStyle: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //
}
