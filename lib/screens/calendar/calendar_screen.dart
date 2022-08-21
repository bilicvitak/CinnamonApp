import 'package:cell_calendar/cell_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/icons.dart';
import '../../constants/keys.dart';
import '../../constants/strings.dart';
import '../../constants/text_styles.dart';
import 'calendar_controller.dart';

class CalendarScreen extends StatefulWidget {
  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late CalendarController calendarController;

  @override
  void initState() {
    super.initState();
    calendarController = Get.put(CalendarController());
  }

  @override
  void dispose() {
    Get.delete<CalendarController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: FCColors.white,
          elevation: 1,
          title: Text(
            FAStrings.calendarCalendar,
            style: FATextStyles.headline,
          ),
        ),
        backgroundColor: FCColors.gray100,
        body: Padding(
          padding: EdgeInsets.only(top: 32.h),
          child: CellCalendar(
            cellCalendarPageController: calendarController.getCellCalendarPageController(),
            dateTextStyle: FATextStyles.calendarNumbers,
            events: calendarController.events,
            todayMarkColor: FCColors.darkerYellow,
            daysOfTheWeekBuilder: (dayIndex) {
              final labels = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
              return Padding(
                padding: EdgeInsets.only(bottom: 14.h),
                child: Text(
                  labels[dayIndex],
                  style: FATextStyles.calendarDays,
                  textAlign: TextAlign.center,
                ),
              );
            },
            monthYearLabelBuilder: (datetime) {
              final year = datetime?.year.toString();
              final month = FAStrings.calendarMonths[datetime?.month ?? 1];
              return Padding(
                padding: EdgeInsets.only(bottom: 32.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      key: FAKeys.calendarSwipeRight,
                      onTap: () => calendarController.previousPage(datetime),
                      child: SvgPicture.asset(
                        FCIcons.chevronLeft,
                        color: FCColors.gray600,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Text(
                        '$month $year',
                        style: FATextStyles.headline,
                      ),
                    ),
                    GestureDetector(
                      key: FAKeys.calendarSwipeLeft,
                      onTap: () => calendarController.nextPage(datetime),
                      child: SvgPicture.asset(
                        FCIcons.chevronRight,
                        color: FCColors.gray600,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      );
}
