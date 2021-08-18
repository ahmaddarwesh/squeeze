import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class Themes {
  static var light = ThemeData.light().copyWith(
    primaryColor: secondaryColor,
    accentColor: white,
    textTheme: GoogleFonts.poppinsTextTheme(),
  );

  //dark mode theme
  static var dark = ThemeData.dark().copyWith(
    primaryColor: secondaryColor,
    accentColor: white,
    textTheme: GoogleFonts.poppinsTextTheme(),
  );
}
