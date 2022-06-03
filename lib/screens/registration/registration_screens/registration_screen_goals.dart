import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/strings.dart';
import '../../../constants/text_styles.dart';
import '../../../widgets/tasks_checked_list.dart';
import '../../../widgets/yellow_back_button.dart';
import '../../../widgets/yellow_button.dart';
import '../registration_controller.dart';

class RegistrationScreenGoals extends StatelessWidget {
  static const routeName = '/registration_screen_goals';
  final registrationController = Get.find<RegistrationController>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 1,
          backgroundColor: FCColors.white,
          leading: YellowBackButton(),
          title: Text(
            FAStrings.registrationGoals,
            style: FATextStyles.headline,
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 25.h),
                  child: Text(
                    FAStrings.registrationPickGoals,
                    style: FATextStyles.description,
                    textAlign: TextAlign.center,
                  ),
                ),

                /// checkedList
                Obx(
                  () => Expanded(
                    child: registrationController.goals.isNotEmpty
                        ? const TasksCheckedList(isRegistration: true)
                        : const CircularProgressIndicator(),
                  ),
                ),

                /// next button
                Padding(
                  padding: EdgeInsets.only(bottom: 30.h),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Obx(
                      () => YellowButton(
                        text: FAStrings.buttonNext,
                        enabled: registrationController.tasksChosen,
                        onPressed: () => registrationController
                          ..setGoals()
                          ..goToNotifications(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
