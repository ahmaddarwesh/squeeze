import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';
import 'package:squeeze/app/core/constant/assets_const.dart';
import 'package:squeeze/app/theme/app_colors.dart';
import 'package:squeeze/app/widgets/custom_appbar.dart';
import 'package:squeeze/app/widgets/custom_button.dart';
import 'package:squeeze/app/widgets/custom_text.dart';
import 'package:squeeze/app/widgets/find_the_best.dart';
import 'package:squeeze/app_controller.dart';
import 'package:squeeze/generated/locales.g.dart';
import 'package:supercharged/supercharged.dart';
import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CAppBar(title: Container()),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            AppController.to.isAuth
                ? Column(
                    crossAxisAlignment: AppController.to.crossAxisAlignment,
                    children: [
                      buildWelcome(),
                      SizedBox(height: 59),
                      Divider(),
                      buildFindTheBest(),
                      SizedBox(height: 60),
                      buildLoginSignup(),
                      SizedBox(height: 70),
                    ],
                  )
                : Column(
                    children: [
                      buildGoodMorning(),
                      Divider(),
                    ],
                  ),
            buildAuthOptions(),
            SizedBox(height: 100),
            buildBottomSection(),
          ],
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

  Align buildLoginSignup() {
    return Align(
      child: CButton(
        height: 38,
        color: secondaryColor,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: CText(
          text: LocaleKeys.login_signup.tr,
          fontSize: 16.sp,
          color: primaryColor,
        ),
        onTap: () {},
      ),
    );
  }

  Container buildFindTheBest() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
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
      child: Directionality(
        textDirection: AppController.to.textDirection,
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            buildItem(LocaleKeys.language.tr, IC_LANGUAGE, onTap: () {
              AppController.to.changeLanguage();
            }),
            buildItem(LocaleKeys.about_us.tr, IC_INFO),
            buildItem(LocaleKeys.help.tr, IC_QUESTION),
          ],
        ),
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
              color: Colors.black,
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
          children: [
            CText(
              text: "Good morning,\nAhmad",
              fontSize: 18.sp,
              height: 1.1,
              color: secondaryColor,
              fontWeight: FontWeight.w700,
            ),
            SvgPicture.asset(
              IC_MOON,
              width: 40,
              height: 40,
            ),
          ],
        ),
        SizedBox(height: 7),
        CText(
          text: LocaleKeys.find_the_best.tr +
              " " +
              LocaleKeys.services.tr +
              " " +
              LocaleKeys.that_matter_to_you.tr.replaceAll('\n', "") +
              ".",
          maxLines: 1,
        )
      ],
    );
  }

  buildAuthOptions() {
    return Container(
      child: Directionality(
        textDirection: AppController.to.textDirection,
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            buildItem("Profile", IC_PROFILE),
            buildItem("Wallet", IC_WALLET),
            buildItem("My Booking", IC_MY_BOOKING),
            buildItem("Addresses", IC_ADDRESSES),
          ],
        ),
      ),
    );
  }
}
