import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'constants/dependencies.dart';
import 'global_binding.dart';
import 'pages.dart';
import 'screens/registration/registration_screens/registration_screen_notifications.dart';
import 'screens/splash/splash_screen.dart';
import 'services/alice_service.dart';
import 'services/firebase_service.dart';
import 'services/logger_service.dart';
import 'services/shared_firebase_data_service.dart';
import 'theme.dart';
import 'translations.dart';

Future<void> main() async {
  await GetStorage.init();
  await Firebase.initializeApp();
  Get
    ..put(AliceService())
    ..put(LoggerService())
    ..put(SharedFirebaseDataService())
    ..put(FirebaseService());
  runApp(FlutterAcademy());
}

class FlutterAcademy extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (child) => GetMaterialApp(
          title: 'appName'.tr,
          navigatorKey: aliceService.alice.getNavigatorKey(),
          theme: theme,
          initialBinding: GlobalBinding(),
          initialRoute: SplashScreen.routeName,
          translations: FATranslations(),
          locale: Get.deviceLocale,
          fallbackLocale: const Locale('en_US'),
          getPages: pages,
          debugShowCheckedModeBanner: false,
        ),
      );
}
