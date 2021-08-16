import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  bool value = false;

  changeValue(bool value) {
    this.value = value;
    update();
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
