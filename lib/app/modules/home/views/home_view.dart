import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:squeeze/app/core/logger/logger.dart';
import 'package:squeeze/app/routes/app_pages.dart';
import 'package:squeeze/app/theme/app_colors.dart';
import 'package:squeeze/app/widgets/custom_appbar.dart';
import 'package:squeeze/app/widgets/custom_button.dart';
import 'package:squeeze/app/widgets/custom_text.dart';
import 'package:squeeze/app_controller.dart';
import 'package:squeeze/generated/locales.g.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: Get.mediaQuery.copyWith(textScaleFactor: 1.0),
      child: FittedBox(
        child: Container(
          width: Get.width,
          height: Get.height,
          child: Scaffold(
            backgroundColor: white,
            appBar: appBar(),
            body: ListView(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              shrinkWrap: true,
              children: [
                buildBanner(),
                SizedBox(height: 15),
                buildServices(),
                SizedBox(height: 15),
                howItWorks(),
                SizedBox(height: 10),
                CText(
                  text: LocaleKeys.safe_and_verified_services.tr,
                  textAlign: TextAlign.center,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 11,
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ClipRRect buildBanner() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: Get.width,
        height: 140,
        child: Container(
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                top: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(
                  'assets/images/banner.svg',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: CText(
                    text: LocaleKeys.the_services_you_need.tr,
                    color: secondaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  CAppBar appBar() {
    return CAppBar(
      title: Container(
        constraints: BoxConstraints(
          maxWidth: Get.width * .55,
        ),
        child: CButton(
          onTap: () async {
            await Get.toNamed(Routes.MAP);
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: CText(
                  textAlign: TextAlign.center,
                  text: 'Beirut, Jouneh, Bikaa',
                  overflow: TextOverflow.ellipsis,
                  color: black,
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),
              Icon(
                Entypo.down_open,
                color: Colors.grey[600],
                size: 18,
              )
            ],
          ),
        ),
      ),
      actions: [
        CButton(
          onTap: () {},
          padding: EdgeInsets.only(right: 20),
          child: Icon(
            FontAwesome5.user_circle,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  buildServices() {
    return Container(
      child: Column(
        crossAxisAlignment: AppController.to.crossAxisAlignment,
        children: [
          CText(
            text: LocaleKeys.select_category.tr,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 16.sp,
          ),
          SizedBox(height: 15),
          GridView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 7,
              mainAxisSpacing: 7,
            ),
            children: [
              buildItem(LocaleKeys.standard_cleaning.tr),
              buildItem(LocaleKeys.deep_cleaning.tr),
              buildItem(LocaleKeys.laundry.tr),
              buildItem(LocaleKeys.carpet_sofa_cleaning.tr),
              buildItem(LocaleKeys.car_wash.tr),
              buildItem(LocaleKeys.maintenance.tr),
            ],
          )
        ],
      ),
    );
  }

  buildItem(String title) {
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
                text: title,
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

  howItWorks() {
    return CButton(
      width: Get.width,
      height: 230,
      child: CText(
        text: LocaleKeys.how_it_works.tr,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      color: Colors.grey[200],
      onTap: () {},
    );
  }
}
