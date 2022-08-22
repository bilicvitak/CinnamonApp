import 'package:cinnamon_flutter_template_1/constants/keys.dart';
import 'package:cinnamon_flutter_template_1/constants/strings.dart';
import 'package:cinnamon_flutter_template_1/widgets/lesson_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class LessonsRobot {
  final WidgetTester tester;

  LessonsRobot(this.tester);

  Future<void> findUpcomingLessons() async {
    final _upcomingTitle = find.text(FAStrings.homeUpcoming);
    final _upcomingListView = find.byKey(FAKeys.lessonsUpcomingListView);

    expect(_upcomingTitle, findsOneWidget);
    expect(_upcomingListView, findsOneWidget);
  }

  Future<void> findPastLessons() async {
    final _pastTitle = find.text(FAStrings.lessonsPast);
    final _pastListView = find.byKey(FAKeys.lessonsPastListView);

    expect(_pastTitle, findsOneWidget);
    expect(_pastListView, findsOneWidget);
  }

  Future<void> scrollPageVertically({AxisDirection direction = AxisDirection.up}) async {
    final _scrollView = find.byKey(FAKeys.lessonsScrollView);
    final _upcomingListView = find.byKey(FAKeys.lessonsUpcomingListView);
    final _initialPosition = tester.getCenter(_upcomingListView);
    final _dy = direction == AxisDirection.up ? -500.0 : 500.0;

    await tester.drag(_scrollView, Offset(0, _dy));
    await tester.pump();

    final _newPosition = tester.getCenter(_upcomingListView);

    expect(_newPosition.dy < _initialPosition.dy, direction == AxisDirection.up);
  }

  Future<void> clickOnUpcomingLesson() async {
    final _upcomingLessons = find.byKey(FAKeys.lessonsUpcomingListView);
    final _upcomingLesson =
        find.descendant(of: _upcomingLessons, matching: find.byType(LessonCard)).at(1);

    await tester.tap(_upcomingLesson);
    await tester.pumpAndSettle();
  }

  Future<void> clickOnPastLesson() async {
    final _pastLessons = find.byKey(FAKeys.lessonsPastListView);
    final _pastLesson = find.descendant(of: _pastLessons, matching: find.byType(LessonCard)).at(0);

    await tester.tap(_pastLesson);
    await tester.pumpAndSettle();
  }
}
