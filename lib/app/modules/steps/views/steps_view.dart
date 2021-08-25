import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';
import 'package:squeeze/app/theme/app_colors.dart';
import 'package:squeeze/app/widgets/custom_button.dart';
import 'package:squeeze/app/widgets/custom_text.dart';
import 'package:squeeze/app/widgets/custom_title_top_bar.dart';

import '../controllers/steps_controller.dart';

class StepsView extends GetView<StepsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CTitleTopBar(
            title: controller.serviceName,
            bottomPadding: 20,
            horizontalPadding: 0,
          ),
          // ListView.builder(
          //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          //   itemCount: 1,
          //   shrinkWrap: true,
          //   itemBuilder: (BuildContext context, int index) {
          //     return buildSection(
          //       Container(),
          //     );
          //   },
          // )
        ],
      ),
    );
  }

  Widget buildIconItem(text) {
    return CButton(
      onTap: () {},
      color: secondaryColor,
      child: Container(
        child: Stack(
          children: [
            Positioned(
              bottom: 15,
              left: 10,
              right: 10,
              child: CText(
                textAlign: TextAlign.center,
                maxLines: 2,
                text: text,
                color: primaryColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildSection(widget) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CText(
              text: "Step name",
              fontWeight: FontWeight.w700,
              fontSize: 14.sp,
              height: 1,
            ),
            SizedBox(width: 8),
            Icon(
              FontAwesome.question_circle_o,
              size: 12,
            )
          ],
        ),
        widget,
      ],
    );
  }
}
