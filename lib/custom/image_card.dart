import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wepay/custom/app_colors.dart';
import 'package:wepay/custom/custom_card.dart';
import 'package:wepay/custom/responsive_sized_box.dart';
import 'package:wepay/custom/responsive_svg.dart';

class ImageCard extends StatelessWidget {
  final double? width;
  final double? height;
  final double? size;
  final String imageURL;
  final BorderRadius? borderRadius;
  final Color? color;
  final GestureTapCallback? onTap;
  final bool _isLocal;
  final BoxFit? fit;
  final bool isStore;
  final bool isMealItem;
  final bool isGroceryItem;
  final double? placeholderSize;

  const ImageCard.network(
    this.imageURL, {
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.size,
    this.color,
    this.onTap,
    this.fit,
    this.isStore = false,
    this.isMealItem = false,
    this.isGroceryItem = false,
    this.placeholderSize,
  }) : _isLocal = false;

  const ImageCard.local(
    this.imageURL, {
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.size,
    this.color,
    this.onTap,
    this.fit,
    this.isStore = false,
    this.isMealItem = false,
    this.isGroceryItem = false,
    this.placeholderSize,
  }) : _isLocal = true;

  String? get _placeHolder =>
      isStore
          ? 'vendor_placeholder.svg'
          : isMealItem
          ? 'meal_item_placeholder.svg'
          : isGroceryItem
          ? 'item_placeholder_image.png'
          : null;

  @override
  Widget build(BuildContext context) {
    final pixelRatio = MediaQuery.of(context).devicePixelRatio;
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: Stack(
        children: [
          imageURL.isEmpty
              ? CustomCard(
                width: size ?? width,
                height: size ?? height,
                color: kD4D4D4,
                child:
                    _placeHolder == null
                        ? const SizedBox.shrink()
                        : Center(
                          child: ImageCard.local(
                            _placeHolder!,
                            size:
                                placeholderSize ??
                                (((size ?? height) ?? 24) / 2),
                          ),
                        ),
              )
              : _isLocal
              ? imageURL.contains('svg')
                  // ignore: deprecated_member_use_from_same_package
                  ? ResponsiveSvg(
                    'assets/$imageURL',
                    width: width,
                    height: height,
                    size: size,
                    color: color,
                    fit: fit,
                  )
                  : Image.asset(
                    'assets/$imageURL',
                    fit: fit ?? BoxFit.cover,
                    color: color,
                    width: (size ?? width)?.sp,
                    height: (size ?? height)?.sp,
                    errorBuilder:
                        (context, error, stackTrace) => CustomCard(
                          width: width,
                          height: height,
                          size: size,
                          color: kF6F7F9,
                          borderRadius: borderRadius,
                        ),
                    cacheHeight:
                        ((size ?? height ?? 200).sp * pixelRatio).round(),
                    cacheWidth:
                        (((size ?? width) == double.maxFinite
                                    ? 414
                                    : (size ?? width ?? 200).sp) *
                                pixelRatio)
                            .round(),
                  )
              : CachedNetworkImage(
                imageUrl: imageURL,
                // cacheHeight:
                //     ((size ?? height ?? 200).sp * pixelRatio).round(),
                // cacheWidth: (((size ?? width) == double.maxFinite
                //             ? 414
                //             : (size ?? width ?? 200).sp) *
                //         pixelRatio)
                //     .round(),
                fit: fit ?? BoxFit.cover,
                width: (size ?? width)?.sp,
                height: (size ?? height)?.sp,
                errorWidget:
                    (context, url, error) => Container(
                      width: (size ?? width)?.sp,
                      height: (size ?? height)?.sp,
                      color: kD4D4D4,
                      child:
                          _placeHolder == null
                              ? const SizedBox.shrink()
                              : Center(
                                child: ImageCard.local(
                                  _placeHolder!,
                                  size:
                                      placeholderSize ??
                                      (((size ?? height) ?? 24) / 2),
                                ),
                              ),
                    ),
                placeholder: (context, url) {
                  // if (progress == null) return child;
                  return Container(
                    width: (size ?? width)?.sp,
                    height: (size ?? height)?.sp,
                    color: kD4D4D4,
                  );
                },
              ),
          if (onTap != null)
            ResponsiveSizedBox(
              height: height,
              width: width,
              size: size,
              child: Material(
                color: color ?? Colors.white,
                type: MaterialType.transparency,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: borderRadius ?? BorderRadius.zero,
                ),
                child: InkWell(
                  onTap: onTap ?? () {},
                  customBorder: RoundedRectangleBorder(
                    borderRadius: borderRadius ?? BorderRadius.zero,
                  ),
                  child: const SizedBox.shrink(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
