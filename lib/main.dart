import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:squeeze/app/core/client/graphql_client.dart';
import 'package:squeeze/app/core/constant/app_constants.dart';
import 'package:squeeze/app/core/sessions/sessions.dart';
import 'package:squeeze/app_controller.dart';
import 'package:squeeze/generated/locales.g.dart';

import 'app/routes/app_pages.dart';
import 'app/theme/app_themes.dart';

void main() async {
  await initHiveForFlutter();
  await GetStorage.init("Squeeze");
  Get.lazyPut(() => AppController(), fenix: true);
  runApp(MyApp());
}

class MyApp extends GetView<AppController> {
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: Client.getClient(),
      child: ScreenUtilInit(
        designSize: Size(360, 690),
        builder: () {
          return GetMaterialApp(
            title: LocaleKeys.app_name,
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            locale: Locale(Sessions.read(LANGUAGE, def: EN)),
            theme: Themes.light,
            debugShowCheckedModeBanner: false,
            translationsKeys: AppTranslation.translations,
            defaultTransition: Transition.rightToLeft,
          );
        },
      ),
    );
  }
}
