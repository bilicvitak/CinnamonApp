import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/dependencies.dart';
import '../../../constants/icons.dart';
import '../../../constants/strings.dart';
import '../../../constants/text_styles.dart';
import '../../../widgets/outlined_gray_button.dart';
import '../../../widgets/profile_picture_dialog.dart';
import '../../../widgets/yellow_button.dart';
import '../registration_controller.dart';
import 'registration_screen_goals.dart';

class RegistrationScreenProfilePicture extends StatelessWidget {
  static const routeName = '/registration_screen_profile_picture';
  final registrationController = Get.find<RegistrationController>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 1,
          backgroundColor: FCColors.white,
          automaticallyImplyLeading: false,
          title: Text(
            FAStrings.registrationCompleteProfile,
            style: FATextStyles.headline,
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                SizedBox(height: 30.h),
                Expanded(
                  /// profile picture
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: 286.w,
                          height: 286.h,
                          color: FCColors.white,
                          child: Obx(
                            () => Center(
                              child: firebaseService.urlSet
                                  ? Image.network(
                                      firebaseService.profilePictureUrl,
                                      fit: BoxFit.cover,
                                      width: 286.w,
                                      height: 286.h,
                                    )
                                  : SvgPicture.asset(
                                      FCIcons.profilePicturePlaceholder,
                                      color: FCColors.gray300,
                                      width: 90.w,
                                      height: 120.h,
                                    ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: FloatingActionButton(
                          ///alert dialog
                          onPressed: () => Get.dialog(
                            ProfilePictureDialog(
                              onPressedCamera: () =>
                                  registrationController.uploadPicture(isCamera: true),
                              onPressedGallery: registrationController.uploadPicture,
                            ),
                          ),

                          /// choose profile picture button

                          shape: const BeveledRectangleBorder(),
                          backgroundColor: FCColors.yellow,
                          elevation: 0,
                          child: Obx(
                            () => SvgPicture.asset(
                              registrationController.profilePictureSet ? FCIcons.edit : FCIcons.add,
                              color: FCColors.gray600,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                ///buttons
                Padding(
                  padding: EdgeInsets.only(bottom: 30.h),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      children: [
                        Obx(
                          () => YellowButton(
                            text: FAStrings.buttonNext,
                            enabled: registrationController.profilePictureSet,
                            onPressed: registrationController.goToGoals,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        OutlinedGrayButton(
                          width: 340.w,
                          height: 55.h,
                          text: FAStrings.buttonSkipForNow,
                          onPressed: () => Get.toNamed(RegistrationScreenGoals.routeName),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
