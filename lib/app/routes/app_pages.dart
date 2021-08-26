import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

import 'package:squeeze/app/modules/account/bindings/account_binding.dart';
import 'package:squeeze/app/modules/account/views/account_view.dart';
import 'package:squeeze/app/modules/change_language/bindings/change_language_binding.dart';
import 'package:squeeze/app/modules/change_language/views/change_language_view.dart';
import 'package:squeeze/app/modules/home/bindings/home_binding.dart';
import 'package:squeeze/app/modules/home/views/home_view.dart';
import 'package:squeeze/app/modules/login/bindings/login_binding.dart';
import 'package:squeeze/app/modules/login/views/login_view.dart';
import 'package:squeeze/app/modules/map/bindings/map_binding.dart';
import 'package:squeeze/app/modules/map/views/map_view.dart';
import 'package:squeeze/app/modules/profile/bindings/profile_binding.dart';
import 'package:squeeze/app/modules/profile/views/profile_view.dart';
import 'package:squeeze/app/modules/register/bindings/register_binding.dart';
import 'package:squeeze/app/modules/register/views/register_view.dart';
import 'package:squeeze/app/modules/splash/bindings/splash_binding.dart';
import 'package:squeeze/app/modules/splash/views/splash_view.dart';
import 'package:squeeze/app/modules/steps/bindings/steps_binding.dart';
import 'package:squeeze/app/modules/steps/views/steps_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
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
    GetPage(
      name: _Paths.CHANGE_LANGUAGE,
      page: () => ChangeLanguageView(),
      binding: ChangeLanguageBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.STEPS,
      page: () => StepsView(),
      binding: StepsBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
