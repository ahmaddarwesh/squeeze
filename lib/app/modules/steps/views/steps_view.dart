import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:squeeze/app/core/constant/remote_constants.dart';
import 'package:squeeze/app/core/logger/logger.dart';
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
      bottomNavigationBar: buildBottomNext(),
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
    List? list;
    if (options.settings![LIST] != null) list = options.settings![LIST] as List;

    return list == null || list == []
        ? Container()
        : buildSection(
            visible: controller.isOptionsSelectItem(options.parentId),
            title: options.name,
            widget: GetBuilder<StepsController>(
              builder: (_) {
                return SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 15),
                    child: Row(
                      children: list!.map((i) {
                        var index = list!.indexOf(i);
                        return buildNormalItem(options.settings!, options.id!, index);
                      }).toList(),
                    ),
                  ),
                );
                // return Container(
                //   height: 63.w,
                //   child: ListView.separated(
                //     padding: EdgeInsets.only(left: 20, right: 20, top: 15),
                //     scrollDirection: Axis.horizontal,
                //     physics: BouncingScrollPhysics(),
                //     itemCount: list.length,
                //     itemBuilder: (BuildContext context, int index) {
                //       return
                //     },
                //     separatorBuilder: (BuildContext context, int index) {
                //       return SizedBox(width: 12);
                //     },
                //   ),
                // );
              },
            ),
          );
  }

  Widget buildIconicSelect(stp.Options options) {
    List list = options.settings![LIST];

    return buildSection(
      visible: controller.isOptionsSelectItem(options.parentId),
      title: options.name,
      widget: GetBuilder<StepsController>(
        builder: (_) => options.settings![SCROLLABLE]
            ? Container(
                height: 115.w,
                child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(left: 20, right: 20, top: 15),
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return buildIconItem(options.settings!, options.id!, index);
                  },
                ))
            : Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 20, right: 20, top: 15),
                child: Wrap(
                  runAlignment: WrapAlignment.start,
                  alignment: WrapAlignment.start,
                  spacing: 7,
                  runSpacing: 7,
                  children: list.map(
                    (e) {
                      var index = list.indexOf(e);
                      return Container(
                        width: 100.w,
                        height: 100.w,
                        child: buildIconItem(options.settings!, options.id!, index),
                      );
                    },
                  ).toList(),
                ),
              ),
      ),
    );
  }

  Widget buildNormalItem(dynamic object, int optionId, index) {
    var isSelected = controller.isSelected(
      optionId,
      object[LIST][index],
      multiSelect: object[MULTI_SELECT] ?? false,
    );
    return Container(
      margin: EdgeInsets.only(right: 13),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () {
          controller.select(
            optionId,
            object[LIST][index],
            multiSelect: object[MULTI_SELECT] ?? false,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: isSelected ? secondaryColor : Colors.grey[300]!,
            ),
            borderRadius: BorderRadius.circular(14),
            color: isSelected ? secondaryColor : null,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: double.parse((object[PADDING][X] ?? 14).toString()),
            vertical: double.parse((object[PADDING][Y] ?? 14).toString()),
          ),
          child: Center(
            child: CText(
              style: GoogleFonts.roboto(
                fontFeatures: [FontFeature.tabularFigures()],
                fontSize: 15.sp,
                color: isSelected ? primaryColor : black,
              ),
              text: object[LIST][index][TEXT].toString(),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildIconItem(dynamic object, int optionId, index) {
    var isSelected = controller.isSelected(
      optionId,
      object[LIST][index],
      multiSelect: object[MULTI_SELECT] ?? false,
    );
    return CButton(
      onTap: () {
        controller.select(
          optionId,
          object[LIST][index],
          multiSelect: object[MULTI_SELECT] ?? false,
        );
      },
      opacity: 0.8,
      color: isSelected ? secondaryColor : null,
      border: Border.all(
        width: 1,
        color: isSelected ? secondaryColor : Colors.grey[300]!,
      ),
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
                height: 1.1,
                text: object[LIST][index][TEXT].toString(),
                color: isSelected ? primaryColor : black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
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
