import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeepalm_assessment/src/const/colors.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({
    super.key,
    required this.text1,
    required this.text2,
    this.isWhite = false,
  });

  final String text1;
  final String text2;
  final bool isWhite;

  @override
  Widget build(BuildContext context) {
    TextStyle style(Color color, double size, FontWeight weight) {
      return GoogleFonts.montserrat(
        fontSize: size,
        color: isWhite ? AppColors.primaryWhite : color,
        fontWeight: weight,
      );
    }

    return Text.rich(
      textAlign: TextAlign.start,
      TextSpan(
        text: text1,
        style: style(
          AppColors.titleBlue,
          25.69,
          FontWeight.w700,
        ),
        children: <TextSpan>[
          TextSpan(
            text: text2,
            style: style(
              AppColors.lightText,
              17,
              FontWeight.w400,
            ),
            // recognizer: TapGestureRecognizer()
            //   ..onTap = () {
            //     // Handle tap
            //     print('Text tapped!');
            //   },
          ),
        ],
      ),
    );
  }
}
