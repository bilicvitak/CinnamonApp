import 'package:cinnamon_flutter_template_1/constants/dependencies.dart';
import 'package:cinnamon_flutter_template_1/constants/keys.dart';
import 'package:cinnamon_flutter_template_1/constants/strings.dart';
import 'package:cinnamon_flutter_template_1/widgets/white_button.dart';
import 'package:cinnamon_flutter_template_1/widgets/yellow_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class HomeRobot {
  final WidgetTester _tester;

  HomeRobot(this._tester);

  Future<void> findUpcomingLesson() async {
    logger.i('[START][HOME] findUpcomingLesson');

    final upcomingHeadline = find.text(FAStrings.homeUpcoming);
    final lessonTitle = find.byKey(FAKeys.homeLessonTitle);
    final lessonTime = find.byKey(FAKeys.homeLessonTime);
    final scheduleHeadline = find.textContaining(FAStrings.homeLessonNameSchedule);
    final schedulePainter = find.byType(CustomPaint);
    final reservedSeat = find.textContaining(FAStrings.lessonsSelectedSeat);

    await _tester.pump(const Duration(seconds: 2));

    expect(upcomingHeadline, findsOneWidget);
    expect(lessonTitle, findsOneWidget);
    expect(lessonTime, findsOneWidget);
    expect(reservedSeat, findsNothing);
    expect(scheduleHeadline, findsOneWidget);
    expect(schedulePainter, findsWidgets);

    logger.i('[FINISH][HOME] findUpcomingLesson');
  }

  Future<void> goToUpcomingLessonDetails() async {
    logger.i('[START][HOME] goToUpcomingLessonDetails');

    final chevronRight = find.byKey(FAKeys.homeChevronRight);

    await _tester.ensureVisible(chevronRight);
    await _tester.pump(const Duration(seconds: 1));

    await _tester.tap(chevronRight);
    await _tester.pumpAndSettle();

    logger.i('[FINISH][HOME] goToUpcomingLessonDetails');
  }

  Future<void> goBackToHome() async {
    logger.i('[START][HOME] goBackToHome');

    final yellowBackButton = find.byType(YellowBackButton);

    await _tester.ensureVisible(yellowBackButton);
    await _tester.tap(yellowBackButton);
    await _tester.pumpAndSettle();

    logger.i('[FINISH][HOME] goBackToHome');
  }

  Future<void> goToReserveSeat() async {
    logger.i('[START][HOME] goToReserveSeat');

    final reserveSeatButton = find.widgetWithText(WhiteButton, FAStrings.buttonReserveSeat);

    await _tester.ensureVisible(reserveSeatButton);
    await _tester.tap(reserveSeatButton);
    await _tester.pumpAndSettle();

    logger.i('[FINISH][HOME] goToReserveSeat');
  }

  Future<void> closeAndGoToHome() async {
    logger.i('[START][HOME] closeAndGoToHome');

    final closeButton = find.byKey(FAKeys.reservationsClose);

    await _tester.ensureVisible(closeButton);
    await _tester.tap(closeButton);
    await _tester.pumpAndSettle();

    logger.i('[FINISH][HOME] closeAndGoToHome');
  }

  Future<void> goToNotifications() async {
    logger.i('[START][HOME] goToNotifications');

    final notificationsButton = find.byKey(FAKeys.homeNotificationButton);

    await _tester.ensureVisible(notificationsButton);
    await _tester.tap(notificationsButton);
    await _tester.pumpAndSettle(const Duration(milliseconds: 500));

    logger.i('[FINISH][HOME] goToNotifications');
  }
}
