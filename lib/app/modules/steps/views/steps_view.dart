import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';
import 'package:squeeze/app/data/models/step_model.dart';
import 'package:squeeze/app/theme/app_colors.dart';
import 'package:squeeze/app/widgets/custom_button.dart';
import 'package:squeeze/app/widgets/custom_text.dart';
import 'package:squeeze/app/widgets/custom_title_top_bar.dart';

import '../controllers/steps_controller.dart';

class StepsView extends GetView<StepsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.service.id == 1
          ? Column(
              children: [
                CTitleTopBar(
                  title: controller.serviceName,
                  bottomPadding: 10,
                  horizontalPadding: 0,
                ),
                ListView.builder(
                  itemCount: 1,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return buildSection(
                      GetBuilder<StepsController>(
                        builder: (_) => Container(
                          height: 125.w,
                          child: GridView.builder(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 15),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              mainAxisSpacing: 10,
                            ),
                            itemCount: controller.list.length,
                            itemBuilder: (BuildContext context, int index) {
                              return buildIconItem(controller.list[index]);
                            },
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            )
          : Center(
              child: CText(
                text: "Coming soon.",
              ),
            ),
    );
  }

  CButton buildItem(text) {
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
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildIconItem(Options option) {
    return CButton(
      onTap: () {
        controller.selectOption(option);
      },
      color: controller.selectedOption == option ? secondaryColor : null,
      border: Border.all(width: 1, color: Colors.grey[300]!),
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
                text: option.name.toString(),
                color: controller.selectedOption == option ? primaryColor : black,
                fontSize: 14.sp,
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
            SizedBox(width: 20),
            CText(
              text: "Property type",
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
