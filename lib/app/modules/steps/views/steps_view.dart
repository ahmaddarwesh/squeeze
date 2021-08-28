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
                  bottomPadding: 0,
                  horizontalPadding: 0,
                ),
                GetBuilder<StepsController>(
                  builder: (_) => ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    children: [
                      buildProperty(),
                      Visibility(
                        visible: controller.selectedOption == null,
                        child: Column(
                          children: [
                            SizedBox(height: 200),
                            Center(
                              child: CText(
                                text: "Select Your Property Type",
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      buildRooms(
                        "Number of rooms",
                        controller.list2,
                      ),
                      buildRooms(
                        "Cleaning hours",
                        controller.list3,
                      ),
                      buildRooms(
                        "Cleaning staff",
                        controller.list4,
                      ),
                    ],
                  ),
                )
                // ListView.builder(
                //   padding: EdgeInsets.zero,
                //   itemCount: 1,
                //   shrinkWrap: true,
                //   itemBuilder: (BuildContext context, int index1) {
                //     return buildSection(
                //       title: "Property type",
                //       widget: GetBuilder<StepsController>(
                //         builder: (_) => Container(
                //           height: 125.w,
                //           child: GridView.builder(
                //             padding: EdgeInsets.only(left: 20, right: 20, top: 15),
                //             shrinkWrap: true,
                //             scrollDirection: Axis.horizontal,
                //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //               crossAxisCount: 1,
                //               mainAxisSpacing: 10,
                //             ),
                //             itemCount: 4,
                //             itemBuilder: (BuildContext context, int index) {
                //               return buildIconItem(controller.list[index]);
                //             },
                //           ),
                //         ),
                //       ),
                //     );
                //   },
                // )
              ],
            )
          : Center(
              child: CText(
                text: "Coming soon.",
              ),
            ),
    );
  }

  Widget buildRooms(title, list) {
    return Visibility(
      visible: controller.selectedOption != null,
      child: buildSection(
        title: title,
        widget: GetBuilder<StepsController>(
          builder: (_) => Container(
            height: 62.w,
            child: GridView.builder(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 15,
              ),
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 13,
                childAspectRatio: 1.35,
              ),
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return buildNormalItem(list[index]);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget buildProperty() {
    return buildSection(
      title: "Property type",
      widget: GetBuilder<StepsController>(
        builder: (_) => Container(
          height: 125.w,
          child: GridView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(left: 20, right: 20, top: 15),
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

  Widget buildNormalItem(Options options) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Center(
        child: CText(
          fontSize: 15.sp,
          text: options.name.toString(),
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
                text: option.name!,
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

  Widget buildSection({widget, title}) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(width: 20),
              CText(
                text: title,
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
      ),
    );
  }
}
