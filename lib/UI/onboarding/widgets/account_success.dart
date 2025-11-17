import 'package:flutter/material.dart';
import 'package:wepay/UI/onboarding/Authentication/login.dart';
import 'package:wepay/assets/app_image.dart';
import 'package:wepay/common/Gap.dart';
import 'package:wepay/common/Image/ImageView.dart';
import 'package:wepay/common/Image/Model/ImageConfig.dart';
import 'package:wepay/custom/app_colors.dart';
import 'package:wepay/custom/custom_layout.dart';
import 'package:wepay/custom/custom_richtext.dart';
import 'package:wepay/custom/custom_scaffold.dart';
import 'package:wepay/custom/responsive_text.dart';
import 'package:wepay/custom/ui_helper.dart';

class AccountSuccessWidget extends StatefulWidget {
  const AccountSuccessWidget({super.key});

  @override
  State<AccountSuccessWidget> createState() => _AccountSuccessWidgetState();
}

class _AccountSuccessWidgetState extends State<AccountSuccessWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigateToLogin();
  }

  void navigateToLogin() async {
    await Future.delayed(Duration(milliseconds: 1800));
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showAppBar: false,
      backgroundColor: Colors.black,
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
          Spacer(),
          ResponsiveText.w600(
            "Account Successfully Created!",
            fontSize: 25,
            textAlign: TextAlign.center,

            color: kWhiteColor,
          ),
          Gap(height: 40),
          CustomRichText.split(
            text:
                "Welcome to WePay—your gateway to a seamless and innovative banking experience!",
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,

            customString: [
              CustomString(
                string: 'Welcome to WePay',
                textStyle: kInter300Responsive(18).copyWith(color: kLightGreen),
              ),
            ],
          ),
          // ButtonWidget(
          //   config: ButtonConfig(
          //     text: "Continue to Login",
          //     onPressed: () {
          //       PageRouter.pushNamed(Routes.loginScreen);
          //     },
          //   ),
          // ),
          Spacer(),
          verticalSpaceCustom(100),
        ],
      ),
    );
  }
}
