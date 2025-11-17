import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wepay/UI/onboarding/BVN/bvn_screen.dart';
import 'package:wepay/UI/onboarding/widgets/background_view.dart';
import 'package:wepay/assets/app_colors.dart';
import 'package:wepay/assets/app_image.dart';
import 'package:wepay/common/Gap.dart';
import 'package:wepay/common/Image/ImageView.dart';
import 'package:wepay/common/Image/Model/ImageConfig.dart';
import 'package:wepay/common/TextView/Models/TextViewConfig.dart';
import 'package:wepay/common/TextView/TextView.dart';
import 'package:wepay/custom/app_colors.dart';
import 'package:wepay/custom/buttons/rounded_button.dart';
import 'package:wepay/custom/custom_layout.dart';
import 'package:wepay/custom/custom_richtext.dart';
import 'package:wepay/custom/custom_scaffold.dart';
import 'package:wepay/custom/responsive_icons.dart';
import 'package:wepay/custom/responsive_text.dart';
import 'package:wepay/custom/ui_helper.dart';

class BiometricCapture extends StatefulWidget {
  const BiometricCapture({super.key});

  @override
  State<BiometricCapture> createState() => _BiometricCaptureState();
}

class _BiometricCaptureState extends State<BiometricCapture> {
  @override
  Widget build(BuildContext context) {
    return BackgroundView(
      child: CustomScaffold(
        showAppBar: false,
        body: PaddedColumn(
          padding: EdgeInsets.symmetric(horizontal: 20),
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(height: 72),
            Center(
              child: ImageView(
                imageConfig: ImageConfig(
                  imageURL: AppImage.logo,
                  imageType: ImageType.asset,
                ),
              ),
            ),
            Gap(height: 32),
            TextView(
              config: TextViewConfig(
                text: "Biometric Capture",
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
                textAlign: TextAlign.center,
              ),
            ),
            Gap(height: 8),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "Place your ",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white.withAlpha((0.70 * 225).toInt()),
                ),
                children: [
                  TextSpan(
                    text: "thumb",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primary,
                    ),
                  ),
                  TextSpan(
                    text: " on the sensor to\nregister your",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white.withAlpha((0.70 * 225).toInt()),
                    ),
                  ),
                  TextSpan(
                    text: " biometrics.",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
            verticalSpaceCustom(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 7,
                  width: 270,
                  decoration: BoxDecoration(
                    color: kDeactivatedColor,
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ),
              ],
            ),
            verticalSpaceCustom(20),
            ResponsiveText(
              "Scanning",
              textAlign: TextAlign.center,
              fontWeight: FontWeight.normal,
              color: kWhiteColor,
            ),
            verticalSpaceSmall,
            Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                //color: kLightGreen,
                border: Border.all(color: kLightGreen),
              ),
              child: ResponsiveIcon(
                Icons.fingerprint_rounded,
                size: 100,
                color: kLightGreen,
              ),
            ),

            Spacer(),
            RoundedButton(
              text: "Next",
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => BvnScreen()));
              },
            ),
            verticalSpaceSmall,
            CustomRichText.split(
              text:
                  "By proceeding, you confirm that you have read, consent, and agree to WePay’s Terms of Use and Privacy Policy.",
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,

              customString: [
                CustomString(
                  string: 'Privacy Policy.',
                  textStyle: kInter300Responsive(
                    14,
                  ).copyWith(color: kLightGreen),
                ),
              ],
            ),
            verticalSpaceCustom(40),
          ],
        ),
      ),
    );
  }
}
