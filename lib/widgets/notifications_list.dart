import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../constants/dependencies.dart';
import '../constants/text_styles.dart';
import '../screens/notifications/notifications_controller.dart';
import 'notification_card.dart';

class NotificationsList extends StatelessWidget {
  final notificationsController = Get.find<NotificationsController>();

  @override
  Widget build(BuildContext context) => RefreshIndicator(
        color: FCColors.yellow,
        onRefresh: notificationsController.refreshNotifications,
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: SizedBox(
                height: Get.height,
                child: Obx(
                  () => ListView.builder(
                    physics: const ScrollPhysics(),
                    itemCount: sharedFirebaseDataService.notifications.length,
                    itemBuilder: (context, index) => NotificationCard(
                      index: index,
                      notification: sharedFirebaseDataService.notifications[index],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
