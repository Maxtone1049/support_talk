import 'package:flutter/material.dart';
import 'package:wepay/assets/app_colors.dart';
import 'package:wepay/assets/app_image.dart';
import 'package:wepay/common/Gap.dart';
import 'package:wepay/common/Image/ImageView.dart';
import 'package:wepay/common/Image/Model/ImageConfig.dart';
import 'package:wepay/common/TextView/Models/TextViewConfig.dart';
import 'package:wepay/common/TextView/TextView.dart';
import 'package:wepay/core/main_core/app.router.dart';
import 'package:wepay/core/router/page_router.dart';
import 'package:wepay/custom/custom_layout.dart';
import 'package:wepay/custom/custom_scaffold.dart';
import 'package:wepay/custom/ui_helper.dart';

class ThumbPrintScreen extends StatefulWidget {
  const ThumbPrintScreen({super.key, this.amount, this.id});
  final String? amount, id;

  @override
  State<ThumbPrintScreen> createState() => _ThumbPrintScreenState();
}

class _ThumbPrintScreenState extends State<ThumbPrintScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: '',
      showDivider: false,
      body: PaddedColumn(
        crossAxisAlignment: CrossAxisAlignment.center,
        padding: kMainPadding,
        children: [
          verticalSpaceCustom(70),

          verticalSpaceCustom(30),
          Center(
            child: TextView(
              config: TextViewConfig(
                text: "Scan your fingerprint\nto make payment",
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
                fontSize: 32,
                color: AppColors.white,
              ),
            ),
          ),
          Gap(height: 30),
          GestureDetector(
            onTap: () {
              PageRouter.pushNamed(
                Routes.successTansactionScreen,
                args: SuccessTansactionScreenArguments(
                  amount: widget.amount.toString(),
                ),
              );
            },
            child: Center(
              child: ImageView(
                imageConfig: ImageConfig(
                  imageURL: AppImage.print,
                  imageType: ImageType.asset,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
