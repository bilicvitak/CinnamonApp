import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/strings.dart';
import '../../../constants/text_styles.dart';
import '../../../widgets/tasks_checked_list.dart';
import '../../../widgets/yellow_button.dart';
import '../../../widgets/yellow_close_button.dart';
import '../../main_screen.dart';
import '../profile_controller.dart';

class ProfileScreenGoals extends StatelessWidget {
  static const routeName = '/profile_screen_goals';
  final profileController = Get.find<ProfileController>();

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
            FAStrings.profileEditGoals,
            style: FATextStyles.headline,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24.h),
                child: Text(
                  FAStrings.registrationPickGoals,
                  style: FATextStyles.description,
                  textAlign: TextAlign.center,
                ),
              ),

              /// checkedList
              Obx(
                () => Expanded(
                  child: profileController.goals.isNotEmpty
                      ? const TasksCheckedList(isRegistration: false)
                      : const CircularProgressIndicator(),
                ),
              ),

              /// save button
              Padding(
                padding: EdgeInsets.only(bottom: 30.h),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: YellowButton(
                      text: FAStrings.buttonSave,
                      onPressed: profileController.updateGoals,
                    ),
                  ),
              ),
            ],
          ),
        ),
      );
}
