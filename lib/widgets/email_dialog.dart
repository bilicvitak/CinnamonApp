import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/text_styles.dart';
import '../constants/strings.dart';
import '../screens/registration/registration_controller.dart';
import 'yellow_button.dart';

class EmailDialog extends StatelessWidget {
  final registrationController = Get.find<RegistrationController>();

  @override
  Widget build(BuildContext context) => AlertDialog(
        content: SizedBox(
          width: 340.w,
          height: 270.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Text(
                    FAStrings.registrationMailNotSent,
                    style: FATextStyles.headline,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: YellowButton(
                    text: FAStrings.buttonResendMail,
                    onPressed: registrationController.resendEmail,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: YellowButton(
                    text: FAStrings.buttonUseSMS,
                    onPressed: registrationController.sendSMS,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: TextButton(
                    onPressed: Get.back,
                    child: Text(
                      FAStrings.buttonCancel,
                      style: FATextStyles.headline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
