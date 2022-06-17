import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../constants/logo.dart';
import '../../../constants/strings.dart';
import '../../../constants/text_styles.dart';
import '../../../widgets/yellow_button.dart';
import '../registration_controller.dart';

class RegistrationScreenFinish extends StatelessWidget {
  static const routeName = '/registration_screen_finish';
  final registrationController = Get.find<RegistrationController>();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        FCLogo.fcLogoFull,
                        width: 270.w,
                        height: 70.h,
                      ),
                      SizedBox(height: 40.h),
                      Text(
                        FAStrings.registrationFinishIn,
                        style: FATextStyles.description,
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        FAStrings.registrationWelcomeToCFA,
                        style: FATextStyles.description,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 30.h),
                    child: YellowButton(
                      text: FAStrings.buttonStart,
                      onPressed: registrationController.start,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
