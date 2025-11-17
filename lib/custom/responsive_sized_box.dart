import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResponsiveSizedBox extends StatelessWidget {
  final num? height;
  final num? width;
  final num? size;
  final Widget? child;

  const ResponsiveSizedBox({
    super.key,
    this.height,
    this.width,
    this.size,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (size ?? height)?.sp,
      width: (size ?? width)?.sp,
      child: child,
    );
  }
}
