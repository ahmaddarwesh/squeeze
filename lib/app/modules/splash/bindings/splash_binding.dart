import 'package:get/get.dart';

import 'package:squeeze/app/modules/splash/controllers/select_language_controller.dart';

import '../controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectLanguageController>(
      () => SelectLanguageController(),
    );
    Get.lazyPut<SplashController>(
      () => SplashController(),
    );
  }
}
