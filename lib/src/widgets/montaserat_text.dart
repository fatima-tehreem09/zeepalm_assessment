import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../const/colors.dart';

class Montserrat extends Text {
  Montserrat(
    super.data, {
    super.key,
    super.textAlign,
    super.maxLines,
    Color? color = AppColors.titleBlue,
    double? height,
    double? letterSpacing,
    double? decorationThickness,
    double? size = 14.99,
    FontWeight? fontWeight = FontWeight.w400,
    FontStyle? fontStyle,
    TextDecoration? decoration,
    TextOverflow? textOverflow,
  }) : super(
          textDirection: TextDirection.ltr,
          style: GoogleFonts.montserrat(
                  color: color,
                  fontSize: size,
                  height: height,
                  fontStyle: fontStyle,
                  decoration: decoration,
                  decorationColor: color,
                  letterSpacing: letterSpacing,
                  fontWeight: fontWeight,
                  decorationThickness: decorationThickness)
              .copyWith(
            overflow: textOverflow,
          ),
        );
}
