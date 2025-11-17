import 'package:flutter/material.dart';
import 'package:wepay/assets/app_image.dart';
import 'package:wepay/common/Image/ImageView.dart';
import 'package:wepay/common/Image/Model/ImageConfig.dart';
import 'package:wepay/common/TextView/Models/TextViewConfig.dart';
import 'package:wepay/common/TextView/TextView.dart';
import 'package:wepay/custom/app_colors.dart';

class SeeAllHeader extends StatelessWidget {
  final String title;
  final String? title2;
  final bool? visible;
  final GestureTapCallback? onTap;
  //final FocusNode? focusNodes;

  const SeeAllHeader({
    super.key,
    required this.title,
    this.title2,
    this.visible,
    this.onTap,
    //this.focusNodes,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextView(
            config: TextViewConfig(
              text: title,
              fontSize: 16,
              color: kWhiteColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          title2 != null
              ? Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  TextView(
                    config: TextViewConfig(
                      text: title2 ?? 'See all',
                      fontSize: 14,
                      color: kWhiteColor.withAlpha((0.70 * 225).toInt()),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  ImageView(
                    imageConfig: ImageConfig(
                      imageURL: AppImage.chevright,
                      imageType: ImageType.svg,
                    ),
                  ),
                ],
              )
              : Container(),
        ],
      ),
    );
  }
}
