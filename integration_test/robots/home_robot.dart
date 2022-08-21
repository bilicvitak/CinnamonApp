import 'package:cinnamon_flutter_template_1/constants/keys.dart';
import 'package:cinnamon_flutter_template_1/constants/strings.dart';
import 'package:cinnamon_flutter_template_1/widgets/white_button.dart';
import 'package:cinnamon_flutter_template_1/widgets/yellow_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class HomeRobot {
  final WidgetTester tester;

  HomeRobot(this.tester);

  Future<void> findUpcomingLesson() async {
    final _upcomingHeadline = find.text(FAStrings.homeUpcoming);
    final _lessonTitle = find.byKey(FAKeys.homeLessonTitle);
    final _lessonTime = find.byKey(FAKeys.homeLessonTime);
    final _scheduleHeadline = find.textContaining(FAStrings.homeLessonNameSchedule);
    final _schedulePainter = find.byType(CustomPaint);
    final _reservedSeat = find.textContaining(FAStrings.lessonsSelectedSeat);

    await tester.pumpAndSettle(const Duration(milliseconds: 500));

    expect(_upcomingHeadline, findsOneWidget);
    expect(_lessonTitle, findsOneWidget);
    expect(_lessonTime, findsOneWidget);
    expect(_reservedSeat, findsNothing);
    expect(_scheduleHeadline, findsOneWidget);
    expect(_schedulePainter, findsWidgets);
  }

  Future<void> goToUpcomingLessonDetails() async {
    final _chevronRight = find.byKey(FAKeys.homeChevronRight);

    await tester.ensureVisible(_chevronRight);
    await tester.tap(_chevronRight);
    await tester.pumpAndSettle();
  }

  Future<void> goBackToHome() async {
    final _yellowBackButton = find.byType(YellowBackButton);

    await tester.ensureVisible(_yellowBackButton);
    await tester.tap(_yellowBackButton);
    await tester.pumpAndSettle();
  }

  Future<void> goToReserveSeat() async {
    final _reserveSeatButton = find.widgetWithText(WhiteButton, FAStrings.buttonReserveSeat);

    await tester.ensureVisible(_reserveSeatButton);
    await tester.tap(_reserveSeatButton);
    await tester.pumpAndSettle();
  }

  Future<void> closeAndGoToHome() async {
    final _closeButton = find.byKey(FAKeys.reservationsClose);

    await tester.ensureVisible(_closeButton);
    await tester.tap(_closeButton);
    await tester.pumpAndSettle();
  }

  Future<void> goToNotifications() async {
    final _notificationsButton = find.byKey(FAKeys.homeNotificationButton);

    await tester.ensureVisible(_notificationsButton);
    await tester.tap(_notificationsButton);
    await tester.pumpAndSettle();
  }
}