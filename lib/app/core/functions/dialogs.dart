import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeze/app/theme/app_colors.dart';
import 'package:squeeze/app/widgets/custom_button.dart';
import 'package:squeeze/app/widgets/custom_text.dart';

Future showLoading({Duration? duration}) async {
  Get.dialog(
    Align(
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            color: Colors.black,
            strokeWidth: 5,
          ),
        ),
      ),
    ),
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

showInfo({text, title}) {
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
                CButton(
                  width: Get.width,
                  child: CText(
                    text: "Ok",
                    color: primaryColor,
                  ),
                  onTap: () {
                    Get.back();
                  },
                  color: secondaryColor,
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
