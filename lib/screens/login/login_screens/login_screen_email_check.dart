import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../constants/colors.dart';
import '../../../constants/strings.dart';
import '../../../constants/text_styles.dart';
import '../../../widgets/yellow_button.dart';
import '../../../widgets/yellow_close_button.dart';
import '../../onboarding/onboarding_screen.dart';
import '../login_controller.dart';
import '../login_screen.dart';

class LoginCheckYourEmailScreen extends StatelessWidget {
  static const routeName = '/login_screen_email_check';
  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 1,
          backgroundColor: FCColors.white,
          leading: const YellowCloseButton(
            routeName: LoginScreen.routeName,
            routeUntil: OnboardingScreen.routeName,
          ),
          title: Text(
            FAStrings.loginCheckEmail,
            style: FATextStyles.headline,
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Obx(
              () => Column(
                children: [
                  SizedBox(height: 30.h),

                  Text(
                    FAStrings.loginCodeToResetPassword,
                    style: FATextStyles.description,
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 60.h),

                  PinCodeTextField(
                    appContext: context,
                    length: 6,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    keyboardType: TextInputType.number,
                    onChanged: print,
                    onCompleted: (value) => loginController
                      ..resetCode = value
                      ..validateAccount(),
                    cursorColor: FCColors.yellow,
                    textStyle: FATextStyles.codeNumbers,
                    pinTheme: PinTheme(
                        selectedColor: FCColors.gray600,
                        inactiveColor: FCColors.gray600,
                        activeColor: FCColors.gray600),
                  ),

                  /// Next Button
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 30.h),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: YellowButton(
                          text: FAStrings.buttonNext,
                          enabled: loginController.codeVerified,
                          onPressed: loginController.goToNewPassword,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
