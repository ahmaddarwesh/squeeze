import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:squeeze/app/core/constant/app_constants.dart';
import 'package:squeeze/app/modules/splash/controllers/select_language_controller.dart';
import 'package:squeeze/app/theme/app_colors.dart';
import 'package:squeeze/app/widgets/custom_button.dart';
import 'package:squeeze/app/widgets/custom_text.dart';
import 'package:squeeze/app/widgets/find_the_best.dart';
import 'package:squeeze/app_controller.dart';
import 'package:squeeze/generated/locales.g.dart';

class SelectLanguageView extends GetView<SelectLanguageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Container(
        padding: EdgeInsets.only(right: 30, left: 30, top: 10),
        child: Column(
          crossAxisAlignment: AppController.to.crossAxisAlignment,
          children: [
            SizedBox(height: AppBar().preferredSize.height),
            Container(
              child: Directionality(
                textDirection: AppController.to.textDirection,
                child: FindTheBest(),
              ),
            ),
            GetBuilder<SelectLanguageController>(
              builder: (_) => Container(
                margin: EdgeInsets.only(top: 100.h),
                child: Column(
                  children: [
                    Align(
                      child: CText(
                        text: LocaleKeys.get_started.tr,
                        fontSize: 18.sp,
                        color: black,
                      ),
                    ),
                    SizedBox(height: 40.h),
                    buildLangButtons(EN),
                    SizedBox(height: 15.h),
                    buildLangButtons(AR),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  CButton buildLangButtons(String lang) {
    return CButton(
      width: Get.width * .62,
      height: 110,
      opacity: 0.9,
      onTap: () {
        controller.changeSelected(lang);
      },
      border: controller.selected == lang
          ? null
          : Border.all(
              width: 1,
              color: borderColor,
            ),
      child: CText(
        color: controller.selected == lang ? primaryColor : black,
        text: lang == AR ? LocaleKeys.arabic.tr : LocaleKeys.english.tr,
        fontWeight: FontWeight.w600,
        fontSize: 17.sp,
      ),
      color: controller.selected == lang ? secondaryColor : Colors.transparent,
    );
  }
}
