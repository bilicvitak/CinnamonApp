import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/strings.dart';
import '../../constants/text_styles.dart';
import '../../widgets/yellow_close_button.dart';
import '../main_screen.dart';
import 'notifications_controller.dart';

class NotificationsScreen extends StatelessWidget {
  static const routeName = '/notifications_screen';
  final notificationsController = Get.find<NotificationsController>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 1,
          backgroundColor: FCColors.white,
          leading: const YellowCloseButton(
            routeName: MainScreen.routeName,
            routeUntil: MainScreen.routeName,
          ),
          title: Text(
            FAStrings.notificationsNotifications,
            style: FATextStyles.headline,
          ),
        ),
        body: Container(),
      );
}
