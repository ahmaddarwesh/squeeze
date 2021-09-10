import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:squeeze/app/theme/app_colors.dart';
import 'package:squeeze/app/widgets/custom_button.dart';
import 'package:squeeze/app/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

CInfo(
  title,
  info,
) {
  Get.dialog(
    Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CText(
            text: title,
            textAlign: TextAlign.center,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: white,
          ),
          SizedBox(
            height: Get.height * .7,
            width: Get.width * .9,
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: CText(text: info),
            ),
          ),
          CButton(
            width: 40,
            height: 40,
            onTap: () {
              Get.back();
            },
            color: Colors.transparent,
            border: Border.all(width: 0.5, color: white),
            child: Icon(
              Icons.close,
              color: white,
              size: 20,
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    ),
    barrierColor: secondaryColor.withOpacity(0.9),
  );
}

CDialog({text, title, with2Buttons = false, mainText, cancelText, mainOnTap, cancelOnTap}) {
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
