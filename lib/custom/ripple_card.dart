import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RippleCard extends StatelessWidget {
  final Widget child;
  final Widget? replacement;
  final BorderRadiusGeometry? borderRadius;
  final GestureTapCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final double? elevation;
  final bool visible;
  final BoxBorder? border;
  final double? height;
  final double? width;
  final double? size;
  final bool responsive;
  final BoxShadow? shadow;

  const RippleCard({
    required this.child,
    this.onTap,
    super.key,
    this.borderRadius,
    this.padding,
    this.margin,
    this.color,
    this.elevation,
    this.visible = true,
    this.replacement,
    this.border,
    this.height,
    this.width,
    this.size,
    this.responsive = true,
    this.shadow,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      replacement: replacement ?? const SizedBox.shrink(),
      child: Container(
        padding: margin ?? EdgeInsets.zero,
        decoration: BoxDecoration(boxShadow: [if (shadow != null) shadow!]),
        child: SizedBox(
          height: responsive ? (size ?? height)?.sp : (size ?? height),
          width: responsive ? (size ?? width)?.sp : (size ?? width),
          child: Material(
            elevation: elevation ?? 0,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.zero,
            ),
            child: ClipRRect(
              borderRadius: borderRadius ?? BorderRadius.zero,
              child: InkWell(
                onTap: onTap ?? () {},
                customBorder: RoundedRectangleBorder(
                  borderRadius: borderRadius ?? BorderRadius.zero,
                ),
                child: Ink(
                  padding: padding,
                  decoration: BoxDecoration(
                    border: border,
                    color: color ?? Colors.white,
                    borderRadius: borderRadius,
                  ),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
