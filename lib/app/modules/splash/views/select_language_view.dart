import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeze/app/core/constant/app_constants.dart';
import 'package:squeeze/app/modules/splash/controllers/select_language_controller.dart';
import 'package:squeeze/app/theme/app_colors.dart';
import 'package:squeeze/app/widgets/custom_button.dart';
import 'package:squeeze/app/widgets/custom_text.dart';
import 'package:squeeze/app_controller.dart';
import 'package:squeeze/generated/locales.g.dart';

class SelectLanguageView extends GetView<SelectLanguageController> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: Get.mediaQuery.copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: white,
        body: SingleChildScrollView(
          child: Container(
            height: Get.height,
            width: Get.width,
            padding: EdgeInsets.only(right: 30, left: 30, top: 10),
            child: ListView(
              // shrinkWrap: true,
              // crossAxisAlignment: AppController.to.crossAxisAlignment,
              children: [
                SizedBox(height: AppBar().preferredSize.height),
                Container(
                  height: 200,
                  child: Column(
                    crossAxisAlignment: AppController.to.crossAxisAlignment,
                    children: [
                      CText(
                        text: LocaleKeys.find_the_best.tr,
                        fontWeight: FontWeight.w700,
                        fontSize: 37,
                        height: 1.23,
                      ),
                      CText(
                        text: LocaleKeys.services.tr,
                        fontWeight: FontWeight.w700,
                        fontSize: 37,
                        color: secondaryColor,
                        height: 1.23,
                      ),
                      CText(
                        text: LocaleKeys.that_matter_to_you.tr,
                        fontWeight: FontWeight.w700,
                        fontSize: 37,
                        height: 1.23,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 100),
                  child: Column(
                    children: [
                      Align(
                        child: CText(
                          text: LocaleKeys.get_started.tr,
                          fontSize: 19,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 45),
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
                          fontSize: 18,
                        ),
                        color: secondaryColor,
                      ),
                      SizedBox(height: 17),
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
                          fontSize: 18,
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
        ),
      ),
    );
  }
}
