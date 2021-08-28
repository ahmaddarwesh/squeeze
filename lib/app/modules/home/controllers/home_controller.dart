import 'package:get/get.dart';
import 'package:squeeze/app/core/functions/dialogs.dart';
import 'package:squeeze/app/data/models/service_model.dart';
import 'package:squeeze/app/data/repositories/services_repository.dart';
import 'package:squeeze/app/routes/app_pages.dart';

import 'package:squeeze/app_controller.dart';

class HomeController extends GetxController {
  List<Service> services = [];

  getServices() async {
    services = await ServicesRepository.getServices();
    update();
    hideLoading();
  }

  String getServiceName(int index) =>
      AppController.to.isEnglish ? services[index].name! : services[index].name!;

  @override
  void onInit() {
    getServices();
    super.onInit();
  }

  @override
  void onReady() {
    showLoading();
    super.onReady();
  }

  @override
  void onClose() {}

  void onServiceTap(Service? service) async {
    if (service == null) return;
    Get.toNamed(Routes.STEPS, arguments: service);
  }
}
