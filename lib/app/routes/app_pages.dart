import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:squeeze/app/modules/account/bindings/account_binding.dart';
import 'package:squeeze/app/modules/account/views/account_view.dart';
import 'package:squeeze/app/modules/home/bindings/home_binding.dart';
import 'package:squeeze/app/modules/home/views/home_view.dart';
import 'package:squeeze/app/modules/map/bindings/map_binding.dart';
import 'package:squeeze/app/modules/map/views/map_view.dart';
import 'package:squeeze/app/modules/splash/bindings/splash_binding.dart';
import 'package:squeeze/app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => MediaQuery(
        data: Get.mediaQuery.copyWith(textScaleFactor: 1.0),
        child: HomeView(),
      ),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => MediaQuery(
        data: Get.mediaQuery.copyWith(textScaleFactor: 1.0),
        child: SplashView(),
      ),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.MAP,
      page: () => MapView(),
      binding: MapBinding(),
      transitionDuration: 250.milliseconds,
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Paths.ACCOUNT,
      page: () => AccountView(),
      binding: AccountBinding(),
    ),
  ];
}
