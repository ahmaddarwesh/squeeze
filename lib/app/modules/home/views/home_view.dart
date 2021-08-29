import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:squeeze/app/core/constant/assets_const.dart';
import 'package:squeeze/app/data/models/service_model.dart';
import 'package:squeeze/app/routes/app_pages.dart';
import 'package:squeeze/app/theme/app_colors.dart';
import 'package:squeeze/app/widgets/custom_button.dart';
import 'package:squeeze/app/widgets/custom_text.dart';
import 'package:squeeze/app/widgets/custom_title_top_bar.dart';
import 'package:squeeze/app_controller.dart';
import 'package:squeeze/generated/locales.g.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => MediaQuery(
        data: Get.mediaQuery.copyWith(textScaleFactor: 1.0),
        child: FittedBox(
          child: Container(
            width: Get.width,
            height: Get.height,
            child: controller.services.isEmpty
                ? Scaffold(
                    backgroundColor: white,
                  )
                : Scaffold(
                    backgroundColor: white,
                    appBar: appBar(),
                    body: ListView(
                      padding: EdgeInsets.symmetric(horizontal: 15),
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
                          fontSize: 11.sp,
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
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
        margin: EdgeInsets.only(top: 5),
        height: 150,
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
                    height: AppController.to.isEnglish ? 1.2 : 1.4,
                    text: LocaleKeys.the_services_you_need.tr,
                    color: secondaryColor,
                    fontSize: 16.sp,
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

  // CAppBar appBar() {
  //   return CAppBar(
  //     title: Container(
  //       constraints: BoxConstraints(
  //         maxWidth: Get.width * .70,
  //       ),
  //       child: CButton(
  //         onTap: () async {
  //           await Get.toNamed(Routes.MAP);
  //         },
  //         child: CText(
  //           textAlign: TextAlign.center,
  //           text: 'Jumeirah Beach Residence',
  //           overflow: TextOverflow.ellipsis,
  //           color: black,
  //           fontWeight: FontWeight.w600,
  //           fontSize: 15.sp,
  //         ),
  //       ),
  //     ),
  //     actions: [
  //       CButton(
  //         onTap: () {
  //           Get.toNamed(Routes.ACCOUNT);
  //         },
  //         padding: EdgeInsets.only(right: 20),
  //         child: Container(
  //           width: 18,
  //           height: 18,
  //           child: SvgPicture.asset(IC_MENU),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  buildServices() {
    return Container(
      child: Column(
        crossAxisAlignment: AppController.to.crossAxisAlignment,
        children: [
          CText(
            text: LocaleKeys.select_category.tr,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 15.sp,
          ),
          SizedBox(height: 12),
          GetBuilder<HomeController>(
            builder: (_) => buildGridView(),
          )
        ],
      ),
    );
  }

  PreferredSize appBar() {
    return PreferredSize(
      child: Obx(
        () => CTitleTopBar(
          fontSize: 15.sp,
          title: AppController.to.mainAddress.value,
          textColor: black,
          bottomPadding: 20,
          horizontalPadding: 0,
          onTitleTap: () async {
            await Get.toNamed(Routes.MAP);
          },
          customWidget: CButton(
            onTap: () {
              Get.toNamed(Routes.ACCOUNT);
            },
            child: Container(
              margin: AppController.to.isEnglish
                  ? EdgeInsets.only(right: 20)
                  : EdgeInsets.only(left: 20),
              width: 18,
              height: 18,
              child: SvgPicture.asset(IC_MENU),
            ),
          ),
        ),
      ),
      preferredSize: Size.fromHeight(AppBar().preferredSize.height + 20),
    );
  }

  GridView buildGridView() {
    return GridView.builder(
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 7,
        mainAxisSpacing: 7,
      ),
      itemCount: controller.services.length,
      itemBuilder: (BuildContext context, int index) {
        return buildItem(controller.services[index]);
      },
    );
  }

  buildItem(Service service) {
    return CButton(
      onTap: () {
        controller.onServiceTap(service);
      },
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
                text: AppController.to.isEnglish ? service.name! : service.nameAr!,
                color: primaryColor,
                fontSize: 10.5.sp,
                letterSpacing: 0.2,
                fontWeight: FontWeight.w600,
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
        fontSize: 15.sp,
        fontWeight: FontWeight.w600,
      ),
      color: Colors.grey[200],
      onTap: () {},
    );
  }
}
