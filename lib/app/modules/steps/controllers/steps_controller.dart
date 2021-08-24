import 'package:get/get.dart';
import 'package:squeeze/app/core/constant/app_constants.dart';
import 'package:squeeze/app/data/models/service_model.dart';
import 'package:squeeze/app_controller.dart';

class StepsController extends GetxController {
  late Service service;

  late String serviceName;

  @override
  void onInit() {
    service = Get.arguments as Service;
    serviceName = AppController.to.isEnglish ? service.name! : service.nameAr!;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
