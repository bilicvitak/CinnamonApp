import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../constants/icons.dart';
import '../constants/strings.dart';
import '../constants/text_styles.dart';
import '../screens/home/home_controller.dart';
import 'white_button.dart';

class UpcomingLesson extends StatelessWidget {
  final homeController = Get.find<HomeController>();
  final String lessonName;
  final String lessonTime;

  UpcomingLesson({
    required this.lessonName,
    required this.lessonTime,
  });

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.only(top: 10.h, bottom: 24.h),
        color: FCColors.yellow,
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Obx(
            () => Column(
              children: [
                /// Row - lesson name, lesson time, chevron right
                Row(
                  children: [
                    /// Column - lesson name, lesson time
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 271.w,
                          child: Text(
                            lessonName,
                            style: FATextStyles.lessonTitle,
                          ),
                        ),
                        SizedBox(
                          width: 271.w,
                          child: Text(
                            lessonTime,
                            style: FATextStyles.description,
                          ),
                        ),
                      ],
                    ),

                    /// chevron right
                    GestureDetector(
                      onTap: homeController.goToLessonScreenDetails,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: SvgPicture.asset(
                          FCIcons.chevronRight,
                          color: FCColors.gray600,
                        ),
                      ),
                    ),
                  ],
                ),

                /// blank space
                SizedBox(
                  height: 24.h,
                ),

                /// Reserve seat button
                if (homeController.isSeatReserved)
                  Obx(
                    () => Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '${FAStrings.lessonsSelectedSeat} ${homeController.reservedSeat.name}',
                        style: FATextStyles.description,
                      ),
                    ),
                  )
                else
                  WhiteButton(
                    width: double.infinity,
                    height: 40.h,
                    text: FAStrings.buttonReserveSeat,
                    onPressed: homeController.goToLessonScreenReservations,
                  ),
              ],
            ),
          ),
        ),
      );
}
