import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:squeeze/app/theme/app_colors.dart';
import 'package:squeeze/app/widgets/custom_text.dart';
import 'package:squeeze/generated/locales.g.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: GetBuilder<SplashController>(
          builder: (_) => CText(
            style: GoogleFonts.poppins(
              fontSize: 50,
              fontWeight: FontWeight.w900,
              color: secondaryColor,
            ),
            text: LocaleKeys.app_name.tr,
          ),
        ),
      ),
    );
  }
}
