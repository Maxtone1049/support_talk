import 'package:flutter/material.dart';
import 'package:wepay/custom/app_colors.dart';
import 'package:wepay/custom/app_values.dart';
import 'package:wepay/custom/custom_card.dart';
import 'package:wepay/custom/ui_helper.dart';

class BouncingDots extends StatefulWidget {
  final Color? color;
  final double? size;

  const BouncingDots({this.color, this.size, super.key});

  @override
  State<BouncingDots> createState() => _BouncingDotsState();
}

class _BouncingDotsState extends State<BouncingDots>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: oneSecond,
      lowerBound: 0.1,
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildDot(0),
        horizontalSpaceCustom(8),
        _buildDot(1),
        horizontalSpaceCustom(8),
        _buildDot(2),
      ],
    );
  }

  Widget _buildDot(int index) {
    return ScaleTransition(
      scale: _animationController.drive(
        CurveTween(curve: Interval(index * 0.33, (index + 1) * 0.33)),
      ),
      child: CustomCard(
        size: widget.size ?? 8,
        color: widget.color ?? kPrimaryColor,
        borderRadius: k100pxBorderRadius,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class TypingDots extends StatefulWidget {
  final int numberOfDots;
  final double size;
  final Color color;
  final Duration duration;

  const TypingDots({
    this.numberOfDots = 3,
    this.size = 8.0,
    this.color = Colors.black,
    this.duration = const Duration(milliseconds: 300),
    super.key,
  });

  @override
  State<TypingDots> createState() => _TypingDotsState();
}

class _TypingDotsState extends State<TypingDots> with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();

    _controllers = List.generate(widget.numberOfDots, (index) {
      return AnimationController(vsync: this, duration: widget.duration)
        ..repeat(
          reverse: true,
          period: widget.duration * (widget.numberOfDots + index),
        );
    });

    _animations =
        _controllers.map((controller) {
          return Tween(begin: 0.0, end: widget.size).animate(controller);
        }).toList();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.numberOfDots, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: AnimatedBuilder(
            animation: _animations[index],
            builder: (context, child) {
              return Container(
                width: widget.size,
                height: _animations[index].value,
                decoration: BoxDecoration(
                  color: widget.color,
                  shape: BoxShape.circle,
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
