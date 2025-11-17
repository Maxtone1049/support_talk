import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wepay/UI/widgets/pin_widget.dart';
import 'package:wepay/assets/app_colors.dart';
import 'package:wepay/common/Button/ButtonWidget.dart';
import 'package:wepay/common/Button/Model/ButtonConfig.dart';
import 'package:wepay/common/Gap.dart';
import 'package:wepay/common/TextView/Models/TextViewConfig.dart';
import 'package:wepay/common/TextView/TextView.dart';
import 'package:wepay/core/main_core/app.router.dart';
import 'package:wepay/core/router/page_router.dart';
import 'package:wepay/custom/custom_layout.dart';
import 'package:wepay/custom/custom_scaffold.dart';
import 'package:wepay/custom/ui_helper.dart';

class EnterPinScreen extends StatefulWidget {
  const EnterPinScreen({super.key});

  @override
  State<EnterPinScreen> createState() => _EnterPinScreenState();
}

class _EnterPinScreenState extends State<EnterPinScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Protocol X -> Receive Payment",
      titleSize: 12,
      centerTitle: false,
      showDivider: false,
      body: SingleChildScrollView(
        child: PaddedColumn(
          padding: kMainPadding,
          children: [
            Gap(height: 80),
            TextView(
              config: TextViewConfig(
                text: "Sender: Enter your PIN",
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
                textAlign: TextAlign.center,
              ),
            ),
            Gap(height: 10),

            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Please enter Payment ",
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white.withAlpha((0.70 * 225).toInt()),
                  ),
                  children: [
                    TextSpan(
                      text: "PIN",
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Gap(height: 20),
            Center(
              child: PinWidget(
                length: 4,
                onChanged: (value) {},
                onTap: () {},
                onCompleted: (value) {},
              ),
            ),

            Gap(height: 80),
            ButtonWidget(
              config: ButtonConfig(
                text: "Confrim & Pay",
                height: 54,
                radius: 50.r,
                textColor: AppColors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                onPressed: () {
                  PageRouter.pushNamed(
                    Routes.thumbPrintScreen,
                    args: ThumbPrintScreenArguments(amount: "10000"),
                  );
                },
              ),
            ),
            verticalSpaceCustom(40),
          ],
        ),
      ),
    );
  }
}

class SuccessXPage extends StatelessWidget {
  const SuccessXPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold();
  }
}
