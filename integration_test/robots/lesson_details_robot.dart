import 'package:cinnamon_flutter_template_1/constants/keys.dart';
import 'package:cinnamon_flutter_template_1/constants/strings.dart';
import 'package:cinnamon_flutter_template_1/widgets/attachment_card.dart';
import 'package:cinnamon_flutter_template_1/widgets/outlined_gray_button.dart';
import 'package:cinnamon_flutter_template_1/widgets/rating_bar.dart';
import 'package:cinnamon_flutter_template_1/widgets/rating_bar_star.dart';
import 'package:cinnamon_flutter_template_1/widgets/yellow_back_button.dart';
import 'package:cinnamon_flutter_template_1/widgets/yellow_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class LessonDetailsRobot {
  final WidgetTester _tester;

  LessonDetailsRobot(this._tester);

  Future<void> findLessonDetails({bool isPastLesson = false}) async {
    final descriptionTitle = find.text(FAStrings.lessonsDescription);
    final description = find.byKey(FAKeys.lessonDescription);
    final lessonScheduleTitle = find.text(FAStrings.lessonsLessonSchedule);
    final lessonSchedule = find.byType(CustomPaint);
    final locationTitle = find.text(FAStrings.lessonsLocation);
    final location = find.byKey(FAKeys.lessonLocation);
    final dateTitle = find.text(FAStrings.lessonsDate);
    final date = find.byKey(FAKeys.lessonDate);
    final attachmentsTitle = find.text(FAStrings.lessonsAttachments);
    final attachments = find.byType(AttachmentCard);

    expect(descriptionTitle, findsOneWidget);
    expect(description, findsOneWidget);
    expect(lessonScheduleTitle, findsOneWidget);
    expect(lessonSchedule, findsWidgets);
    expect(locationTitle, findsOneWidget);
    expect(location, findsOneWidget);
    expect(dateTitle, findsOneWidget);
    expect(date, findsOneWidget);
    expect(attachmentsTitle, findsOneWidget);
    expect(attachments, findsWidgets);

    if (isPastLesson) {
      final rateLessonTitle = find.text(FAStrings.lessonsRating);
      final ratingBar = find.byType(RatingBar);

      expect(rateLessonTitle, findsOneWidget);
      expect(ratingBar, findsOneWidget);
    } else {
      await findReserveButton();
    }
  }

  Future<void> scrollPageVertically({AxisDirection direction = AxisDirection.up}) async {
    final scrollView = find.byKey(FAKeys.lessonDetailsScrollView);
    final locationTitle = find.text(FAStrings.lessonsLocation);
    final initialPosition = _tester.getCenter(locationTitle);
    final dy = direction == AxisDirection.up ? -500.0 : 500.0;

    await _tester.drag(scrollView, Offset(0, dy));
    await _tester.pump();

    final newPosition = _tester.getCenter(locationTitle);

    expect(newPosition.dy < initialPosition.dy, direction == AxisDirection.up);
  }

  Future<void> rateLesson({required int rating}) async {
    final ratingBar = find.byType(RatingBar);
    final ratingBarStar =
        find.descendant(of: ratingBar, matching: find.byType(RatingBarStar)).at(rating - 1);
    final filledStars = find.descendant(
        of: find.byType(RatingBarStar), matching: find.byKey(FAKeys.lessonStarFilled));
    final emptyStars = find.descendant(
        of: find.byType(RatingBarStar), matching: find.byKey(FAKeys.lessonStarEmpty));

    await _tester.ensureVisible(ratingBar);
    await _tester.tap(ratingBarStar);
    await _tester.pump(const Duration(milliseconds: 500));

    expect(filledStars, findsNWidgets(rating));
    expect(emptyStars, findsNWidgets(5 - rating));
  }

  Future<void> openPdfFile() async {
    final attachmentCard = find.byType(AttachmentCard).at(0);
    final pdfViewer = find.byKey(FAKeys.lessonPdfViewer);

    await _tester.ensureVisible(attachmentCard);
    await _tester.tap(attachmentCard);
    await _tester.pumpAndSettle();

    expect(pdfViewer, findsOneWidget);
  }

  Future<void> goBack() async {
    final yellowBackButton = find.byType(YellowBackButton);

    await _tester.tap(yellowBackButton);
    await _tester.pumpAndSettle();
  }

  Future<void> clickReserveButton() async {
    final reserveButton = find.widgetWithText(YellowButton, FAStrings.buttonReserve);

    await _tester.tap(reserveButton);
    await _tester.pumpAndSettle();
  }

  Future<void> findReservedSeat() async {
    final selectedSeat = find.textContaining(FAStrings.lessonsSelectedSeat);
    final changeButton = find.widgetWithText(OutlinedGrayButton, FAStrings.buttonChange);

    expect(selectedSeat, findsOneWidget);
    expect(changeButton, findsOneWidget);
  }

  Future<void> changeReservation() async {
    final changeButton = find.widgetWithText(OutlinedGrayButton, FAStrings.buttonChange);

    await _tester.tap(changeButton);
    await _tester.pumpAndSettle(const Duration(milliseconds: 500));
  }

  Future<void> findReserveButton() async {
    final reserveButton = find.widgetWithText(YellowButton, FAStrings.buttonReserve);
    expect(reserveButton, findsOneWidget);
  }
}
