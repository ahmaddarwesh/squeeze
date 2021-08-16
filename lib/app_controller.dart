import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:squeeze/app/core/sessions/sessions.dart';

import 'app/core/constant/app_constants.dart';

class AppController extends GetxController {
  static AppController get to => Get.find();
  late CrossAxisAlignment crossAxisAlignment;

  var isEnglish = true;
  var languageBox = GetStorage("Squeeze");

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
  }
}
