import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wepay/custom/app_values.dart';

class CustomCard extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final double? size;
  final double? minWidth;
  final double? minHeight;
  final double? maxWidth;
  final double? maxHeight;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final BoxBorder? border;
  final GestureTapCallback? onTap;
  final bool visible;
  final Duration? duration;
  final bool responsive;
  final Gradient? gradient;
  final bool _nonAnimating;
  final Widget? replacement;

  const CustomCard({
    this.child,
    this.width,
    this.height,
    this.size,
    this.minWidth,
    this.minHeight,
    this.maxWidth,
    this.maxHeight,
    this.color,
    this.padding,
    this.borderRadius,
    this.border,
    this.onTap,
    this.margin,
    this.visible = true,
    this.duration,
    this.responsive = true,
    super.key,
    this.gradient,
    this.replacement,
  }) : _nonAnimating = false;

  const CustomCard.nonAnimating({
    this.child,
    this.width,
    this.height,
    this.size,
    this.minWidth,
    this.minHeight,
    this.maxWidth,
    this.maxHeight,
    this.color,
    this.padding,
    this.borderRadius,
    this.border,
    this.onTap,
    this.margin,
    this.visible = true,
    this.duration,
    this.responsive = true,
    super.key,
    this.gradient,
    this.replacement,
  }) : _nonAnimating = true;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      replacement: replacement ?? const SizedBox.shrink(),
      child: GestureDetector(
        onTap: onTap,
        child:
            _nonAnimating
                ? Container(
                  margin: margin,
                  height: responsive ? (size ?? height)?.sp : (size ?? height),
                  width: responsive ? (size ?? width)?.sp : (size ?? width),
                  padding: padding,
                  constraints: BoxConstraints(
                    minHeight:
                        responsive ? (minHeight ?? 0).sp : (minHeight ?? 0),
                    minWidth: responsive ? (minWidth ?? 0).sp : (minWidth ?? 0),
                    maxWidth:
                        responsive
                            ? (maxWidth ?? double.infinity).sp
                            : (maxWidth ?? double.infinity),
                    maxHeight:
                        responsive
                            ? (maxHeight ?? double.infinity).sp
                            : (maxHeight ?? double.infinity),
                  ),
                  decoration: BoxDecoration(
                    border: border,
                    color: color ?? Colors.white,
                    borderRadius: borderRadius ?? BorderRadius.zero,
                    gradient: gradient,
                  ),
                  child: child,
                )
                : _Animated(
                  responsive: responsive,
                  width: width,
                  height: height,
                  minWidth: minWidth,
                  minHeight: minHeight,
                  maxWidth: maxWidth,
                  maxHeight: maxHeight,
                  color: color,
                  padding: padding,
                  margin: margin,
                  borderRadius: borderRadius,
                  border: border,
                  duration: duration,
                  size: size,
                  gradient: gradient,
                  child: child,
                ),
      ),
    );
  }
}

class _Animated extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final double? minWidth;
  final double? minHeight;
  final double? maxWidth;
  final double? maxHeight;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final BoxBorder? border;

  final Duration? duration;
  final bool responsive;
  final double? size;
  final Gradient? gradient;

  const _Animated({
    required this.child,
    required this.responsive,
    required this.width,
    required this.height,
    required this.minWidth,
    required this.minHeight,
    required this.maxWidth,
    required this.maxHeight,
    required this.color,
    required this.padding,
    required this.margin,
    required this.borderRadius,
    required this.border,
    required this.duration,
    required this.size,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: duration ?? twoFiftyMS,
      margin: margin,
      height: responsive ? (size ?? height)?.sp : (size ?? height),
      width: responsive ? (size ?? width)?.sp : (size ?? width),
      padding: padding,
      constraints: BoxConstraints(
        minHeight: responsive ? (minHeight ?? 0).sp : (minHeight ?? 0),
        minWidth: responsive ? (minWidth ?? 0).sp : (minWidth ?? 0),
        maxWidth:
            responsive
                ? (maxWidth ?? double.infinity).sp
                : (maxWidth ?? double.infinity),
        maxHeight:
            responsive
                ? (maxHeight ?? double.infinity).sp
                : (maxHeight ?? double.infinity),
      ),
      decoration: BoxDecoration(
        border: border,
        color: color ?? Colors.white,
        borderRadius: borderRadius ?? BorderRadius.zero,
        gradient: gradient,
      ),
      child: child,
    );
  }
}
