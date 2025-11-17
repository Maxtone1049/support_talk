import 'package:flutter/material.dart';
import 'package:wepay/custom/extensions/extensions.dart';
import 'package:wepay/custom/ui_helper.dart';

class PaddedColumn extends StatelessWidget {
  final EdgeInsets? padding;
  final List<Widget>? children;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final bool? visible;
  final double? spacing;

  const PaddedColumn({
    this.children,
    super.key,
    this.padding,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.mainAxisSize,
    this.visible,
    this.spacing,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible ?? true,
      child: Padding(
        padding: padding ?? EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: mainAxisSize ?? MainAxisSize.min,
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
          children:
              children?.insertBetweenElements(
                verticalSpaceCustom(spacing ?? 0),
              ) ??
              [],
        ),
      ),
    );
  }
}

class PaddedRow extends StatelessWidget {
  final List<Widget>? children;
  final EdgeInsets? padding;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final bool? visible;
  final double? spacing;

  const PaddedRow({
    this.children,
    super.key,
    this.padding,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.visible,
    this.spacing,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible ?? true,
      child: Padding(
        padding: padding ?? EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
          mainAxisSize: mainAxisSize ?? MainAxisSize.max,
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
          children:
              children?.insertBetweenElements(
                horizontalSpaceCustom(spacing ?? 0),
              ) ??
              [],
        ),
      ),
    );
  }
}

class ScrollableColumn extends StatelessWidget {
  final List<Widget>? children;
  final EdgeInsets? padding;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final ScrollController? scrollController;
  final bool reverse;
  final double? spacing;

  const ScrollableColumn({
    super.key,
    this.children,
    this.padding,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.scrollController,
    this.reverse = false,
    this.spacing,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: reverse,
      controller: scrollController,
      padding: padding ?? EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
        children:
            children?.insertBetweenElements(
              verticalSpaceCustom(spacing ?? 0),
            ) ??
            [],
      ),
    );
  }
}

class ScrollableRow extends StatelessWidget {
  final List<Widget>? children;
  final EdgeInsets? padding;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final double? spacing;

  const ScrollableRow({
    super.key,
    this.children,
    this.padding,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.spacing,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 20),
      scrollDirection: Axis.horizontal,
      child: PaddedRow(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children:
            children?.insertBetweenElements(
              horizontalSpaceCustom(spacing ?? 0),
            ) ??
            [],
      ),
    );
  }
}
