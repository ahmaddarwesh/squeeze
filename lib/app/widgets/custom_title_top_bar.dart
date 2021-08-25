import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:get/get.dart';
import 'package:squeeze/app/theme/app_colors.dart';
import 'package:squeeze/app/widgets/custom_text.dart';
import 'package:squeeze/app_controller.dart';

class CTitleTopBar extends StatelessWidget {
  final title;
  final Alignment? alignment;
  final double? bottomPadding;
  final double? horizontalPadding;

  const CTitleTopBar({
    this.title,
    this.alignment,
    this.bottomPadding,
    this.horizontalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          child: Hero(
            tag: "TitleTopBack",
            transitionOnUserGestures: true,
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                width: 40,
                height: 60,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: AppController.to.isEnglish
                      ? BorderRadius.only(
                          topLeft: Radius.circular(50),
                          bottomLeft: Radius.circular(50),
                        )
                      : BorderRadius.only(
                          bottomRight: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                ),
                child: Icon(
                  AppController.to.isEnglish ? Entypo.left_open_mini : Entypo.right_open_mini,
                  color: black,
                  size: 30.w,
                ),
              ),
            ),
          ),
          top: 60,
          right: AppController.to.isEnglish ? 0 : null,
          left: AppController.to.isEnglish ? null : 0,
        ),
        Container(
          margin: EdgeInsets.only(
            left: horizontalPadding != null
                ? horizontalPadding!
                : AppController.to.isEnglish
                    ? 20
                    : 0,
            right: horizontalPadding != null
                ? horizontalPadding!
                : AppController.to.isEnglish
                    ? 0
                    : 20,
            bottom: bottomPadding ?? 70,
            top: AppBar().preferredSize.height + 20,
          ),
          alignment: alignment ?? Alignment.center,
          child: CText(
            height: 1,
            text: title,
            fontWeight: FontWeight.w700,
            color: secondaryColor,
            fontSize: 17.sp,
          ),
        ),
      ],
    );
  }
}
