import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeze/app/core/constant/app_constants.dart';
import 'package:squeeze/app/core/functions/dialogs.dart';
import 'package:squeeze/app/core/sessions/sessions.dart';
import 'package:squeeze/app/routes/app_pages.dart';
import 'package:squeeze/app_controller.dart';

class SelectLanguageController extends GetxController {
  late String selected;
  selectLanguage(String locale) async {
    await AppController.to.changeLanguage(locale: locale);
    Get.offAllNamed(Routes.HOME);
  }

  changeSelected(String language) {
    selected = language;
    selectLanguage(language);
    update();
  }

  @override
  void onInit() {
    selected = Sessions.read(LANGUAGE, def: EN);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
