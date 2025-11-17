import 'package:flutter/material.dart';
import 'package:wepay/assets/app_image.dart';
import 'package:wepay/common/Image/ImageView.dart';
import 'package:wepay/common/Image/Model/ImageConfig.dart';

class RefreshIndicatorWidget extends StatelessWidget {
  const RefreshIndicatorWidget({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ImageView(
            imageConfig: ImageConfig(
                imageURL: AppImage.wepayload,
                height: 50,
                width: 50,
                boxFit: BoxFit.cover,
                imageType: ImageType.asset)),
        // Text(message)
      ],
    );
  }
}
