import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttericon/elusive_icons.dart';
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

import '../controllers/account_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountView extends GetView<AccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CAppBar(title: Container()),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: AppController.to.crossAxisAlignment,
          children: [
            buildWelcome(),
            SizedBox(height: 59),
            Divider(),
            buildFindTheBest(),
            SizedBox(height: 60),
            buildLoginSignup(),
            SizedBox(height: 70),
            buildBottomSection(),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.only(bottom: 0),
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

  buildBottomSection() {
    return Container(
      child: Directionality(
        textDirection: AppController.to.textDirection,
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            buildItem(LocaleKeys.language.tr, IC_LANGUAGE,onTap: (){
              AppController.to.changeLanguage();
            }),
            buildItem(LocaleKeys.about_us.tr, IC_INFO),
            buildItem(LocaleKeys.help.tr, IC_QUESTION),
          ],
        ),
      ),
    );
  }

  Widget buildItem(title, icon,{onTap}) {
    return CButton(
      onTap: (){
        if(onTap != null) onTap();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 11),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              height: 13,
              width: 13,
            ),
            SizedBox(width: 14),
            CText(
              text: title,
              fontWeight: FontWeight.w400,
              color: Colors.black,
              fontSize: 14.sp,
            ),
          ],
        ),
      ),
    );
  }
}
