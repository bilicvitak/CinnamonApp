import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'constants/dependencies.dart';
import 'global_binding.dart';
import 'pages.dart';
import 'screens/splash/splash_screen.dart';
import 'services/alice_service.dart';
import 'services/firebase_service.dart';
import 'services/logger_service.dart';
import 'services/shared_firebase_data_service.dart';
import 'theme.dart';
import 'translations.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description: 'This channel is used for important notifications.', // description
    importance: Importance.high);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  logger.i('Handling a background message: ${message.messageId}');
}

void _listenPushNotifications() {
  const initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
  const initializationSettingsIOS = IOSInitializationSettings();
  const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
  flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (payload) => {});

  FirebaseMessaging.onMessage.listen((message) {
    final notification = message.notification;
    final android = message.notification?.android;

    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              icon: android.smallIcon,
            ),
          ));
    }
  });
}

Future<void> main() async {
  await GetStorage.init();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  Get
    ..put(AliceService())
    ..put(LoggerService())
    ..put(SharedFirebaseDataService())
    ..put(FirebaseService());

  _listenPushNotifications();

  runApp(FlutterAcademy());
}

class FlutterAcademy extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => GetMaterialApp(
            title: 'appName'.tr,
            navigatorKey: aliceService.alice.getNavigatorKey(),
            theme: theme,
            initialBinding: GlobalBinding(),
            initialRoute: SplashScreen.routeName,
            translations: FATranslations(),
            locale: Get.deviceLocale,
            fallbackLocale: const Locale('en_US'),
            getPages: pages,
            debugShowCheckedModeBanner: false),
      );
}
