import 'package:get/get.dart';
import 'package:squeeze/app/core/constant/app_constants.dart';
import 'package:squeeze/app/core/sessions/sessions.dart';
import 'package:squeeze/app/modules/splash/views/select_language_view.dart';
import 'package:squeeze/app/routes/app_pages.dart';

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
