import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../constants/text_styles.dart';
import '../constants/strings.dart';
import 'yellow_button.dart';

class ProfilePictureDialog extends StatelessWidget {
  final Function() onPressedCamera;
  final Function() onPressedGallery;

  const ProfilePictureDialog({required this.onPressedCamera, required this.onPressedGallery});

  @override
  Widget build(BuildContext context) => AlertDialog(
        content: SizedBox(
          width: 340.w,
          height: 270.h,
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Text(
                    FAStrings.registrationUploadProfilePicture,
                    style: FATextStyles.headline,
                  ),
                ),
              ),

              /// button gallery
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: YellowButton(
                    text: FAStrings.buttonChooseFromGallery,
                    onPressed: onPressedGallery,
                  ),
                ),
              ),

              /// button camera
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: YellowButton(
                    text: FAStrings.buttonTakePhoto,
                    onPressed: onPressedCamera,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: TextButton(
                    onPressed: Get.back,
                    child: Text(
                      FAStrings.buttonCancel,
                      style: FATextStyles.headline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
