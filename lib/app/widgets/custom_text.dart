import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:squeeze/app/core/constant/app_constants.dart';
import 'package:squeeze/app/core/logger/logger.dart';
import 'package:squeeze/app/core/sessions/sessions.dart';
import 'package:squeeze/app_controller.dart';

class CText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final TextAlign? textAlign;
  final double? height;
  final FontWeight? fontWeight;
  final TextDirection? textDirection;
  final int? maxLines;
  final double? letterSpacing;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final String? fontFamily;
  final TextStyle? style;
  final FontStyle? fontStyle;
  final Locale? locale;

  CText({
    required this.text,
    this.fontSize,
    this.color,
    this.textAlign,
    this.height,
    this.fontWeight,
    this.textDirection,
    this.maxLines,
    this.letterSpacing,
    this.overflow,
    this.decoration,
    this.fontFamily,
    this.style,
    this.fontStyle,
    this.locale,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: overflow,
      softWrap: false,
      locale: locale,
      textDirection: textDirection != null
          ? textDirection
          : AppController.to.isEnglish
              ? TextDirection.ltr
              : TextDirection.rtl,
      style: style != null
          ? style
          : AppController.to.isEnglish
              ? GoogleFonts.poppins(
                  height: height ?? 1.4,
                  fontStyle: fontStyle,
                  decoration: decoration,
                  letterSpacing: letterSpacing,
                  color: color,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                )
              : GoogleFonts.cairo(
                  height: height ?? 1.4,
                  fontStyle: fontStyle,
                  decoration: decoration,
                  letterSpacing: letterSpacing,
                  color: color,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ),
    );
  }
}
