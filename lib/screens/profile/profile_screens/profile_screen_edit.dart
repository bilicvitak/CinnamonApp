import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../constants/colors.dart';
import '../../../constants/icons.dart';
import '../../../constants/strings.dart';
import '../../../constants/text_styles.dart';
import '../../../widgets/profile_picture_dialog.dart';
import '../../../widgets/yellow_button.dart';
import '../../../widgets/yellow_close_button.dart';
import '../../main_screen.dart';
import '../profile_controller.dart';

class ProfileScreenEdit extends StatelessWidget {
  static const routeName = '/profile_screen_edit';
  final profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 1,
          backgroundColor: FCColors.white,
          leading: const YellowCloseButton(
            routeName: MainScreen.routeName,
            routeUntil: MainScreen.routeName,
          ),
          title: Text(
            FAStrings.profileEditProfile,
            style: FATextStyles.headline,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Obx(
            () => Column(
              children: [
                SizedBox(height: 24.h),
                Expanded(
                  flex: 6,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: 286.w,
                          height: 286.h,
                          color: FCColors.white,
                          child: Center(
                            child: profileController.user.profilePicture != null
                                ? Image.network(
                                    profileController.user.profilePicture!,
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
                      Align(
                        alignment: Alignment.bottomRight,
                        child: FloatingActionButton(
                          ///alert dialog
                          onPressed: () => Get.dialog(
                            ProfilePictureDialog(
                              onPressedCamera: () =>
                                  profileController.uploadPicture(isCamera: true),
                              onPressedGallery: profileController.uploadPicture,
                            ),
                          ),

                          /// choose profile picture button

                          shape: const BeveledRectangleBorder(),
                          backgroundColor: FCColors.yellow,
                          elevation: 0,
                          child: Obx(
                            () => SvgPicture.asset(
                              profileController.profilePictureSet ? FCIcons.edit : FCIcons.add,
                              color: FCColors.gray600,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 24.h),

                /// Full Name TextField
                TextFormField(
                  initialValue: profileController.name,
                  onChanged: (value) => profileController
                    ..name = value
                    ..validateFields(),
                  decoration: InputDecoration(
                    labelText: FAStrings.registrationValidationFullName,
                    focusedErrorBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: FCColors.red),
                    ),
                    labelStyle: FATextStyles.description,
                    errorText: !profileController.errorTextFullName
                        ? null
                        : profileController.name.isEmpty
                            ? FAStrings.registrationValidationRequiredField
                            : null,
                    errorStyle: FATextStyles.errorDescription,
                    floatingLabelStyle: TextStyle(height: 0.5.h),
                  ),
                ),

                const Spacer(),

                /// E-mail TextFormField
                TextFormField(
                  initialValue: profileController.email,
                  onChanged: (value) => profileController
                    ..email = value
                    ..validateFields(),
                  decoration: InputDecoration(
                    focusedErrorBorder:
                        const UnderlineInputBorder(borderSide: BorderSide(color: FCColors.red)),
                    labelText: FAStrings.registrationValidationEmail,
                    labelStyle: FATextStyles.description,
                    errorText: !profileController.errorTextEmail
                        ? null
                        : profileController.email.isEmpty
                            ? FAStrings.registrationValidationRequiredField
                            : !profileController.email.isEmail
                                ? FAStrings.registrationValidationValidEmail
                                : null,
                    errorStyle: FATextStyles.errorDescription,
                    floatingLabelStyle: TextStyle(height: 0.5.h),
                  ),
                ),

                const Spacer(flex: 2),

                /// save button
                Padding(
                  padding: EdgeInsets.only(bottom: 30.h),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: YellowButton(
                      text: FAStrings.buttonSave,
                      onPressed: profileController.updateUserInfo,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
