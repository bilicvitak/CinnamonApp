import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/strings.dart';
import '../../../constants/text_styles.dart';
import '../../../widgets/outlined_gray_button.dart';
import '../../../widgets/yellow_back_button.dart';
import '../../../widgets/yellow_button.dart';
import '../registration_controller.dart';

class RegistrationScreenNotifications extends StatelessWidget {
  static const routeName = '/registration_screen_notifications';
  final registrationController = Get.find<RegistrationController>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 1,
          backgroundColor: FCColors.white,
          leading: YellowBackButton(),
          title: Text(
            FAStrings.registrationNotifications,
            style: FATextStyles.headline,
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                SizedBox(height: 30.h),
                Expanded(
                  child: Text(
                    FAStrings.registrationReminders,
                    style: FATextStyles.description,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 30.h),
                  child: Column(
                    children: [
                      YellowButton(
                        text: FAStrings.buttonAllow,
                        onPressed: registrationController.goToFinish,
                      ),
                      SizedBox(height: 20.h),
                      OutlinedGrayButton(
                        width: 340.w,
                        height: 55.h,
                        text: FAStrings.buttonDontAllow,
                        onPressed: registrationController.goToFinish,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
