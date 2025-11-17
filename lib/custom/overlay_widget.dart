import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:wepay/custom/app_colors.dart';
import 'package:wepay/custom/custom_card.dart';
import 'package:wepay/custom/responsive_text.dart';
import 'package:wepay/custom/ui_helper.dart';

class ToastOverlay extends StatelessWidget {
  final String message;
  final Widget? leading;
  final Color backgroundColor;
  final Color borderColor;

  const ToastOverlay({
    required this.message,
    required this.backgroundColor,
    required this.borderColor,
    super.key,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return OverlayWrapper(
      child: CustomCard(
        border: Border.all(width: 0.5, color: borderColor),
        padding: edgeInsetsAllResponsive(16),
        margin: edgeInsetsAllResponsive(16),
        color: backgroundColor,
        borderRadius: k8pxBorderRadius,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leading != null) ...[leading!, horizontalSpaceCustom(8)],
            Expanded(
              child: Center(
                child: ResponsiveText.w600(
                  message,
                  fontSize: 16,
                  color: k666666,
                ),
              ),
            ),
            horizontalSpaceCustom(16),
          ],
        ),
      ),
    );
  }
}

class OverlayWrapper extends StatelessWidget {
  final Widget child;

  const OverlayWrapper({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        type: MaterialType.transparency,
        child: SlideDismissible(
          direction: DismissDirection.horizontal,
          key: const ValueKey(0),
          child: child,
        ),
      ),
    );
  }
}
