import 'package:flutter/material.dart';
import 'package:wepay/custom/app_colors.dart';
import 'package:wepay/custom/ripple_card.dart';
import 'package:wepay/custom/ui_helper.dart';

class CircularButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final double? size;
  final Color? color;
  final Widget? child;
  final Gradient? gradient;

  const CircularButton({
    super.key,
    this.onTap,
    this.padding,
    this.size,
    this.color,
    this.child,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return RippleCard(
      onTap: onTap,
      padding: padding,
      height: (size ?? 50),
      width: (size ?? 50),
      borderRadius: k100pxBorderRadius,
      color: color ?? kPrimaryColor,
      child: Center(child: child),
    );
  }
}
