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
import 'package:wepay/custom/custom%20widgets/naira_sign.dart';
import 'package:wepay/custom/custom_layout.dart';
import 'package:wepay/custom/custom_scaffold.dart';
import 'package:wepay/custom/ui_helper.dart';

class SuccessTansactionScreen extends StatefulWidget {
  const SuccessTansactionScreen({super.key, this.amount, this.id});
  final String? amount, id;

  @override
  State<SuccessTansactionScreen> createState() =>
      _SuccessTansactionScreenState();
}

class _SuccessTansactionScreenState extends State<SuccessTansactionScreen> {
  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.sizeOf(context).height;
    // final width = MediaQuery.sizeOf(context).width;
    return CustomScaffold(
      showDivider: false,
      trailingAppBarWidget: TextView(
        config: TextViewConfig(
          text: "Done",
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: AppColors.primary.withAlpha((0.51 * 225).toInt()),
          onTap: () => PageRouter.pushReplacement(Routes.dashboardView),
        ),
      ),
      body: PaddedColumn(
        crossAxisAlignment: CrossAxisAlignment.center,
        padding: kMainPadding,
        children: [
          verticalSpaceLarge,
          ImageView(
            imageConfig: ImageConfig(
              imageURL: AppImage.successsplash,
              imageType: ImageType.svg,
            ),
          ),
          Gap(height: 20),
          TextView(
            config: TextViewConfig(
              text: "Successful",
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: AppColors.white,
            ),
          ),
          Gap(height: 12),
          NairaSignWidget(price: int.tryParse(widget.amount.toString())),
          Gap(height: 20),
          Row(
            children: [
              Expanded(
                child: ImageView(
                  imageConfig: ImageConfig(
                    imageURL: AppImage.share,
                    imageType: ImageType.svg,
                  ),
                ),
              ),
              Gap(width: 12),
              Expanded(
                child: ImageView(
                  imageConfig: ImageConfig(
                    imageURL: AppImage.detail,
                    imageType: ImageType.svg,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
