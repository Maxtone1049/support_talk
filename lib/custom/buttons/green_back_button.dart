import 'package:flutter/material.dart';
import 'package:wepay/custom/app_colors.dart';
import 'package:wepay/custom/image_card.dart';
import 'package:wepay/custom/responsive_icons.dart';
import 'package:wepay/custom/ripple_card.dart';
import 'package:wepay/custom/ui_helper.dart';

class GreenBackButton extends StatelessWidget {
  final VoidCallback? onTap;
  final double? spacing;
  final double? size;
  final double? iconSize;

  const GreenBackButton({
    this.onTap,
    this.spacing,
    this.size,
    this.iconSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        horizontalSpaceCustom(spacing ?? 16),
        RippleCard(
          size: size ?? 32,
          //border: k1pxBorder,
          borderRadius: k120pxBorderRadius,
          onTap: () {
            if (onTap != null) {
              onTap!();
            } else {
              Navigator.pop(context);
            }
          },
          color: kGreen,
          child: Center(
            child: ResponsiveIcon(
              Icons.arrow_back_ios,
              size: iconSize ?? 16,
              color: kWhiteColor,
            ),
            //ImageCard.local('back_arrow.svg', size: iconSize ?? 16),
          ),
        ),
      ],
    );
  }
}

class GreyCloseButton extends StatelessWidget {
  final VoidCallback? onTap;

  final double? size;
  final double? iconSize;

  const GreyCloseButton({this.onTap, this.size, this.iconSize, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RippleCard(
          size: 40,
          border: k1pxBorder,
          borderRadius: k120pxBorderRadius,
          onTap: () {
            if (onTap != null) {
              onTap!();
            } else {
              Navigator.pop(context);
            }
          },
          color: Colors.white,
          child: Center(
            child: ResponsiveIcon(Icons.close, size: iconSize ?? 24),
          ),
        ),
      ],
    );
  }
}
