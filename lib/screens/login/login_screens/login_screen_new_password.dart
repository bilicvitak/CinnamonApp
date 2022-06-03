import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/icons.dart';
import '../../../constants/strings.dart';
import '../../../constants/text_styles.dart';
import '../../../widgets/yellow_button.dart';
import '../../../widgets/yellow_close_button.dart';
import '../../onboarding/onboarding_screen.dart';
import '../login_controller.dart';
import '../login_screen.dart';

class LoginNewPasswordScreen extends StatelessWidget {
  static const routeName = '/login_new_password_screen';
  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
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
                    FAStrings.loginStrongPasswords,
                    style: FATextStyles.description,
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 60.h),

                  /// New Password TextFormField
                  Expanded(
                    child: TextFormField(
                      onChanged: (value) => loginController
                        ..newPassword = value
                        ..errorTextNewPassword = true,
                      obscureText: true,
                      obscuringCharacter: '●',
                      decoration: InputDecoration(
                        focusedErrorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: FCColors.red),
                        ),
                        labelText: FAStrings.loginValidationNewPassword,
                        labelStyle: FATextStyles.description,
                        floatingLabelStyle: TextStyle(height: 0.5.h),
                        errorText: !loginController.errorTextNewPassword
                            ? null
                            : loginController.newPassword.isEmpty
                                ? FAStrings.registrationValidationRequiredField
                                : loginController.newPassword.length < 6 ||
                                        !loginController.newPassword.contains(RegExp('[0-9]'))
                                    ? FAStrings.registrationValidationShortPassword
                                    : null,
                        errorStyle: FATextStyles.errorDescription,
                        errorMaxLines: 2,
                      ),
                    ),
                  ),

                  /// Repeat Password TextFormField
                  Expanded(
                    child: TextFormField(
                      onChanged: (value) => loginController
                        ..repeatNewPassword = value
                        ..errorTextRepeatNewPassword = true,
                      obscureText: true,
                      obscuringCharacter: '●',
                      decoration: InputDecoration(
                        focusedErrorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: FCColors.red),
                        ),
                        labelText: FAStrings.loginValidationRepeatNewButton,
                        labelStyle: FATextStyles.description,
                        errorText: !loginController.errorTextRepeatNewPassword
                            ? null
                            : loginController.repeatNewPassword.isEmpty
                                ? FAStrings.registrationValidationRequiredField
                                : loginController.repeatNewPassword.length < 6 ||
                                        !loginController.repeatNewPassword.contains(RegExp('[0-9]'))
                                    ? FAStrings.registrationValidationShortPassword
                                    : loginController.newPassword !=
                                            loginController.repeatNewPassword
                                        ? FAStrings.loginValidationPasswordMatch
                                        : null,
                        errorStyle: FATextStyles.errorDescription,
                        errorMaxLines: 2,
                        floatingLabelStyle: TextStyle(height: 0.5.h),
                        suffixIcon: Padding(
                          padding: EdgeInsets.all(15.r),
                          child: loginController.errorTextRepeatNewPassword &&
                                  (loginController.repeatNewPassword.isEmpty ||
                                      loginController.repeatNewPassword.length < 6 ||
                                      !loginController.repeatNewPassword
                                          .contains(RegExp('[0-9]')) ||
                                      loginController.newPassword !=
                                          loginController.repeatNewPassword)
                              ? SvgPicture.asset(FCIcons.warning)
                              : null,
                        ),
                      ),
                    ),
                  ),

                  /// Reset Password Button
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 30.h),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: YellowButton(
                          text: FAStrings.buttonResetPassword,
                          enabled: loginController.newPassword.isNotEmpty &&
                              loginController.newPassword == loginController.repeatNewPassword,
                          onPressed: loginController.resetPassword,
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
