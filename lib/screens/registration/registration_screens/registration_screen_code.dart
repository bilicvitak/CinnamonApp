import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../constants/colors.dart';
import '../../../constants/strings.dart';
import '../../../constants/text_styles.dart';
import '../../../widgets/email_dialog.dart';
import '../../../widgets/yellow_back_button.dart';
import '../../../widgets/yellow_button.dart';
import '../registration_controller.dart';

class RegistrationScreenCode extends StatelessWidget {
  static const routeName = '/registration_screen_code';
  final registrationController = Get.find<RegistrationController>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: FCColors.white,
          leading: YellowBackButton(),
          title: Text(
            FAStrings.registarionEnterCode,
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

                  /// Column text and TextField
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Text(
                          FAStrings.registrationCodeSent,
                          style: FATextStyles.description,
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: 95.h),

                        ///code verification

                        PinCodeTextField(
                          appContext: context,
                          length: 6,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          onChanged: print,
                          onCompleted: (value) => registrationController
                            ..code = value
                            ..validateAccount(),
                          pinTheme: PinTheme(
                            selectedColor: FCColors.gray600,
                            inactiveColor: FCColors.gray600,
                            activeColor: FCColors.gray600,
                          ),
                          textStyle: FATextStyles.codeNumbers,
                          cursorColor: FCColors.yellow,
                        ),
                      ],
                    ),
                  ),

                  ///Column Text and Button
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: GestureDetector(
                          ///alert dialog
                          onTap: () => Get.dialog(
                            EmailDialog(),
                          ),
                          child: Text(
                            FAStrings.registrationMailNotSent,
                            style: FATextStyles.linkDescription,
                          ),
                        ),
                      ),

                      SizedBox(height: 20.h),

                      /// Next Button
                      Padding(
                        padding: EdgeInsets.only(bottom: 30.h),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: YellowButton(
                            text: FAStrings.buttonNext,
                            enabled: registrationController.codeVerified,
                            onPressed: registrationController.goToProfile,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
