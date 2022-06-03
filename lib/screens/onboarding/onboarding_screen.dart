import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/images.dart';
import '../../constants/logo.dart';
import '../../constants/strings.dart';
import '../../constants/text_styles.dart';
import '../../widgets/outlined_gray_button.dart';
import '../../widgets/yellow_button.dart';
import '../login/login_screen.dart';
import '../registration/registration_screen.dart';
import 'onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  static const routeName = '/onboarding_screen';
  final onboardingController = Get.find<OnboardingController>();

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: FCColors.gray100,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: FCColors.white,
          elevation: 1,
          centerTitle: true,
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.h),
            child: SvgPicture.asset(
              FCLogo.fcLogoLine,
              height: 24.h,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.w, 25.h, 20.w, 20.h),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: PageView(
                    onPageChanged: (value) => onboardingController.updatePosition(value.toDouble()),
                    children: [
                      /// First onboarding page
                      Column(
                        children: [
                          SvgPicture.asset(FAImages.lessonAndSchedule),
                          //   SizedBox(height: 30.h),
                          Text(
                            FAStrings.onboardingFirstText,
                            style: FATextStyles.description,
                            textAlign: TextAlign.center,
                          ),
                          //   SizedBox(height: 130.h),
                        ],
                      ),

                      /// Second onboarding page
                      Column(
                        children: [
                          SvgPicture.asset(FAImages.chooseSeat),
                          //  SizedBox(height: 30.h),
                          Text(
                            FAStrings.onboardingSecondText,
                            style: FATextStyles.description,
                            textAlign: TextAlign.center,
                          ),
                          //   SizedBox(height: 130.h),
                        ],
                      ),

                      /// Third onboarding page
                      Column(
                        children: [
                          SvgPicture.asset(FAImages.whiteImage),
                          //  SizedBox(height: 30.h),
                          Text(
                            FAStrings.onboardingThirdText,
                            style: FATextStyles.description,
                            textAlign: TextAlign.center,
                          ),
                          //  SizedBox(height: 130.h),
                        ],
                      ),

                      /// Fourth onboarding page
                      Column(
                        children: [
                          SvgPicture.asset(FAImages.whiteImage),
                          // SizedBox(height: 30.h),
                          Text(
                            FAStrings.onboardingFourthText,
                            style: FATextStyles.description,
                            textAlign: TextAlign.center,
                          ),
                          //SizedBox(height: 130.h),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      /// DotsIndicator:
                      Obx(
                        () => DotsIndicator(
                          dotsCount: onboardingController.numberOfDots,
                          position: onboardingController.currentPosition,
                          decorator: const DotsDecorator(
                            color: FCColors.gray300, // Inactive color
                            activeColor: FCColors.yellow,
                          ),
                        ),
                      ),

                      /// Buttons
                      SizedBox(height: 50.h),
                      YellowButton(
                        text: FAStrings.buttonCreateAccount,
                        onPressed: () => Get.toNamed(RegistrationScreen.routeName),
                      ),
                      SizedBox(height: 20.h),
                      OutlinedGrayButton(
                        width: 340.w,
                        height: 55.h,
                        text: FAStrings.buttonLogIn,
                        onPressed: () => Get.toNamed(LoginScreen.routeName),
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
