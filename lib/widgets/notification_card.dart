import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/colors.dart';
import '../constants/dependencies.dart';
import '../constants/icons.dart';
import '../constants/text_styles.dart';
import '../models/notification/notification.dart' as cinnamon_notification;
import '../screens/notifications/notifications_controller.dart';

class NotificationCard extends StatelessWidget {
  final int index;
  final cinnamon_notification.Notification notification;
  final notificationsController = Get.find<NotificationsController>();

  NotificationCard({required this.index, required this.notification});

  @override
  Widget build(BuildContext context) => Dismissible(
        key: Key(notification.hashCode.toString()),
        direction: DismissDirection.endToStart,
        background: Container(
          color: FCColors.red,
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.all(30.r),
            child: SvgPicture.asset(
              FCIcons.delete,
              color: FCColors.white,
            ),
          ),
        ),
        onDismissed: (direction) => notificationsController.updateNotification(index: index),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: notification.isRead ? FCColors.gray100 : FCColors.yellow.withOpacity(0.05),
            border: const Border(
              bottom: BorderSide(color: FCColors.gray200),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notification.title,
                style: FATextStyles.notificationTitle,
              ),
              SizedBox(height: 4.h),
              Text(
                notification.description,
                style: FATextStyles.description,
              ),
            ],
          ),
        ),
      );
}
