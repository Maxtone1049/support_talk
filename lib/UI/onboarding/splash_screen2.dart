import 'package:flutter/material.dart';
import 'package:wepay/UI/onboarding/Authentication/login.dart';
import 'package:wepay/UI/onboarding/Biometric/biometric_capture.dart';
import 'package:wepay/custom/app_colors.dart';
import 'package:wepay/custom/buttons/rounded_button.dart';
import 'package:wepay/custom/custom_layout.dart';
import 'package:wepay/custom/custom_richtext.dart';
import 'package:wepay/custom/custom_scaffold.dart';
import 'package:wepay/custom/image_card.dart';
import 'package:wepay/custom/responsive_text.dart';
import 'package:wepay/custom/ui_helper.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showAppBar: false,
      body: ScrollableColumn(
        padding: EdgeInsets.symmetric(horizontal: 20),
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          verticalSpaceCustom(70),
          Center(child: ImageCard.local("wepay_logo.png")),
          verticalSpaceCustom(30),
          ImageCard.local(
            "splash2.png",
            borderRadius: BorderRadius.circular(10),
          ),
          verticalSpaceCustom(20),
          CustomRichText.split(
            text: "What If Losing Your Phone Meant Nothing",
            style: TextStyle(fontSize: 44, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,

            customString: [
              CustomString(
                string: 'Your Phone',
                textStyle: kInter700Responsive(44).copyWith(color: kLightGreen),
              ),
            ],
          ),
          verticalSpaceSmall,
          ResponsiveText(
            "Imagine a world where your fingerprint replaces your wallet, and financial access transcends boundaries.",
            textAlign: TextAlign.center,
            fontWeight: FontWeight.normal,
            color: kWhiteColor,
          ),
          verticalSpaceSmall,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 7,
                width: 90,
                decoration: BoxDecoration(
                  color: kDeactivatedColor,
                  borderRadius: BorderRadius.circular(40.0),
                ),
              ),
              horizontalSpaceSmall,
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
          verticalSpaceSmall,
          RoundedButton(
            text: "Get Started",
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => BiometricCapture()),
              );
            },
          ),
          verticalSpaceSmall,
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder:
                      (context) => LoginScreen(
                        //id: electricityService!.id!
                      ),
                ),
              );
            },
            child: CustomRichText.split(
              text: "Already have an account? Log In",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,

              customString: [
                CustomString(
                  string: 'Log In',
                  textStyle: kInter700Responsive(
                    16,
                  ).copyWith(color: kLightGreen),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
