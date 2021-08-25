import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:squeeze/app/core/functions/formatter_helper.dart';
import 'package:squeeze/app/theme/app_colors.dart';
import 'package:squeeze/app/widgets/custom_appbar.dart';
import 'package:squeeze/app/widgets/custom_button.dart';
import 'package:squeeze/app/widgets/custom_text.dart';
import 'package:squeeze/app/widgets/custom_text_field.dart';
import 'package:squeeze/app/widgets/custom_title_top_bar.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      builder: (_) => GestureDetector(
        onTap: () {
          Get.focusScope!.unfocus();
        },
        child: Scaffold(
          backgroundColor: white,
          body: SingleChildScrollView(
            child: Container(
              height: Get.height,
              width: Get.width,
              child: Form(
                autovalidateMode:
                    controller.startValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
                onChanged: () {
                  Get.appUpdate();
                },
                key: controller.formKey,
                child: Column(
                  children: [
                    Flexible(
                      flex: 6,
                      child: Column(
                        children: [
                          CTitleTopBar(title: "Sign Up", horizontalPadding: 0),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              children: [
                                SizedBox(height: 20),
                                buildFirstName(),
                                SizedBox(height: 13),
                                buildLastName(),
                                SizedBox(height: 13),
                                buildEmail(),
                                SizedBox(height: 13),
                                buildPhoneNumber(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: CButton(
                        radius: 12,
                        margin: EdgeInsets.only(bottom: 100, left: 20, right: 20),
                        child: CText(
                          text: "Sign Up",
                          fontSize: 13.sp,
                          color: primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                        color: secondaryColor,
                        width: Get.width,
                        height: 45,
                        onTap: () {
                          controller.register(onSuccess: () {
                            Get.focusScope!.unfocus();
                            showBarModalBottomSheet(
                              closeProgressThreshold: 20,
                              enableDrag: false,
                              context: context,
                              builder: (_) {
                                return buildVerificationCode();
                              },
                            );
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  CTextField buildEmail() {
    return CTextField(
      hint: "Email Address",
      validator: controller.emailValidate,
      textInputAction: TextInputAction.next,
      controller: controller.emailController,
    );
  }

  CTextField buildLastName() {
    return CTextField(
      hint: "Last Name",
      validator: controller.nameValidation,
      textInputAction: TextInputAction.next,
      controller: controller.lastNameController,
    );
  }

  CTextField buildFirstName() {
    return CTextField(
      hint: "First Name",
      validator: controller.nameValidation,
      textInputAction: TextInputAction.next,
      controller: controller.firstNameController,
    );
  }

  CTextField buildPhoneNumber() {
    return CTextField(
      hint: "Phone Number",
      textInputType: TextInputType.phone,
      controller: controller.phoneNumberController,
      onChange: controller.onChangeMobileNumber,
      textInputAction: TextInputAction.go,
      textInputFormatter: [
        MaskedTextInputFormatter(mask: controller.mask, separator: ''),
        FilteringTextInputFormatter.digitsOnly,
      ],
      validator: controller.phoneValidate,
      leftWidget: Container(
        margin: EdgeInsets.only(left: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CText(text: "+971", color: Colors.grey[400]),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 7),
              width: 0.8,
              height: 28,
              color: Colors.grey[300],
            )
          ],
        ),
      ),
    );
  }

  Widget buildVerificationCode() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: Get.height * .7,
        child: Column(
          children: [
            CTitleTopBar(
              title: "Verification code",
              horizontalPadding: 0,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  CText(
                    text:
                        "Please enter the six digit code has been sent to your phone number by SMS",
                    fontSize: 12.sp,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  buildPinCode(),
                  SizedBox(height: 20),
                  CButton(
                    child: CText(text: "Verify"),
                    onTap: () {
                      controller.verificationCode();
                    },
                    height: 45,
                    color: secondaryColor,
                    width: Get.width,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  buildPinCode() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: PinCodeTextField(
        length: 6,
        obscureText: false,
        autoFocus: true,
        enablePinAutofill: true,
        autoDisposeControllers: false,
        animationType: AnimationType.scale,
        autoDismissKeyboard: false,
        controller: controller.pinCodeController,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 40,
          activeColor: Colors.grey,
          inactiveColor: Colors.grey,
          inactiveFillColor: Colors.transparent,
          borderWidth: 1.5,
          selectedFillColor: Colors.transparent,
          selectedColor: secondaryColor,
          activeFillColor: Colors.white,
        ),
        animationDuration: Duration(milliseconds: 100),
        backgroundColor: Colors.white,
        enableActiveFill: false,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        onCompleted: (v) {
          print("Completed");
        },
        onChanged: (value) {
          print(value);
        },
        beforeTextPaste: (text) {
          print("Allowing to paste $text");
          return true;
        },
        appContext: Get.context!,
      ),
    );
  }
}
