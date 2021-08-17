import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
