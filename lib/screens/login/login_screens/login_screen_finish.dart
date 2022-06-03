import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/colors.dart';
import '../../../constants/dependencies.dart';
import '../../../constants/logo.dart';
import '../../../constants/strings.dart';
import '../../../constants/text_styles.dart';
import '../../../widgets/yellow_button.dart';

class LoginFinishScreen extends StatelessWidget {
  static const routeName = '/login_screen_finish';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 1,
          backgroundColor: FCColors.white,
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.h),
            child: SvgPicture.asset(
              FCLogo.fcLogoLine,
              width: 24.r,
              height: 24.r,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                SizedBox(height: 30.h),

                Text(
                  FAStrings.loginSuccessPasswordChange,
                  style: FATextStyles.description,
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 60.h),

                /// Continue Button
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 30.h),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: YellowButton(
                        text: FAStrings.buttonContinue,
                        onPressed: loginController.goToHome,
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
