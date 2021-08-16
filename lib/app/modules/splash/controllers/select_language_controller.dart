import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeze/app/core/constant/app_constants.dart';
import 'package:squeeze/app/core/sessions/sessions.dart';
import 'package:squeeze/app/routes/app_pages.dart';

class SelectLanguageController extends GetxController {
  selectLanguage(String locale) async {
    Get.updateLocale(Locale(locale));
    Sessions.write(LANGUAGE, locale);
    Get.offAllNamed(Routes.HOME);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
