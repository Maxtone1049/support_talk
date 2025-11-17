import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wepay/assets/app_colors.dart';
import 'package:wepay/common/Gap.dart';
import 'package:wepay/common/Image/ImageView.dart';
import 'package:wepay/common/Image/Model/ImageConfig.dart';
import 'package:wepay/common/TextView/Models/TextViewConfig.dart';
import 'package:wepay/common/TextView/TextView.dart';
import 'package:wepay/custom/app_colors.dart';
import 'package:wepay/custom/custom_card.dart';
import 'package:wepay/custom/ui_helper.dart';

class TransferCardWidget extends StatelessWidget {
  const TransferCardWidget({
    super.key,
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
          Gap(height: 8),
          // ResponsiveText(text!),
          TextView(
            config: TextViewConfig(
              text: text!,
              fontSize: 12,
              color: AppColors.white.withAlpha((0.70 * 225).toInt()),
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
