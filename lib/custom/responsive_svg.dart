import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

@Deprecated('Use ImageCard.local instead to ensure uniformity')
class ResponsiveSvg extends StatelessWidget {
  final String path;
  final num? size;
  final num? height;
  final num? width;
  final Color? color;
  final BoxFit? fit;
  final GestureTapCallback? onTap;

  const ResponsiveSvg(
    this.path, {
    super.key,
    this.size,
    this.color,
    this.height,
    this.width,
    this.fit,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        path,
        height: height?.sp ?? size?.sp,
        width: width?.sp ?? size?.sp,
        fit: fit ?? BoxFit.contain,
        colorFilter:
            color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
      ),
    );
  }
}
