import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/icons.dart';
import '../../constants/keys.dart';
import '../../constants/strings.dart';
import '../../constants/text_styles.dart';
import '../../widgets/yellow_back_button.dart';
import '../../widgets/yellow_button.dart';
import 'login_controller.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login_screen';
  late final LoginController loginController;

  LoginScreen({LoginController? controller}) {
    loginController = controller ?? Get.find<LoginController>();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 1,
          backgroundColor: FCColors.white,
          leading: YellowBackButton(),
          title: Text(
            FAStrings.loginLogIn,
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

                  /// E-mail TextFormField
                  Expanded(
                    child: TextFormField(
                      key: FAKeys.loginEmail,
                      onChanged: (value) => loginController
                        ..email = value
                        ..validateLoginFields(),
                      decoration: InputDecoration(
                        focusedErrorBorder:
                            const UnderlineInputBorder(borderSide: BorderSide(color: FCColors.red)),
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

                  /// Password TextFormField
                  Expanded(
                    child: TextFormField(
                      key: FAKeys.loginPassword,
                      onChanged: (value) => loginController
                        ..password = value
                        ..validateLoginFields(),
                      obscureText: loginController.obscureText,
                      obscuringCharacter: '●',
                      decoration: InputDecoration(
                        focusedErrorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: FCColors.red),
                        ),
                        labelText: FAStrings.registrationValidationPassword,
                        labelStyle: FATextStyles.description,
                        errorText: !loginController.errorTextPassword
                            ? null
                            : loginController.password.isEmpty
                                ? FAStrings.registrationValidationRequiredField
                                : loginController.password.length < 6 ||
                                        !loginController.password.contains(RegExp('[0-9]'))
                                    ? FAStrings.registrationValidationShortPassword
                                    : null,
                        errorStyle: FATextStyles.errorDescription,
                        errorMaxLines: 2,
                        floatingLabelStyle: TextStyle(height: 0.5.h),
                        suffixIcon: GestureDetector(
                          key: FAKeys.loginShowPassword,
                          onTap: loginController.showPassword,
                          child: Padding(
                            padding: EdgeInsets.all(15.r),
                            child: SvgPicture.asset(FCIcons.eye),
                          ),
                        ),
                      ),
                    ),
                  ),

                  /// Forgot password text/link
                  GestureDetector(
                    onTap: loginController.goToPasswordReset,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        FAStrings.loginForgotPassword,
                        key: FAKeys.loginForgotPassword,
                        style: FATextStyles.linkDescription,
                      ),
                    ),
                  ),

                  /// Login Button
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 30.h),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: YellowButton(
                          key: FAKeys.loginButton,
                          text: FAStrings.buttonLogIn,
                          enabled: loginController.validated,
                          onPressed: loginController.signIn,
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
