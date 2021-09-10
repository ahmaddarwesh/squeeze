import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeze/app/theme/app_colors.dart';
import 'package:squeeze/app/widgets/custom_button.dart';
import 'package:squeeze/app/widgets/custom_text.dart';
import 'package:squeeze/app/widgets/custom_text_field.dart';
import 'package:squeeze/app/widgets/custom_title_top_bar.dart';
import 'package:squeeze/generated/locales.g.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.focusScope!.unfocus();
      },
      child: GetBuilder<ProfileController>(
        builder: (_) => Scaffold(
          backgroundColor: white,
          body: SingleChildScrollView(
            child: Form(
              key: controller.formData,
              autovalidateMode:
                  controller.startValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
              onChanged: () {
                controller.changeCanUpdate();
              },
              child: SizedBox(
                width: Get.width,
                height: Get.height,
                child: Column(
                  children: [
                    Flexible(
                      flex: 6,
                      child: Column(
                        children: [
                          CTitleTopBar(title: LocaleKeys.edit_profile.tr, horizontalPadding: 0),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                SizedBox(height: 20),
                                CTextField(
                                  hint: "First Name",
                                  controller: controller.firstNameController,
                                  validator: controller.nameValidation,
                                  textInputAction: TextInputAction.next,
                                ),
                                SizedBox(height: 15),
                                CTextField(
                                  hint: "Last Name",
                                  controller: controller.lastNameController,
                                  validator: controller.nameValidation,
                                  textInputAction: TextInputAction.next,
                                ),
                                SizedBox(height: 15),
                                CTextField(
                                  hint: "Email Address",
                                  controller: controller.emailController,
                                  validator: controller.emailValidate,
                                  textInputAction: TextInputAction.next,
                                ),
                                SizedBox(height: 15),
                                buildPhoneNumber(),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: CButton(
                        radius: 12,
                        margin: EdgeInsets.only(left: 20, right: 20),
                        text: LocaleKeys.update.tr,
                        color: secondaryColor,
                        width: Get.width,
                        height: 45,
                        onTap: () {
                          controller.updateProfile();
                        },
                        disable: !controller.canUpdate,
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

  CTextField buildPhoneNumber() {
    return CTextField(
      hint: "Phone Number",
      readOnly: true,
      controller: controller.phoneNumberController,
      textInputAction: TextInputAction.go,
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
}
