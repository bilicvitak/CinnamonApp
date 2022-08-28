import 'package:cinnamon_flutter_template_1/constants/dependencies.dart';
import 'package:cinnamon_flutter_template_1/constants/keys.dart';
import 'package:cinnamon_flutter_template_1/constants/strings.dart';
import 'package:cinnamon_flutter_template_1/widgets/lesson_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class LessonsRobot {
  final WidgetTester _tester;

  LessonsRobot(this._tester);

  Future<void> findUpcomingLessons() async {
    logger.i('[START][LESSONS] findUpcomingLessons');

    final upcomingTitle = find.text(FAStrings.homeUpcoming);
    final upcomingListView = find.byKey(FAKeys.lessonsUpcomingListView);

    await _tester.pump(const Duration(seconds: 1));

    expect(upcomingTitle, findsOneWidget);
    expect(upcomingListView, findsOneWidget);

    logger.i('[FINISH][LESSONS] findUpcomingLessons');
  }

  Future<void> findPastLessons() async {
    logger.i('[START][LESSONS] findPastLessons');

    final pastTitle = find.text(FAStrings.lessonsPast);
    final pastListView = find.byKey(FAKeys.lessonsPastListView);

    await _tester.pump(const Duration(seconds: 1));

    expect(pastTitle, findsOneWidget);
    expect(pastListView, findsOneWidget);

    logger.i('[FINISH][LESSONS] findPastLessons');
  }

  Future<void> scrollPageVertically({AxisDirection direction = AxisDirection.up}) async {
    logger.i('[START][LESSONS] scrollPageVertically');

    final scrollView = find.byKey(FAKeys.lessonsScrollView);
    final upcomingListView = find.byKey(FAKeys.lessonsUpcomingListView);
    final initialPosition = _tester.getCenter(upcomingListView);
    final dy = direction == AxisDirection.up ? -500.0 : 500.0;

    await _tester.drag(scrollView, Offset(0, dy));
    await _tester.pump();

    final newPosition = _tester.getCenter(upcomingListView);

    expect(newPosition.dy < initialPosition.dy, direction == AxisDirection.up);

    logger.i('[FINISH][LESSONS] scrollPageVertically');
  }

  Future<void> clickOnUpcomingLesson() async {
    logger.i('[START][LESSONS] clickOnUpcomingLesson');

    final upcomingLessons = find.byKey(FAKeys.lessonsUpcomingListView);
    final upcomingLesson =
        find.descendant(of: upcomingLessons, matching: find.byType(LessonCard)).at(1);

    await _tester.ensureVisible(upcomingLesson);
    await _tester.pump();

    await _tester.tap(upcomingLesson);
    await _tester.pumpAndSettle();

    logger.i('[FINISH][LESSONS] clickOnUpcomingLesson');
  }

  Future<void> clickOnPastLesson() async {
    logger.i('[START][LESSONS] clickOnPastLesson');

    final pastLessons = find.byKey(FAKeys.lessonsPastListView);
    final pastLesson = find.descendant(of: pastLessons, matching: find.byType(LessonCard)).at(0);

    await _tester.ensureVisible(pastLesson);
    await _tester.pump();

    await _tester.tap(pastLesson);
    await _tester.pumpAndSettle();

    logger.i('[FINISH][LESSONS] clickOnPastLesson');
  }
}
