import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';
import 'package:squeeze/app/core/constant/remote_constants.dart';
import 'package:squeeze/app/data/models/step_model.dart' as stp;
import 'package:squeeze/app/theme/app_colors.dart';
import 'package:squeeze/app/widgets/custom_button.dart';
import 'package:squeeze/app/widgets/custom_text.dart';
import 'package:squeeze/app/widgets/custom_title_top_bar.dart';

import '../controllers/steps_controller.dart';

class StepsView extends GetView<StepsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () {
          return controller.onBackPressed();
        },
        child: controller.service.id != 1
            ? buildComingSoon()
            : GetBuilder<StepsController>(
                builder: (_) => Column(
                  children: [
                    CTitleTopBar(
                      title: controller.serviceName,
                      bottomPadding: 0,
                      horizontalPadding: 0,
                      onBackPressed: () {
                        controller.onBackPressed();
                      },
                    ),
                    Expanded(
                      child: PageView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.steps.length,
                        controller: controller.pageController,
                        itemBuilder: (BuildContext context, int index) {
                          return buildPage(controller.steps[index]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ),
      bottomSheet: buildBottomNext(),
    );
  }

  Center buildComingSoon() {
    return Center(
      child: CText(
        text: "Coming soon.",
      ),
    );
  }

  Widget buildBottomNext() {
    return GetBuilder<StepsController>(
      builder: (_) => Container(
        height: 100.w,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!, width: 1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(13),
            topRight: Radius.circular(13),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CText(text: "Total"),
                CText(
                  text: "AED ${controller.totalValue.toStringAsFixed(2)}",
                  color: secondaryColor,
                  height: 1,
                  fontSize: 18.5.sp,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
            CButton(
              width: 120.w,
              height: 48.w,
              text: "NEXT",
              onTap: () {
                controller.changeStep();
              },
              color: secondaryColor,
              fontWight: FontWeight.w400,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSimpleSelect(stp.Options options) {
    return options.settings![LIST] == null || options.settings![LIST] == []
        ? Container()
        : buildSection(
            visible: controller.isOptionsSelectItem(options.parentId),
            title: options.name,
            widget: GetBuilder<StepsController>(
              builder: (_) {
                return Container(
                  height: 62.w,
                  child: GridView.builder(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 15),
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 13,
                      childAspectRatio: 1.35,
                    ),
                    itemCount: options.settings![LIST].length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildNormalItem(
                        options.settings![LIST][index],
                        options.id!,
                      );
                    },
                  ),
                );
              },
            ),
          );
  }

  Widget buildIconicSelect(stp.Options options) {
    return buildSection(
      visible: controller.isOptionsSelectItem(options.parentId),
      title: options.name,
      widget: GetBuilder<StepsController>(
        builder: (_) => Container(
          height: 125.w,
          child: GridView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(left: 20, right: 20, top: 15),
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 15,
            ),
            itemCount: options.settings![LIST].length,
            itemBuilder: (BuildContext context, int index) {
              return buildIconItem(
                options.settings![LIST][index],
                options.id!,
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildNormalItem(dynamic object, int optionId) {
    return CButton(
      onTap: () {
        controller.select(optionId, object);
      },
      opacity: 0.8,
      color: controller.isSelected(optionId, object) ? secondaryColor : null,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Center(
          child: CText(
            fontSize: 15.sp,
            text: object[TEXT].toString(),
            color: controller.isSelected(optionId, object) ? primaryColor : black,
          ),
        ),
      ),
    );
  }

  Widget buildIconItem(dynamic object, int optionId) {
    return CButton(
      onTap: () {
        controller.select(optionId, object);
      },
      opacity: 0.8,
      color: controller.isSelected(optionId, object) ? secondaryColor : null,
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
                text: object[TEXT].toString(),
                color: controller.isSelected(optionId, object) ? primaryColor : black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildSection({widget, title, visible = true}) {
    return Visibility(
      visible: visible,
      child: Container(
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
      ),
    );
  }

  Widget buildPage(stp.Step step) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: step.options!.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        switch (step.options![index].type) {
          case ICONIC_SELECT:
            {
              return buildIconicSelect(step.options![index]);
            }
          case SIMPLE_SELECT:
            {
              return buildSimpleSelect(step.options![index]);
            }
          default:
            {
              return CText(text: "unknown type ${step.options![index].type}");
            }
        }
      },
    );
  }
}
