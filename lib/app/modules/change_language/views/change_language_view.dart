import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:squeeze/app/core/constant/app_constants.dart';
import 'package:squeeze/app/theme/app_colors.dart';
import 'package:squeeze/app/widgets/custom_appbar.dart';
import 'package:squeeze/app/widgets/custom_button.dart';
import 'package:squeeze/app/widgets/custom_text.dart';
import 'package:squeeze/app/widgets/custom_title_top_bar.dart';
import 'package:squeeze/app_controller.dart';
import 'package:squeeze/generated/locales.g.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controllers/change_language_controller.dart';

class ChangeLanguageView extends GetView<ChangeLanguageController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangeLanguageController>(
      builder: (_) => Scaffold(
        backgroundColor: white,
        body: SingleChildScrollView(
          child: Container(
            width: Get.width,
            height: Get.height,
            child: Column(
              children: [
                Flexible(
                  flex: 6,
                  child: Column(
                    children: [
                      CTitleTopBar(title: LocaleKeys.select_language.tr, horizontalPadding: 0),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            SizedBox(height: 20),
                            buildEnglish(),
                            SizedBox(height: 12),
                            buildArabic(),
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
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: CText(
                      text: LocaleKeys.update.tr,
                      fontSize: 13.sp,
                      color: primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                    color: secondaryColor,
                    width: Get.width,
                    height: 45,
                    onTap: () {
                      controller.onUpdate();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  CButton buildEnglish() {
    return CButton(
      radius: 13,
      width: Get.width,
      height: 45,
      border: !controller.tempIsEnglish ? Border.all(width: 1, color: Colors.grey[300]!) : null,
      color: controller.tempIsEnglish ? secondaryColor : null,
      onTap: () {
        if (controller.tempIsEnglish) {
          return;
        }
        controller.changeTempLanguage(EN);
      },
      padding: AppController.to.isEnglish ? EdgeInsets.only(left: 15) : EdgeInsets.only(right: 15),
      child: Align(
        alignment: AppController.to.alignment,
        child: CText(
          fontWeight: FontWeight.w500,
          text: LocaleKeys.english.tr,
          fontSize: 13.sp,
          color: controller.tempIsEnglish ? primaryColor : black,
        ),
      ),
    );
  }

  CButton buildArabic() {
    return CButton(
      radius: 13,
      width: Get.width,
      height: 45,
      color: !controller.tempIsEnglish ? secondaryColor : null,
      border: controller.tempIsEnglish ? Border.all(width: 1, color: Colors.grey[300]!) : null,
      onTap: () {
        if (!controller.tempIsEnglish) {
          return;
        }
        controller.changeTempLanguage(AR);
      },
      padding: AppController.to.isEnglish ? EdgeInsets.only(left: 15) : EdgeInsets.only(right: 15),
      child: Align(
        alignment: AppController.to.alignment,
        child: CText(
          fontWeight: FontWeight.w500,
          text: LocaleKeys.arabic.tr,
          fontSize: 13.sp,
          color: !controller.tempIsEnglish ? primaryColor : black,
        ),
      ),
    );
  }
}
