import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../screens/profile/profile_controller.dart';
import '../screens/registration/registration_controller.dart';

class TasksCheckedList extends StatelessWidget {
  final bool isRegistration;

  const TasksCheckedList({required this.isRegistration});

  @override
  Widget build(BuildContext context) {
    if (isRegistration) {
      final registrationController = Get.find<RegistrationController>();

      return ListView.builder(
        itemCount: registrationController.goals.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Obx(
            () => Container(
              decoration: BoxDecoration(
                color: FCColors.white,
                border: registrationController.goals[index].isChecked
                    ? Border.all(color: FCColors.yellow)
                    : Border.all(color: FCColors.white),
              ),
              child: CheckboxListTile(
                activeColor: FCColors.yellow,
                value: registrationController.goals[index].isChecked,
                onChanged: (value) => registrationController.changeCheckbox(value ?? false, index),
                title: Text(
                  registrationController.goals[index].name,
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      final profileController = Get.find<ProfileController>();

      return ListView.builder(
        itemCount: profileController.goals.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Obx(
            () => Container(
              decoration: BoxDecoration(
                color: FCColors.white,
                border: profileController.goals[index].isChecked
                    ? Border.all(color: FCColors.yellow)
                    : Border.all(color: FCColors.white),
              ),
              child: CheckboxListTile(
                activeColor: FCColors.yellow,
                value: profileController.goals[index].isChecked,
                onChanged: (value) => profileController.changeCheckbox(value ?? false, index),
                title: Text(
                  profileController.goals[index].name,
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}
