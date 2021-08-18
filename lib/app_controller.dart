import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:squeeze/app/core/logger/logger.dart';
import 'package:squeeze/app/core/sessions/sessions.dart';
import 'package:squeeze/app/theme/app_themes.dart';

import 'app/core/constant/app_constants.dart';
import 'app/core/functions/dialogs.dart';

class AppController extends GetxController {
  static AppController get to => Get.find();
  late CrossAxisAlignment crossAxisAlignment;
  late TextDirection textDirection;
  late Alignment alignment;

  var isEnglish = true;
  var languageBox = GetStorage("Squeeze");

  Future changeLanguage({String? locale}) async {
    if (locale == null) {
      locale = isEnglish ? AR : EN;
    }
    await showLoading(duration: 700.milliseconds);
    Get.updateLocale(Locale(locale));
    Sessions.write(LANGUAGE, locale);
  }

  @override
  void onInit() {
    changeByLanguage();
    languageBox.listenKey(LANGUAGE, (value) {
      isEnglish = value != AR;
      changeByLanguage();
    });
    super.onInit();
  }

  changeByLanguage() {
    isEnglish = Sessions.read(LANGUAGE, def: EN) != AR;
    crossAxisAlignment =
        isEnglish ? CrossAxisAlignment.start : CrossAxisAlignment.end;
    textDirection = isEnglish ? TextDirection.ltr : TextDirection.rtl;
    alignment = isEnglish ? Alignment.centerLeft : Alignment.centerRight;
    Themes.light.copyWith(
      textTheme: isEnglish
          ? GoogleFonts.poppinsTextTheme()
          : GoogleFonts.almaraiTextTheme(),
    );
  }
}