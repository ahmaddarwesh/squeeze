import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';

import 'package:get/get.dart';
import 'package:squeeze/app/routes/app_pages.dart';
import 'package:squeeze/app/theme/app_colors.dart';
import 'package:squeeze/app/widgets/custom_appbar.dart';
import 'package:squeeze/app/widgets/custom_button.dart';
import 'package:squeeze/app/widgets/custom_text.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: appBar(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        shrinkWrap: true,
        children: [
          Container(
            width: Get.width,
            height: 160,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: primaryColor,
              elevation: 0,
            ),
          )
        ],
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
                  fontSize: 18,
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
          onTap: () async {
            await Get.toNamed(Routes.SPLASH);
          },
          padding: EdgeInsets.only(right: 20),
          child: Icon(
            FontAwesome5.user_circle,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
