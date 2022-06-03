import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/logo.dart';
import 'splash_controller.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/splash_screen';
  final splashController = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            /// First Yellow Container
            Container(
              color: FCColors.yellow,
            ),

            /// White Container
            Obx(
              () => AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInCubic,
                bottom: splashController.whiteContainerHeight,
                child: Container(
                  color: FCColors.white,
                  height: Get.height,
                  width: Get.width,
                ),
              ),
            ),

            /// FA Logo and Text
            Center(
              child: Obx(
                () => AnimatedOpacity(
                  opacity: splashController.logoOpacity,
                  duration: const Duration(seconds: 1),
                  child: Obx(
                    () => AnimatedSlide(
                      offset: Offset(splashController.textSlide, 0),
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.ease,
                      child: SvgPicture.asset(
                        FCLogo.fcLogoFull,
                        height: 56.h,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            /// Last Yellow Container
            Obx(
              () => AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInCubic,
                bottom: splashController.yellowContainerHeight,
                child: Container(
                  color: FCColors.yellow,
                  height: Get.height,
                  width: Get.width,
                ),
              ),
            ),
          ],
        ),
      );
}
