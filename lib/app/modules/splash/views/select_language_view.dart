import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeze/app/core/constant/app_constants.dart';
import 'package:squeeze/app/modules/splash/controllers/select_language_controller.dart';
import 'package:squeeze/app/theme/app_colors.dart';
import 'package:squeeze/app/widgets/custom_appbar.dart';
import 'package:squeeze/app/widgets/custom_button.dart';
import 'package:squeeze/app/widgets/custom_text.dart';
import 'package:squeeze/app/widgets/find_the_best.dart';
import 'package:squeeze/app_controller.dart';
import 'package:squeeze/generated/locales.g.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectLanguageView extends GetView<SelectLanguageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CAppBar(title: Container()),
      body: Container(
        padding: EdgeInsets.only(right: 30, left: 30, top: 10),
        child: Column(
          crossAxisAlignment: AppController.to.crossAxisAlignment,
          children: [
            Container(
              child: FindTheBest(),
            ),
            Container(
              margin: EdgeInsets.only(top: 100.h),
              child: Column(
                children: [
                  Align(
                    child: CText(
                      text: LocaleKeys.get_started.tr,
                      fontSize: 19.sp,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 45.h),
                  CButton(
                    width: Get.width * .62,
                    height: 110,
                    onTap: () {
                      controller.selectLanguage(EN);
                    },
                    child: CText(
                      color: primaryColor,
                      text: LocaleKeys.english.tr,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                    ),
                    color: secondaryColor,
                  ),
                  SizedBox(height: 17.h),
                  CButton(
                    width: Get.width * .62,
                    height: 110,
                    onTap: () {
                      controller.selectLanguage(AR);
                    },
                    child: CText(
                      color: primaryColor,
                      text: LocaleKeys.arabic.tr,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                    ),
                    color: secondaryColor,
                  ),
                ],
              ),
            ),
            SizedBox(height: AppBar().preferredSize.height),
          ],
        ),
      ),
    );
  }
}
