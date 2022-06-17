import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/icons.dart';
import '../../constants/strings.dart';
import '../../constants/text_styles.dart';
import '../../widgets/yellow_back_button.dart';
import '../../widgets/yellow_button.dart';
import 'registration_controller.dart';

class RegistrationScreen extends StatelessWidget {
  static const routeName = '/registration_screen';
  final registrationController = Get.find<RegistrationController>();

  @override
  Widget build(BuildContext context) => Scaffold(
    resizeToAvoidBottomInset: false,
    backgroundColor: FCColors.gray100,
    appBar: AppBar(
      elevation: 1,
      centerTitle: true,
      backgroundColor: FCColors.white,
      leading: YellowBackButton(),
      title: Text(
        FAStrings.registrationCreateAccount,
        style: FATextStyles.headline,
      ),
    ),
    body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Obx(
        () => Column(
          children: [
            SizedBox(height: 30.h),

            /// Full Name TextField
            Expanded(
              child: TextField(
                onChanged: (value) => registrationController
                  ..fullName = value
                  ..validateFields(),
                decoration: InputDecoration(
                  labelText: FAStrings.registrationValidationFullName,
                  focusedErrorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: FCColors.red),
                  ),
                  labelStyle: FATextStyles.description,
                  errorText: !registrationController.errorTextFullName
                      ? null
                      : registrationController.fullName.isEmpty
                          ? FAStrings.registrationValidationRequiredField
                          : null,
                  errorStyle: FATextStyles.errorDescription,
                  floatingLabelStyle: TextStyle(height: 0.5.h),
                ),
              ),
            ),

            /// E-mail TextFormField
            Expanded(
              child: TextField(
                onChanged: (value) => registrationController
                  ..email = value
                  ..validateFields(),
                decoration: InputDecoration(
                  focusedErrorBorder:
                      const UnderlineInputBorder(borderSide: BorderSide(color: FCColors.red)),
                  labelText: FAStrings.registrationValidationEmail,
                  labelStyle: FATextStyles.description,
                  errorText: !registrationController.errorTextEmail
                      ? null
                      : registrationController.email.isEmpty
                          ? FAStrings.registrationValidationRequiredField
                          : !registrationController.email.isEmail
                              ? FAStrings.registrationValidationValidEmail
                              : null,
                  errorStyle: FATextStyles.errorDescription,
                  floatingLabelStyle: TextStyle(height: 0.5.h),
                ),
              ),
            ),

            /// Password TextField
            Expanded(
              child: TextField(
                onChanged: (value) => registrationController
                  ..password = value
                  ..validateFields(),
                obscureText: registrationController.obscureText,
                obscuringCharacter: '●',
                decoration: InputDecoration(
                  focusedErrorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: FCColors.red),
                  ),
                  labelText: FAStrings.registrationValidationPassword,
                  labelStyle: FATextStyles.description,
                  errorText: !registrationController.errorTextPassword
                      ? null
                      : registrationController.password.isEmpty
                          ? FAStrings.registrationValidationRequiredField
                          : registrationController.password.length < 6 ||
                                  !registrationController.password.contains(RegExp('[0-9]'))
                              ? FAStrings.registrationValidationShortPassword
                              : null,
                  errorStyle: FATextStyles.errorDescription,
                  errorMaxLines: 2,
                  floatingLabelStyle: TextStyle(height: 0.5.h),
                  suffixIcon: GestureDetector(
                    onTap: registrationController.showPassword,
                    child: Padding(
                      padding: EdgeInsets.all(15.r),
                      child: !registrationController.errorTextPassword
                          ? SvgPicture.asset(FCIcons.eye)
                          : registrationController.password.isEmpty ||
                                  registrationController.password.length < 6 ||
                                  !registrationController.password.contains(RegExp('[0-9]'))
                              ? SvgPicture.asset(FCIcons.warning)
                              : SvgPicture.asset(FCIcons.eye),
                    ),
                  ),
                ),
              ),
            ),

            /// Create Button
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.only(bottom: 30.h),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: YellowButton(
                    text: FAStrings.buttonCreate,
                    enabled: registrationController.validated,
                    onPressed: () => registrationController.validated
                        ? registrationController.signUp()
                        : null,
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
