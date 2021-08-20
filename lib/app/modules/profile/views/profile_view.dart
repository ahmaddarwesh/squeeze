import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:squeeze/app/theme/app_colors.dart';
import 'package:squeeze/app/widgets/custom_appbar.dart';
import 'package:squeeze/app/widgets/custom_button.dart';
import 'package:squeeze/app/widgets/custom_text.dart';
import 'package:squeeze/app/widgets/custom_text_field.dart';
import 'package:squeeze/app/widgets/custom_title_top_bar.dart';
import 'package:squeeze/generated/locales.g.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.focusScope!.unfocus();
      },
      child: Scaffold(
        backgroundColor: white,
        appBar: CAppBar(title: Container()),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CTitleTopBar(title: LocaleKeys.profile.tr),
                  SizedBox(height: 20),
                  CTextField(hint: "First Name"),
                  SizedBox(height: 15),
                  CTextField(hint: "Last Name"),
                  SizedBox(height: 15),
                  CTextField(hint: "Email Address"),
                  SizedBox(height: 15),
                  buildPhoneNumber(),
                ],
              ),
              SizedBox(height: Get.height * .3),
              CButton(
                radius: 12,
                margin: EdgeInsets.only(bottom: 100),
                child: CText(
                  text: LocaleKeys.update.tr,
                  fontSize: 13.sp,
                  color: primaryColor,
                  fontWeight: FontWeight.w600,
                ),
                color: secondaryColor,
                width: Get.width,
                height: 40,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  CTextField buildPhoneNumber() {
    return CTextField(
      hint: "Phone Number",
      leftWidget: Row(
        children: [
          CText(
            text: "+971",
            color: Colors.grey[400],
            // fontWeight: FontWeight.w500,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 7),
            width: 0.8,
            height: 26,
            color: Colors.grey[300],
          )
        ],
      ),
    );
  }
}
