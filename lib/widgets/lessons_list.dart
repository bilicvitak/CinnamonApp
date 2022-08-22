import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constants/dependencies.dart';
import '../constants/keys.dart';
import '../constants/strings.dart';
import '../constants/text_styles.dart';
import '../screens/lessons/lessons_controller.dart';
import 'lesson_card.dart';

class LessonsList extends StatelessWidget {
  final lessonsController = Get.find<LessonsController>();

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          key: FAKeys.lessonsScrollView,
          physics: const BouncingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Obx(
              () => Column(
                children: [
                  /// text: Upcoming

                  Padding(
                    padding: EdgeInsets.only(top: 24.w, bottom: 10.h),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        FAStrings.homeUpcoming,
                        style: FATextStyles.headline,
                      ),
                    ),
                  ),

                  /// list: Upcoming lessons

                  ListView.builder(
                    key: FAKeys.lessonsUpcomingListView,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: lessonsController.upcomingLessonsCounter,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: GestureDetector(
                        onTap: () => lessonsController
                          ..selectedLesson = lessonsController.upcomingLessons[index]
                          ..goToLessonScreenDetails(),
                        child: LessonCard(
                          lessonName: lessonsController.upcomingLessons[index].lessonName,
                          lessonDate: dashboardController
                              .writeLessonDate(lessonsController.upcomingLessons[index]),
                        ),
                      ),
                    ),
                  ),

                  /// text: Past

                  Padding(
                    padding: EdgeInsets.only(top: 30.h, bottom: 10.h),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        FAStrings.lessonsPast,
                        style: FATextStyles.headline,
                      ),
                    ),
                  ),

                  /// list: Past lessons

                  ListView.builder(
                    key: FAKeys.lessonsPastListView,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: lessonsController.pastLessonsCounter,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: GestureDetector(
                        onTap: () => lessonsController
                          ..selectedLesson = lessonsController.pastLessons[index]
                          ..goToLessonScreenDetails(),
                        child: LessonCard(
                          lessonName: lessonsController.pastLessons[index].lessonName,
                          lessonDate: dashboardController
                              .writeLessonDate(lessonsController.pastLessons[index]),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
