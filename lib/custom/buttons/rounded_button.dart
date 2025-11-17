import 'package:flutter/material.dart';
import 'package:wepay/custom/Loader/bouncing_dot.dart';
import 'package:wepay/custom/app_colors.dart';
import 'package:wepay/custom/ripple_card.dart';
import 'package:wepay/custom/ui_helper.dart';

class RoundedButton extends StatelessWidget {
  final String? text;
  final Widget? leading;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final Color? color;
  final Color? textColor;
  final Color? indicatorColor;
  final bool isLoading;
  final bool activated;
  final BorderRadiusGeometry? borderRadius;
  final bool shouldUnfocus;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final bool? showShadow;

  const RoundedButton({
    super.key,
    this.onPressed,
    this.leading,
    this.text,
    this.width,
    this.height,
    this.color,
    this.textColor,
    this.indicatorColor,
    this.isLoading = false,
    this.activated = true,
    this.borderRadius,
    this.shouldUnfocus = true,
    this.margin,
    this.padding,
    this.showShadow,
  });

  @override
  Widget build(BuildContext context) {
    return RippleCard(
      height: height ?? 48,
      shadow:
          (showShadow ?? false) && activated
              ? BoxShadow(
                color: kPrimaryColor.withOpacity(0.25),
                offset: const Offset(0, 5),
                spreadRadius: 0,
                blurRadius: 10,
              )
              : null,
      margin: margin,
      padding: padding,
      // border: Border.all(color: (color ?? kDFBDE7), width: 2),
      onTap: () {
        if (activated == false) return;
        onPressed?.call();
        if (shouldUnfocus) FocusManager.instance.primaryFocus?.unfocus();
      },
      borderRadius: borderRadius ?? k40pxBorderRadius,
      color: color ?? (activated ? kLightGreen : kDeactivatedColor),
      child:
          isLoading
              ? BouncingDots(color: indicatorColor ?? Colors.white)
              : Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: leading != null,
                      child: Row(
                        children: [
                          horizontalSpaceCustom(8),
                          leading ?? const SizedBox.shrink(),
                          horizontalSpaceCustom(8),
                        ],
                      ),
                    ),
                    if (text != null)
                      Text(
                        text!,
                        style: kInter600Responsive(
                          16,
                        ).copyWith(color: textColor ?? kcDarkGreenColor),
                      ),
                  ],
                ),
              ),
    );
  }
}
