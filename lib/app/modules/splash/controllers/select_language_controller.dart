import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeze/app/core/constant/app_constants.dart';
import 'package:squeeze/app/core/functions/dialogs.dart';
import 'package:squeeze/app/core/sessions/sessions.dart';
import 'package:squeeze/app/routes/app_pages.dart';
import 'package:squeeze/app_controller.dart';

class SelectLanguageController extends GetxController {
  String? selected;

  changeSelected(String language) async {
    selected = language;
    update();
    await AppController.to.changeLanguage(locale: language);
    Get.offAllNamed(Routes.HOME);
  }

  @override
  void onInit() {
    // selected = Sessions.read(LANGUAGE, def: EN);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
