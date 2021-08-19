import 'package:get/get.dart';
import 'package:squeeze/app/core/constant/app_constants.dart';
import 'package:squeeze/app_controller.dart';

class ChangeLanguageController extends GetxController {
  var tempIsEnglish;

  void changeTempLanguage(String language) {
    tempIsEnglish = language == EN;
    update();
  }

  onUpdate() async {
    if (AppController.to.isEnglish == tempIsEnglish) {
      Get.back();
      return;
    }
    await AppController.to.changeLanguage(locale: tempIsEnglish ? EN : AR);
    Get.back();
  }

  @override
  void onInit() {
    tempIsEnglish = AppController.to.isEnglish;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
