import 'package:get/get.dart';
import 'package:squeeze/app/modules/splash/views/select_language_view.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() async {
    await 1.seconds.delay();
    Get.off(() => SelectLanguageView(), transition: Transition.noTransition);
    super.onReady();
  }

  @override
  void onClose() {}
}
