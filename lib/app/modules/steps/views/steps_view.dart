import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';
import 'package:squeeze/app/core/constant/remote_constants.dart';
import 'package:squeeze/app/core/functions/dialogs.dart';
import 'package:squeeze/app/data/models/step_model.dart' as stp;
import 'package:squeeze/app/theme/app_colors.dart';
import 'package:squeeze/app/widgets/custom_button.dart';
import 'package:squeeze/app/widgets/custom_text.dart';
import 'package:squeeze/app/widgets/custom_text_field.dart';
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

  Widget buildComingSoon() {
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
              text: controller.currentStep == controller.steps.length - 1 ? "Confirm" : "NEXT",
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

  Widget buildSimpleSelect(stp.Options options, {isPayment = false}) {
    List list = options.settings![LIST] ?? [];

    return buildSection(
      visible: list.isNotEmpty && controller.isOptionsSelectItem(options.parentId),
      title: options.name,
      showInfo: () {
        CInfo(options.name, options.description.toString());
      },
      widget: GetBuilder<StepsController>(
        builder: (_) {
          return SizedBox(
            height: 60.w,
            child: ListView.separated(
              padding: EdgeInsets.only(left: 15, right: 15, top: 15),
              physics: BouncingScrollPhysics(),
              itemCount: list.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return buildNormalItem(options.settings!, options.id!, index);
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 10);
              },
            ),
          );
        },
      ),
    );
  }

  Widget buildNumberSelect(stp.Options options, {isDate = false}) {
    List list = options.settings![LIST] ?? [];

    return buildSection(
      showInfo: () {
        CInfo(options.name, options.description.toString());
      },
      visible: list.isNotEmpty && controller.isOptionsSelectItem(options.parentId),
      title: options.name,
      widget: GetBuilder<StepsController>(
        builder: (_) {
          return SizedBox(
            height: 62.w,
            child: GridView.builder(
              padding: EdgeInsets.only(left: 20, right: 20, top: 15),
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 11,
                childAspectRatio: 1.23,
              ),
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return buildNumberItem(options.settings!, options.id!, index, isDate: isDate);
              },
            ),
          );
        },
      ),
    );
  }

  Widget buildIconicSelect(stp.Options options) {
    List list = options.settings![LIST] ?? [];
    return buildSection(
      showInfo: () {
        CInfo(options.name, options.description.toString());
      },
      visible: list.isNotEmpty && controller.isOptionsSelectItem(options.parentId),
      title: options.name,
      widget: GetBuilder<StepsController>(
        builder: (_) => options.settings![SCROLLABLE]
            ? SizedBox(
                height: 115.w,
                child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return buildIconItem(options.settings!, options.id!, index);
                  },
                ),
              )
            : SizedBox(
                height: 235.w,
                child: GridView.builder(
                  itemCount: list.length,
                  padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                  itemBuilder: (BuildContext context, int index) {
                    return buildIconItem(options.settings!, options.id!, index);
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 7,
                    mainAxisSpacing: 7,
                  ),
                ),
              ),
      ),
    );
  }

  Widget buildAddress(stp.Options options) {
    List list = options.settings![LIST] ?? [];
    return buildSection(
      showInfo: () {
        CInfo(options.name, options.description.toString());
      },
      visible: list.isNotEmpty && controller.isOptionsSelectItem(options.parentId),
      title: options.name,
      widget: SizedBox(
        height: 140.w,
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(left: 15, right: 15, top: 15),
          itemCount: list.length + 1,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            if (index == list.length) {
              return CButton(
                onTap: () {},
                child: Container(
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 1, color: Colors.grey[300]!),
                  ),
                  child: Center(
                    child: Icon(
                      FontAwesome5.plus,
                      size: 18,
                      color: Colors.grey,
                    ),
                  ),
                ),
              );
            }
            return buildAddressItem(options.settings!, options.id!, index);
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(width: 15);
          },
        ),
      ),
    );
  }

  Widget buildAddressItem(dynamic object, int optionId, index) {
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
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: isSelected ? secondaryColor : Colors.grey[300]!,
          ),
          borderRadius: BorderRadius.circular(14),
          color: isSelected ? secondaryColor : null,
        ),
        width: 260.w,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CText(
              color: isSelected ? white : black,
              text: object[LIST][index][TEXT],
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 10),
            CText(
              color: isSelected ? white : black,
              text: "JBR\nBahar6/3702\nDubai",
              fontSize: 14.sp,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextArea(stp.Options options) {
    List list = options.settings![LIST] ?? [];
    return buildSection(
      showInfo: () {
        CInfo(options.name, options.description.toString());
      },
      visible: list.isNotEmpty && controller.isOptionsSelectItem(options.parentId),
      title: options.name,
      widget: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, top: 15),
        child: CTextField(
          maxLine: 5,
          hint: "Please let us know if there are any special instructions.",
        ),
      ),
    );
  }

  Widget buildPaymentMethod(stp.Options options) {
    List list = options.settings![LIST] ?? [];
    return buildSection(
      visible: list.isNotEmpty && controller.isOptionsSelectItem(options.parentId),
      title: options.name,
      widget: Container(),
    );
  }

  Widget buildNormalItem(dynamic object, int optionId, index) {
    var isSelected = controller.isSelected(
      optionId,
      object[LIST][index],
      multiSelect: object[MULTI_SELECT] ?? false,
    );
    return SizedBox(
      width: 120.w,
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
          child: Center(
            child: CText(
              fontSize: 14.sp,
              color: isSelected ? primaryColor : black,
              textAlign: TextAlign.center,
              text: object[LIST][index][TEXT].toString(),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildNumberItem(dynamic object, int optionId, index, {isDate = false}) {
    var isSelected = controller.isSelected(
      optionId,
      object[LIST][index],
      multiSelect: object[MULTI_SELECT] ?? false,
    );

    return CButton(
      radius: 14,
      opacity: 0.8,
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
        alignment: Alignment.center,
        child: CText(
          textAlign: TextAlign.center,
          fontSize: isDate ? 13.sp : 15.sp,
          height: 1.4,
          color: isSelected ? primaryColor : black,
          text: isDate
              ? object[LIST][index][TEXT].toString().replaceAll(' ', '\n')
              : object[LIST][index][TEXT].toString(),
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
    );
  }

  Widget buildSection({widget, title, visible = true, showInfo}) {
    return Visibility(
      visible: visible,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(width: 15),
              CText(
                text: title,
                fontWeight: FontWeight.w700,
                fontSize: 14.sp,
                height: 1,
              ),
              SizedBox(width: 8),
              InkWell(
                onTap: () {
                  if (showInfo != null) showInfo();
                },
                child: Icon(
                  FontAwesome.question_circle_o,
                  size: 12,
                ),
              )
            ],
          ),
          widget,
          SizedBox(height: 23),
        ],
      ),
    );
  }

  Widget buildPage(stp.Step step) {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 50, top: 20),
      physics: BouncingScrollPhysics(),
      itemCount: step.options!.length,
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
          case NUMBER_SELECT:
            {
              return buildNumberSelect(step.options![index]);
            }
          case DATE_SELECT:
            {
              return buildNumberSelect(step.options![index], isDate: true);
            }
          case ADDRESS_MODEL:
            {
              return buildAddress(step.options![index]);
            }
          case PAYMENT_METHOD:
            {
              return buildSimpleSelect(step.options![index], isPayment: true);
            }
          case TEXTAREA:
            {
              return buildTextArea(step.options![index]);
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
