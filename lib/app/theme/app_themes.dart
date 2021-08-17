import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:squeeze/app_controller.dart';
import 'app_colors.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    primaryColor: secondaryColor,
    accentColor: white,

    // textTheme: GoogleFonts.poppinsTextTheme(),
  );
  static final dark = ThemeData.dark().copyWith(
    primaryColor: secondaryColor,
    accentColor: white,
    // textTheme: GoogleFonts.poppinsTextTheme(),
  );
}
