import 'package:flutter/material.dart';
import 'package:zeepalm_assessment/src/widgets/inter_text.dart';

import '../../../const/colors.dart';

class HeadingText extends StatelessWidget {
  const HeadingText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return InterText(
      text,
      color: AppColors.lightBlack,
      fontWeight: FontWeight.w500,
      size: 12,
    );
  }
}
