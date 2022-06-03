import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/strings.dart';
import '../../../constants/text_styles.dart';
import '../../../widgets/yellow_button.dart';
import '../../../widgets/yellow_close_button.dart';
import '../../onboarding/onboarding_screen.dart';
import '../login_controller.dart';
import '../login_screen.dart';

class LoginPasswordResetScreen extends StatelessWidget {
  static const routeName = '/login_password_reset_screen';
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
            FAStrings.loginPasswordReset,
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
                    FAStrings.loginEnterEmail,
                    style: FATextStyles.description,
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 60.h),

                  /// E-mail TextFormField
                  Expanded(
                    child: TextFormField(
                      onChanged: (value) => loginController
                        ..email = value
                        ..validateEmail(),
                      decoration: InputDecoration(
                        focusedErrorBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: FCColors.red,
                        )),
                        labelText: FAStrings.registrationValidationEmail,
                        labelStyle: FATextStyles.description,
                        floatingLabelStyle: TextStyle(height: 0.5.h),
                        errorText: !loginController.errorTextEmail
                            ? null
                            : !loginController.email.isEmail
                                ? FAStrings.registrationValidationValidEmail
                                : null,
                        errorStyle: FATextStyles.errorDescription,
                      ),
                    ),
                  ),

                  /// Next Button
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 30.h),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Obx(
                          () => YellowButton(
                            text: FAStrings.buttonNext,
                            enabled: loginController.validated,
                            onPressed: loginController.sendEmailPasswordReset,
                          ),
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
