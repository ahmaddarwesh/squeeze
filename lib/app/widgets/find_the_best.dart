import 'package:flutter/material.dart';
import 'package:squeeze/app/theme/app_colors.dart';
import 'package:squeeze/generated/locales.g.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../app_controller.dart';
import 'custom_text.dart';
import 'package:get/get.dart';

class FindTheBest extends StatelessWidget {
  final fontSize;

  const FindTheBest({Key? key, this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AppController.to.alignment,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CText(
            text: LocaleKeys.find_the_best.tr,
            fontWeight: FontWeight.w700,
            fontSize: fontSize ?? 37.sp,
            height: 1.1,
          ),
          CText(
            text: LocaleKeys.services.tr,
            fontWeight: FontWeight.w700,
            fontSize: fontSize ?? 37.sp,
            color: secondaryColor,
            height: 1.1,
          ),
          CText(
            text: LocaleKeys.that_matter_to_you.tr,
            fontWeight: FontWeight.w700,
            fontSize: fontSize ?? 37.sp,
            height: 1.1,
          ),
        ],
      ),
    );
  }
}
