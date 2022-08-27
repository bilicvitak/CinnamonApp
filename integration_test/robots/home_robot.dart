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
    final upcomingHeadline = find.text(FAStrings.homeUpcoming);
    final lessonTitle = find.byKey(FAKeys.homeLessonTitle);
    final lessonTime = find.byKey(FAKeys.homeLessonTime);
    final scheduleHeadline = find.textContaining(FAStrings.homeLessonNameSchedule);
    final schedulePainter = find.byType(CustomPaint);
    final reservedSeat = find.textContaining(FAStrings.lessonsSelectedSeat);

    await Future.delayed(const Duration(seconds: 1));

    expect(upcomingHeadline, findsOneWidget);
    expect(lessonTitle, findsOneWidget);
    expect(lessonTime, findsOneWidget);
    expect(reservedSeat, findsNothing);
    expect(scheduleHeadline, findsOneWidget);
    expect(schedulePainter, findsWidgets);
  }

  Future<void> goToUpcomingLessonDetails() async {
    final chevronRight = find.byKey(FAKeys.homeChevronRight);

    await _tester.ensureVisible(chevronRight);
    await _tester.tap(chevronRight);
    await _tester.pumpAndSettle();
  }

  Future<void> goBackToHome() async {
    final yellowBackButton = find.byType(YellowBackButton);

    await _tester.ensureVisible(yellowBackButton);
    await _tester.tap(yellowBackButton);
    await _tester.pumpAndSettle();
  }

  Future<void> goToReserveSeat() async {
    final reserveSeatButton = find.widgetWithText(WhiteButton, FAStrings.buttonReserveSeat);

    await _tester.ensureVisible(reserveSeatButton);
    await _tester.tap(reserveSeatButton);
    await _tester.pumpAndSettle();
  }

  Future<void> closeAndGoToHome() async {
    final closeButton = find.byKey(FAKeys.reservationsClose);

    await _tester.ensureVisible(closeButton);
    await _tester.tap(closeButton);
    await _tester.pumpAndSettle();
  }

  Future<void> goToNotifications() async {
    final notificationsButton = find.byKey(FAKeys.homeNotificationButton);

    await _tester.ensureVisible(notificationsButton);
    await _tester.tap(notificationsButton);
    await _tester.pumpAndSettle(const Duration(milliseconds: 500));
  }
}