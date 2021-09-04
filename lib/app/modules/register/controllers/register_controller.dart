import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeze/app/core/functions/dialogs.dart';
import 'package:squeeze/app/core/functions/phone_helper.dart';
import 'package:squeeze/app/core/logger/logger.dart';
import 'package:squeeze/app/core/sessions/sessions.dart';
import 'package:squeeze/app/data/models/register_model.dart';
import 'package:squeeze/app/data/providers/logout_provider.dart';
import 'package:squeeze/app/data/providers/register_provider.dart';
import 'package:squeeze/app/data/providers/verificarion_code_provider.dart';
import 'package:squeeze/app/data/repositories/me_repository.dart';
import 'package:squeeze/app/routes/app_pages.dart';
import 'package:squeeze/app_controller.dart';

class RegisterController extends GetxController {
  late TextEditingController phoneNumberController;
  late TextEditingController emailController;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController pinCodeController;
  late String mask;
  late RegisterInput registerInput;

  late GlobalKey<FormState> formKey;
  late String regexPhoneNumber;

  late bool startValidate;

  onChangeMobileNumber(String text) {
    if (text.startsWith("0")) {
      this.mask = "xxxxxxxxxx";
    } else {
      this.mask = "xxxxxxxxx";
    }
    update();
  }

  register({onSuccess}) {
    if (formKey.currentState!.validate()) {
      showLoading();
      preparingRegisterInput();
      LogoutProvider.logOut();
      RegisterProvider.register(registerInput).then((value) {
        hideLoading();
        if (!value.hasException) {
          onSuccess();
        } else {
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

  preparingRegisterInput() {
    String phoneNumber = getPhoneNumber(phoneNumberController.text.trim());
    String firstName = firstNameController.text.trim();
    String lastName = lastNameController.text.trim();
    String? email = emailController.text.trim();
    if (email == '' || email.isEmpty) {
      email = null;
    }
    registerInput = RegisterInput(
      registerRegisterInputData: RegisterInputRegisterRegisterInputData(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phoneNumber: phoneNumber,
      ),
    );

    Sessions.write("first", firstName);
    Sessions.write("last", lastName);
    Sessions.write("email", email);
    Sessions.write("phoneNumber", phoneNumber);
  }

  String? nameValidation(String? data) {
    if (data!.trim() == '') {
      return "Field Required";
    }
    return null;
  }

  String? emailValidate(String? data) {
    if (emailController.text.trim() != '') {
      if (!emailController.text.trim().isEmail) {
        return "Invalid Email Address";
      }
    }
    return null;
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
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
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
