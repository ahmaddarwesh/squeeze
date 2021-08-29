import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:squeeze/app/theme/app_colors.dart';
import 'package:squeeze/app/widgets/custom_button.dart';
import 'package:squeeze/app/widgets/custom_text.dart';

Future showLoading({Duration? duration}) async {
  await 50.milliseconds.delay();
  Get.dialog(
    Lottie.asset(
      'assets/animations/loading.json',
    ),
    barrierDismissible: false,
  );
  if (duration != null) {
    await duration.delay();
    Get.back();
  }
}

hideLoading() {
  if (Get.isDialogOpen!) {
    Get.back();
  }
}

showInfo({text, title, with2Buttons = false, mainText, cancelText, mainOnTap, cancelOnTap}) {
  Get.dialog(
    Align(
      child: Container(
        padding: EdgeInsets.all(20),
        height: 200,
        width: Get.width * .7,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Material(
          color: Colors.transparent,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CText(
                  text: title,
                  fontWeight: FontWeight.w500,
                ),
                CText(
                  text: text,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CButton(
                        width: Get.width,
                        child: CText(
                          text: mainText ?? "Ok",
                          color: primaryColor,
                          fontSize: 12,
                        ),
                        onTap: () {
                          if (mainOnTap != null)
                            mainOnTap();
                          else
                            Get.back();
                        },
                        color: secondaryColor,
                      ),
                    ),
                    SizedBox(width: with2Buttons ? 10 : 0),
                    Visibility(
                      visible: with2Buttons,
                      child: Expanded(
                        child: CButton(
                          width: Get.width,
                          child: CText(
                            text: cancelText ?? "Cancel",
                            color: primaryColor,
                            fontSize: 12,
                          ),
                          onTap: () {
                            if (cancelOnTap != null)
                              cancelOnTap();
                            else
                              Get.back();
                          },
                          color: secondaryColor,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
