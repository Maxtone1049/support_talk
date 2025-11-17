import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResponsiveIcon extends StatelessWidget {
  final double? size;
  final IconData? icon;
  final Color? color;

  const ResponsiveIcon(this.icon, {super.key, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return Icon(icon, color: color, size: (size ?? 20).sp);
  }
}
