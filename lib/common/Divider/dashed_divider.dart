import 'package:flutter/material.dart';

class DashedDividerMain extends StatelessWidget {
  final double height;
  final double dashWidth;
  final Color color;

  const DashedDividerMain({
    Key? key,
    this.height = 1,
    this.dashWidth = 8,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final dashCount =
            (constraints.constrainWidth() / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: height,
              child: DecoratedBox(decoration: BoxDecoration(color: color)),
            );
          }),
        );
      },
    );
  }
}
