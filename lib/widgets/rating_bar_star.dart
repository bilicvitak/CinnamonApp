import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../constants/icons.dart';
import '../screens/lesson_details/lesson_details_controller.dart';

class RatingBarStar extends StatelessWidget {
  final lessonDetailsController = Get.find<LessonDetailsController>();
  final int index;

  RatingBarStar({required this.index});

  @override
  Widget build(BuildContext context) => Obx(
        () => GestureDetector(
          onTap: () => lessonDetailsController
            ..rating = index
            ..rateLesson(),
          child: Container(
            margin: EdgeInsets.only(right: 9.w),
            child: index <= lessonDetailsController.rating
                ? SvgPicture.asset(
                    FCIcons.starFilled,
                    color: FCColors.yellow,
                    height: 40.h,
                  )
                : SvgPicture.asset(
                    FCIcons.starEmpty,
                    color: FCColors.yellow,
                    height: 40.h,
                  ),
          ),
        ),
      );
}
