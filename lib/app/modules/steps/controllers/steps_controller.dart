import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:squeeze/app/core/constant/remote_constants.dart';
import 'package:squeeze/app/core/functions/dialogs.dart';
import 'package:squeeze/app/core/logger/logger.dart';
import 'package:squeeze/app/data/models/service_model.dart';
import 'package:squeeze/app/data/models/step_model.dart';
import 'package:squeeze/app/data/repositories/step_repository.dart';
import 'package:squeeze/app_controller.dart';

class StepsController extends GetxController {
  late Service service;
  late String serviceName;

  late int currentStep;
  late double totalValue;

  late PageController pageController;

  List<Step> steps = [];
  Map<String, dynamic> order = {};

  Map<String, dynamic> costs = {};

  getSteps() async {
    showLoading();
    await StepRepository.getSteps().then((value) {
      steps.addAll(value);
      savePricing();
      update();
    });
    hideLoading();
  }

  void savePricing() {
    steps[currentStep].options!.forEach((element) {
      var price = element.settings[PRICE];
      if (price != null) {
        costs[element.id.toString()] = price;
      }
    });
    l(info: costs);
  }

  void select(int id, selectedObject, {multiSelect = false}) {
    if (multiSelect) {
      if (order.containsKey(id.toString())) {
        var list = order[id.toString()] as List;
        if (list.contains(selectedObject)) {
          list.remove(selectedObject);
        } else {
          list.add(selectedObject);
        }
        order[id.toString()] = list;
      } else {
        order[id.toString()] = [selectedObject];
      }
    } else {
      order[id.toString()] = selectedObject;
    }
    calculatePrice();

    update();
  }

  void calculatePrice() {
    order.forEach((key, value) {
      if (value is List) {
        return;
      }
      costs.forEach((key1, value1) {
        var costTimesValue = value1[COST_TIMES_VALUE];
        var valueTimesPrice = value1[VALUE_TIMES_PRICE];
        var count = value[VALUE];

        if (key == key1) {
          if (costTimesValue != null) {
            totalValue = double.parse((costTimesValue * count).toString());
          }
          if (valueTimesPrice != null) {
            totalValue = totalValue * count;
          }
        }
      });
    });
  }

  bool isSelected(int id, selectedObject, {multiSelect = false}) {
    if (order.keys.contains(id.toString())) {
      if (multiSelect) {
        var list = order[id.toString()] as List;
        if (list.contains(selectedObject)) {
          return true;
        } else {
          return false;
        }
      } else {
        if (selectedObject == order[id.toString()]) {
          return true;
        } else {
          return false;
        }
      }
    } else {
      return false;
    }
  }

  bool isOptionsSelectItem(int? id) {
    if (id == null) return true;
    return order.keys.contains(id.toString());
  }

  void changeStep({toNext = true}) {
    if (toNext) {
      if (currentStep > steps.length) return;
      currentStep += 1;
    } else {
      if (currentStep == 0) return;
      currentStep -= 1;
    }

    pageController.animateToPage(
      currentStep,
      duration: 400.milliseconds,
      curve: Curves.ease,
    );
    update();
  }

  Future<bool> onBackPressed() async {
    if (currentStep == 0) {
      Get.back();
      return true;
    } else {
      changeStep(toNext: false);
      return false;
    }
  }

  @override
  void onInit() async {
    service = Get.arguments as Service;
    serviceName = AppController.to.isEnglish ? service.name! : service.nameAr!;
    pageController = PageController();
    currentStep = 0;
    totalValue = 0.00;

    await getSteps();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}

// List<Options> list = [];
// List<Options> list2 = [];
// List<Options> list3 = [];
// List<Options> list4 = [];
// var selectedOption;

// void selectOption(Options option) {
//   selectedOption = option;
//   update();
// }

// list.add(Options(id: 0, name: "Apartment"));
// list.add(Options(id: 1, name: "Villa"));
// list.add(Options(id: 2, name: "Office"));
// list.add(Options(id: 3, name: "Shop"));
//
// list2.add(Options(id: 0, name: "S"));
// list2.add(Options(id: 1, name: "1"));
// list2.add(Options(id: 2, name: "2"));
// list2.add(Options(id: 3, name: "3"));
// list2.add(Options(id: 4, name: "4"));
// list2.add(Options(id: 5, name: "5"));
// list2.add(Options(id: 6, name: "6"));
//
// list3.add(Options(id: 0, name: "2"));
// list3.add(Options(id: 1, name: "3"));
// list3.add(Options(id: 2, name: "4"));
// list3.add(Options(id: 3, name: "5"));
// list3.add(Options(id: 4, name: "6"));
// list3.add(Options(id: 5, name: "7"));
// list3.add(Options(id: 6, name: "8"));
//
// list4.add(Options(id: 0, name: "1"));
// list4.add(Options(id: 1, name: "2"));
// list4.add(Options(id: 2, name: "3"));
// list4.add(Options(id: 3, name: "4"));
