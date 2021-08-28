import 'package:get/get.dart';
import 'package:squeeze/app/core/constant/app_constants.dart';
import 'package:squeeze/app/core/logger/logger.dart';
import 'package:squeeze/app/data/models/service_model.dart';
import 'package:squeeze/app/data/models/step_model.dart';
import 'package:squeeze/app_controller.dart';

class StepsController extends GetxController {
  late Service service;
  late String serviceName;
  late List<Step> listSteps;
  List<Options> list = [];
  late Options selectedOption;

  getSteps() {}
  @override
  void onInit() {
    service = Get.arguments as Service;
    serviceName = AppController.to.isEnglish ? service.name! : service.nameAr!;
    list.add(Options(id: 0, name: "Apartment"));
    list.add(Options(id: 1, name: "Villa"));
    list.add(Options(id: 2, name: "Office"));
    list.add(Options(id: 3, name: "Shop"));
    selectedOption = list.first;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void selectOption(Options option) {
    selectedOption = option;
    update();
  }
}
