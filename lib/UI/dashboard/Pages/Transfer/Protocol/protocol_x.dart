import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wepay/assets/app_colors.dart';
import 'package:wepay/assets/app_image.dart';
import 'package:wepay/common/Body/BodyWidget.dart';
import 'package:wepay/common/Body/Model/BodyConfig.dart';
import 'package:wepay/common/Image/ImageView.dart';
import 'package:wepay/common/Image/Model/ImageConfig.dart';
import 'package:wepay/common/TextView/Models/TextViewConfig.dart';
import 'package:wepay/common/TextView/TextView.dart';
import 'package:wepay/core/main_core/app.router.dart';
import 'package:wepay/core/router/page_router.dart';
import 'package:wepay/custom/app_colors.dart';
import 'package:wepay/custom/buttons/green_back_button.dart';
import 'package:wepay/custom/custom_layout.dart';
import 'package:wepay/custom/ui_helper.dart';

class ProtocolXScreen extends StatefulWidget {
  const ProtocolXScreen({super.key});

  @override
  State<ProtocolXScreen> createState() => _ProtocolXScreenState();
}

class _ProtocolXScreenState extends State<ProtocolXScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return BodyWidget(
      config: BodyConfig(
        showAppBar: true,
        appbarBackgroundColor: AppColors.kTransparent,
        backgroundColor: AppColors.kBackgroundColor,
        appBarTitle: "Protocol X",
        appbarTitleColor: AppColors.white,
        centerTitle: false,
        showLeadingWidget: true,
        childPadding: EdgeInsets.zero,
        leadingWidget: GreenBackButton(onTap: () => PageRouter.pop()),
        fontSize: 14.sp,
        child: PaddedColumn(
          padding: kMainPadding,
          children: [
            verticalSpaceCustom(20),
            Container(
              padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 30.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.r),
                color: k181C20,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _ProtocolCardWidget(
                    height: height,
                    width: width,
                    text: 'Receive Payment',
                    image: AppImage.xicon,
                    onTap: () {
                      PageRouter.pushNamed(Routes.receivePaymentScreen);
                    },
                  ),
                  greenDivider(),
                  _ProtocolCardWidget(
                    height: height,
                    width: width,
                    text: 'For Goods',
                    image: AppImage.goods,
                    onTap: () {},
                  ),
                  greenDivider(),
                  _ProtocolCardWidget(
                    height: height,
                    width: width,
                    text: 'For Services',
                    image: AppImage.service,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProtocolCardWidget extends StatelessWidget {
  const _ProtocolCardWidget({
    required this.height,
    required this.width,
    required this.text,
    required this.image,
    required this.onTap,
  });

  final double height;
  final double width;
  final String? text;
  final String? image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ImageView(
            imageConfig: ImageConfig(
              imageURL: image!,
              imageType: ImageType.svg,
            ),
          ),
          verticalSpaceTiny,
          TextView(
            config: TextViewConfig(
              textAlign: TextAlign.center,
              text: text!,
              fontSize: 10,
              color: AppColors.white.withAlpha((0.70 * 225).toInt()),
            ),
          ),
        ],
      ),
    );
  }
}
