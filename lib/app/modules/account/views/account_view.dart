import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:squeeze/app/core/constant/assets_const.dart';
import 'package:squeeze/app/core/functions/dialogs.dart';
import 'package:squeeze/app/core/sessions/sessions.dart';
import 'package:squeeze/app/data/providers/logout_provider.dart';
import 'package:squeeze/app/routes/app_pages.dart';
import 'package:squeeze/app/theme/app_colors.dart';
import 'package:squeeze/app/widgets/custom_button.dart';
import 'package:squeeze/app/widgets/custom_text.dart';
import 'package:squeeze/app/widgets/custom_title_top_bar.dart';
import 'package:squeeze/app/widgets/find_the_best.dart';
import 'package:squeeze/app_controller.dart';
import 'package:squeeze/generated/locales.g.dart';

import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Directionality(
        textDirection: AppController.to.textDirection,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                !AppController.to.isAuth ? buildLoginItems() : buildAuthItems(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.only(bottom: GetPlatform.isAndroid ? 10 : 0),
          child: CText(
            text: LocaleKeys.squeeze_app_version.tr,
            fontSize: 9.sp,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Column buildLoginItems() {
    return Column(
      crossAxisAlignment: AppController.to.crossAxisAlignment,
      children: [
        CTitleTopBar(
          title: LocaleKeys.welcome.tr,
          alignment: AppController.to.alignment,
        ),
        buildFindTheBest(),
        SizedBox(height: 30),
        buildLoginSignup(),
        SizedBox(height: 10),
        buildBottomSection(),
      ],
    );
  }

  Column buildAuthItems() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            CTitleTopBar(
              title: LocaleKeys.good_morning.trArgs(
                [Sessions.read("first", def: "AhmadDar")],
              ),
              alignment: AppController.to.alignment,
            ),
            buildAuthOptions(),
            buildBottomSection(),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 100),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              buildLogout(),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildLogout() {
    return buildItem(
      LocaleKeys.logout.tr,
      IC_LOGOUT,
      onTap: () {
        showInfo(
          text: "Logout from your account?",
          title: "Logout",
          with2Buttons: true,
          mainOnTap: () {
            LogoutProvider.logOut();
            AppController.to.changeIsAuth(false);
            Get.close(2);
          },
          mainText: "Logout",
          cancelText: "Cancel",
        );
      },
    );
  }

  Widget buildLoginSignup() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: CButton(
        height: 48,
        color: secondaryColor,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: CText(
          text: LocaleKeys.login_signup.tr,
          fontSize: 16.sp,
          color: primaryColor,
        ),
        onTap: () {
          Get.toNamed(Routes.REGISTER);
        },
      ),
    );
  }

  Container buildFindTheBest() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: FindTheBest(
        fontSize: 30.sp,
      ),
    );
  }

  Container buildWelcome() {
    return Container(
      alignment: AppController.to.alignment,
      child: CText(
        text: LocaleKeys.welcome.tr,
        color: secondaryColor,
        fontSize: 20.sp,
        height: 1.5,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  //test

  buildBottomSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          buildItem(LocaleKeys.language.tr, IC_LANGUAGE, onTap: () {
            Get.toNamed(Routes.CHANGE_LANGUAGE);
          }),
          buildItem(LocaleKeys.about_us.tr, IC_INFO),
          buildItem(LocaleKeys.help.tr, IC_QUESTION, onTap: () {
            // AppController.to.changeIsAuth(!AppController.to.isAuth);
          }),
        ],
      ),
    );
  }

  Widget buildItem(title, icon, {onTap}) {
    return CButton(
      onTap: () {
        if (onTap != null) onTap();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 11),
        child: Row(
          children: [
            Container(
              height: 16.w,
              width: 16.w,
              child: SvgPicture.asset(icon),
            ),
            SizedBox(width: 14),
            CText(
              text: title,
              fontWeight: FontWeight.w400,
              color: black,
              fontSize: 15.sp,
            ),
          ],
        ),
      ),
    );
  }

  buildGoodMorning() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ),
      ],
    );
  }

  buildAuthOptions() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Directionality(
        textDirection: AppController.to.textDirection,
        child: ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            buildItem(LocaleKeys.profile.tr, IC_PROFILE, onTap: () {
              Get.toNamed(Routes.PROFILE);
            }),
            buildItem(LocaleKeys.wallet.tr, IC_WALLET),
            buildItem(LocaleKeys.my_booking.tr, IC_MY_BOOKING),
            buildItem(LocaleKeys.addresses.tr, IC_ADDRESSES),
          ],
        ),
      ),
    );
  }
}
