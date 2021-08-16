import 'package:get/get.dart';
import 'package:squeeze/app/modules/splash/views/select_language_view.dart';
import 'package:squeeze/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    await 2.seconds.delay();
    // Get.offAllNamed(Routes.HOME);
    Get.to(() => SelectLanguageView());
    super.onReady();
  }

  @override
  void onClose() {}
}
