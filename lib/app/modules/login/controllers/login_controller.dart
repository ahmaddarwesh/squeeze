import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql/src/exceptions/exceptions_next.dart';
import 'package:squeeze/app/core/client/graphql_client.dart';
import 'package:squeeze/app/core/functions/dialogs.dart';
import 'package:squeeze/app/core/logger/logger.dart';
import 'package:squeeze/app/data/providers/login_provider.dart';
import 'package:squeeze/app/data/providers/verificarion_code_provider.dart';
import 'package:squeeze/app/data/repositories/me_repository.dart';

import '../../../../app_controller.dart';

class LoginController extends GetxController {
  late GlobalKey<FormState> formKey;
  late String regexPhoneNumber;
  late String mask;
  late bool startValidate;
  late TextEditingController pinCodeController;
  late TextEditingController phoneNumberController;

  onChangeMobileNumber(String text) {
    if (text.startsWith("0")) {
      this.mask = "xxxxxxxxxx";
    } else {
      this.mask = "xxxxxxxxx";
    }
    update();
  }

  Future login({onSuccess}) async {
    if (formKey.currentState!.validate()) {
      await LoginProvider.login(phoneNumberController.text).then((value) {
        hideLoading();
        if (!value.hasException) {
          onSuccess();
        } else {
          printTheError(exception: value.exception);
          var error = value.exception!.graphqlErrors.first.message;
          CDialog(text: error, title: "Error");
        }
      });
    } else {
      startValidate = true;
      update();
    }
  }

  verificationCode() {
    if (pinCodeController.text.isNotEmpty) {
      showLoading();
      VerificationCodeProvider.verify(pinCodeController.text).then((value) async {
        hideLoading();
        if (!value.hasException) {
          Get.close(3);
          await 100.milliseconds.delay();
          AppController.to.changeIsAuth(true);
          MeRepository.getProfile();
        } else {
          l(error: value.exception);
          var error = value.exception!.graphqlErrors.first.message;
          CDialog(text: error, title: "Error");
        }
      });
    }
  }

  String? phoneValidate(String? data) {
    if (phoneNumberController.text.trim() == '') {
      return "Field Required";
    }
    if (!RegExp(regexPhoneNumber).hasMatch(phoneNumberController.text.trim())) {
      return "Invalid Phone Number";
    }

    return null;
  }

  @override
  void onInit() {
    phoneNumberController = TextEditingController();
    pinCodeController = TextEditingController();
    mask = 'xxxxxxx';
    startValidate = false;
    formKey = GlobalKey<FormState>();
    regexPhoneNumber = r"^(?:\+971|00971|0)?(?:50|51|52|53|54|55|56|58)\d{7}$";
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
