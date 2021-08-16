import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:get/get.dart';
import 'package:squeeze/app/core/constant/app_constants.dart';
import 'package:squeeze/app/core/logger/logger.dart';
import 'package:squeeze/app/core/sessions/sessions.dart';
import 'package:squeeze/app/modules/splash/controllers/select_language_controller.dart';
import 'package:squeeze/app/theme/app_colors.dart';
import 'package:squeeze/app/widgets/custom_button.dart';
import 'package:squeeze/app/widgets/custom_text.dart';
import 'package:squeeze/app_controller.dart';
import 'package:squeeze/generated/locales.g.dart';

class SelectLanguageView extends GetView<SelectLanguageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: FittedBox(
        child: Container(
          height: Get.height,
          width: Get.width,
          padding: EdgeInsets.only(right: 30, left: 30, top: 80),
          child: Column(
            crossAxisAlignment: AppController.to.crossAxisAlignment,
            children: [
              Expanded(
                flex: 10,
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
              Expanded(
                flex: 23,
                child: Container(
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
                          text: "English",
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
                          text: "Arabic",
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                        color: secondaryColor,
                      ),
                    ],
                  ),
                ),
              )

              // Html(
              //   data:
              //       '<h1 style="font-size:35px"><strong>Find the best <br /></strong><strong><span style="color: #0000ff;">service</span> <br /></strong><strong>that matter to you</strong></h1>',
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
