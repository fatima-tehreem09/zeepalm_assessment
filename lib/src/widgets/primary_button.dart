import 'package:flutter/material.dart';
import 'package:zeepalm_assessment/src/widgets/montaserat_text.dart';

import '../const/colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    this.text = '',
    this.isLogout = false,
    this.isLoading = false,
    this.child,
    this.isTransparent = false,
    this.borderRadius,
    this.textColor,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 8.56,
    ),
    this.showOpacity = true,
    this.textSize,
    this.side = BorderSide.none,
    this.maximumSize = const Size(double.infinity, 39),
  });

  final VoidCallback onPressed;
  final String text;
  final bool isLogout;
  final bool isTransparent;
  final bool isLoading;
  final Widget? child;
  final BorderRadius? borderRadius;
  final Color? textColor;
  final bool showOpacity;
  final EdgeInsets padding;
  final double? textSize;
  final BorderSide side;
  final Size maximumSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryPink,
        backgroundColor:
            // isLoading ? const Color(0xffE5E7EB) :
            isTransparent
                ? Colors.transparent
                : AppColors.primaryPink
                    .withValues(alpha: showOpacity ? 0.1 : 1.0),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(8.56),
          side: side,
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: padding,
        maximumSize: maximumSize,
        minimumSize: Size.zero,
        elevation: 0.0,
        overlayColor: Colors.transparent,
      ),
      onPressed: isLoading ? () {} : onPressed,
      child: isLoading
          ? const Center(
              child: CircularProgressIndicator(
              color: Colors.white,
            ))
          : text != ''
              ? Center(
                  child: Montserrat(
                    textAlign: TextAlign.center,
                    text,
                    size: textSize ?? 14.99,
                    fontWeight: FontWeight.w500,
                    color: textColor ?? AppColors.primaryPink,
                  ),
                )
              : child!,
    );
  }
}
