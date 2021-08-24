import 'package:get/get.dart';

import '../controllers/steps_controller.dart';

class StepsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StepsController>(
      () => StepsController(),
    );
  }
}
