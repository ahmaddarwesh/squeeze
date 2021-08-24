import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';
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
          ),
          ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            itemCount: 1,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return buildSection(
                Container(),
              );
            },
          ),
        ],
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
