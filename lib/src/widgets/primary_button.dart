import 'package:flutter/material.dart';
import 'package:zeepalm_assessment/src/widgets/inter_text.dart';

import '../const/colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    this.text = '',
    this.isLogout = false,
    this.isLoading = false,
    this.child,
  });

  final VoidCallback onPressed;
  final String text;
  final bool isLogout;
  final bool isLoading;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor:
            // isLoading ? const Color(0xffE5E7EB) :
            AppColors.primaryBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
        minimumSize: const Size(double.infinity, 48),
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
                  child: InterText(
                    text,
                    size: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryWhite,
                  ),
                )
              : child!,
    );
  }
}
