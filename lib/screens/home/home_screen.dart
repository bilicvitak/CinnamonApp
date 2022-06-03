import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/dependencies.dart';
import '../../constants/icons.dart';
import '../../constants/logo.dart';
import '../../constants/strings.dart';
import '../../constants/text_styles.dart';
import '../../widgets/schedule_painter.dart';
import '../../widgets/upcoming_lesson.dart';
import '../notifications/notifications_screen.dart';
import 'home_controller.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(HomeController());

  @override
  void dispose() {
    Get.delete<HomeController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: FCColors.gray100,
        appBar: AppBar(
          elevation: 1,
          backgroundColor: FCColors.white,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: SvgPicture.asset(
            FCLogo.fcLogoLine,
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: GestureDetector(
                child: SvgPicture.asset(FCIcons.noNotification),
                onTap: () => Get.toNamed(NotificationsScreen.routeName),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(
            top: 24.h,
            right: 16.w,
            bottom: 44.h,
            left: 16.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// text Upcoming
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  FAStrings.homeUpcoming,
                  style: FATextStyles.headline,
                ),
              ),

              /// lesson description
              Obx(
                () => UpcomingLesson(
                  lessonName: homeController.upcomingLesson.lessonName,
                  lessonTime: dashboardController.writeLessonDate(homeController.upcomingLesson),
                ),
              ),

              /// text lesson name
              Text(
                '${homeController.upcomingLesson.lessonName} ${FAStrings.homeLessonNameSchedule}',
                style: FATextStyles.headline,
              ),

              /// blank space
              SizedBox(
                height: 8.h,
              ),

              /// calendar
              Expanded(
                child: Container(
                  color: FCColors.white,
                  child: CustomPaint(
                    painter: SchedulePainter(
                      lessonLecture: homeController.upcomingLecture,
                      lessonCodeLab: homeController.upcomingCodeLab,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
