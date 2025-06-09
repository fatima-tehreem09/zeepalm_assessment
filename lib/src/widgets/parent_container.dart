import 'package:flutter/material.dart';
import 'package:zeepalm_assessment/src/const/colors.dart';

class ParentContainer extends StatelessWidget {
  const ParentContainer({
    super.key,
    this.showBorder = true,
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 10.7, vertical: 2.14),
    this.opacity = 0.01,
    this.radius = 8.56,
    this.fillColor = AppColors.primaryPink,
    this.borderColor = AppColors.primaryPink,
    this.showOpacity = true,
    this.shadow = const [],
    this.borderRadius,
  });

  final Widget child;
  final bool showBorder;
  final EdgeInsets padding;
  final double opacity;
  final double radius;
  final Color fillColor;
  final Color borderColor;
  final bool showOpacity;
  final List<BoxShadow> shadow;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: borderRadius ??
            BorderRadius.circular(
              radius,
            ),
        color: fillColor.withValues(
          alpha: showOpacity ? opacity : 1.0,
        ),
        boxShadow: shadow,
        border: showBorder
            ? Border.all(
                color: borderColor,
                width: 1.07,
              )
            : null,
      ),
      child: child,
    );
  }
}
