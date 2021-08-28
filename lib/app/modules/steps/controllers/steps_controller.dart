import 'package:get/get.dart';
import 'package:squeeze/app/data/models/service_model.dart';
import 'package:squeeze/app/data/models/step_model.dart';
import 'package:squeeze/app/data/repositories/step_repository.dart';
import 'package:squeeze/app_controller.dart';

class StepsController extends GetxController {
  late Service service;
  late String serviceName;

  List<Options> list = [];
  List<Options> list2 = [];
  List<Options> list3 = [];
  List<Options> list4 = [];
  var selectedOption;

  // List<Step> steps = [];

  // Map<String, dynamic> order = {};

  // getSteps() {
  //   StepRepository.getSteps().then((value) {
  //     steps.addAll(value);
  //   });
  // }

  @override
  void onInit() async {
    service = Get.arguments as Service;
    serviceName = AppController.to.isEnglish ? service.name! : service.nameAr!;
    // await getSteps();

    list.add(Options(id: 0, name: "Apartment"));
    list.add(Options(id: 1, name: "Villa"));
    list.add(Options(id: 2, name: "Office"));
    list.add(Options(id: 3, name: "Shop"));

    list2.add(Options(id: 0, name: "S"));
    list2.add(Options(id: 1, name: "1"));
    list2.add(Options(id: 2, name: "2"));
    list2.add(Options(id: 3, name: "3"));
    list2.add(Options(id: 4, name: "4"));
    list2.add(Options(id: 5, name: "5"));
    list2.add(Options(id: 6, name: "6"));

    list3.add(Options(id: 0, name: "2"));
    list3.add(Options(id: 1, name: "3"));
    list3.add(Options(id: 2, name: "4"));
    list3.add(Options(id: 3, name: "5"));
    list3.add(Options(id: 4, name: "6"));
    list3.add(Options(id: 5, name: "7"));
    list3.add(Options(id: 6, name: "8"));

    list4.add(Options(id: 0, name: "1"));
    list4.add(Options(id: 1, name: "2"));
    list4.add(Options(id: 2, name: "3"));
    list4.add(Options(id: 3, name: "4"));
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
