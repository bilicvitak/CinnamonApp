import 'package:cinnamon_flutter_template_1/constants/keys.dart';
import 'package:cinnamon_flutter_template_1/constants/strings.dart';
import 'package:cinnamon_flutter_template_1/widgets/attachment_card.dart';
import 'package:cinnamon_flutter_template_1/widgets/outlined_gray_button.dart';
import 'package:cinnamon_flutter_template_1/widgets/rating_bar.dart';
import 'package:cinnamon_flutter_template_1/widgets/rating_bar_star.dart';
import 'package:cinnamon_flutter_template_1/widgets/yellow_back_button.dart';
import 'package:cinnamon_flutter_template_1/widgets/yellow_button.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class LessonDetailsRobot {
  final WidgetTester tester;

  LessonDetailsRobot(this.tester);

  Future<void> findLessonDetails({bool isPastLesson = false}) async {
    final _descriptionTitle = find.text(FAStrings.lessonsDescription);
    final _description = find.byKey(FAKeys.lessonDescription);
    final _lessonScheduleTitle = find.text(FAStrings.lessonsLessonSchedule);
    final _lessonSchedule = find.byType(CustomPaint);
    final _locationTitle = find.text(FAStrings.lessonsLocation);
    final _location = find.byKey(FAKeys.lessonLocation);
    final _dateTitle = find.text(FAStrings.lessonsDate);
    final _date = find.byKey(FAKeys.lessonDate);
    final _attachmentsTitle = find.text(FAStrings.lessonsAttachments);
    final _attachments = find.byType(AttachmentCard);

    expect(_descriptionTitle, findsOneWidget);
    expect(_description, findsOneWidget);
    expect(_lessonScheduleTitle, findsOneWidget);
    expect(_lessonSchedule, findsWidgets);
    expect(_locationTitle, findsOneWidget);
    expect(_location, findsOneWidget);
    expect(_dateTitle, findsOneWidget);
    expect(_date, findsOneWidget);
    expect(_attachmentsTitle, findsOneWidget);
    expect(_attachments, findsWidgets);

    if (isPastLesson) {
      final _rateLessonTitle = find.text(FAStrings.lessonsRating);
      final _ratingBar = find.byType(RatingBar);

      expect(_rateLessonTitle, findsOneWidget);
      expect(_ratingBar, findsOneWidget);
    } else {
      await findReserveButton();
    }
  }

  Future<void> scrollPageVertically({AxisDirection direction = AxisDirection.up}) async {
    final _scrollView = find.byKey(FAKeys.lessonDetailsScrollView);
    final _locationTitle = find.text(FAStrings.lessonsLocation);
    final _initialPosition = tester.getCenter(_locationTitle);
    final _dy = direction == AxisDirection.up ? -500.0 : 500.0;

    await tester.drag(_scrollView, Offset(0, _dy));
    await tester.pump();

    final _newPosition = tester.getCenter(_locationTitle);

    expect(_newPosition.dy < _initialPosition.dy, direction == AxisDirection.up);
  }

  Future<void> rateLesson({required int rating}) async {
    final _ratingBar = find.byType(RatingBar);
    final _ratingBarStar =
        find.descendant(of: _ratingBar, matching: find.byType(RatingBarStar)).at(rating - 1);
    final _filledStars = find.descendant(
        of: find.byType(RatingBarStar), matching: find.byKey(FAKeys.lessonStarFilled));
    final _emptyStars = find.descendant(
        of: find.byType(RatingBarStar), matching: find.byKey(FAKeys.lessonStarEmpty));

    await tester.tap(_ratingBarStar);
    await tester.pump(const Duration(seconds: 1));

    expect(_filledStars, findsNWidgets(rating));
    expect(_emptyStars, findsNWidgets(5 - rating));
  }

  Future<void> openPdfFile() async {
    final _attachmentCard = find.byType(AttachmentCard).at(0);

    await tester.tap(_attachmentCard);
    await tester.pumpAndSettle(const Duration(seconds: 1));

    expect(find.byType(SfPdfViewer), findsOneWidget);
  }

  Future<void> goBack() async {
    final _yellowBackButton = find.byType(YellowBackButton);

    await tester.tap(_yellowBackButton);
    await tester.pumpAndSettle();
  }

  Future<void> clickReserveButton() async {
    final _reserveButton = find.widgetWithText(YellowButton, FAStrings.buttonReserve);

    await tester.tap(_reserveButton);
    await tester.pumpAndSettle();
  }

  Future<void> findReservedSeat() async {
    final _selectedSeat = find.textContaining(FAStrings.lessonsSelectedSeat);
    final _changeButton = find.widgetWithText(OutlinedGrayButton, FAStrings.buttonChange);

    expect(_selectedSeat, findsOneWidget);
    expect(_changeButton, findsOneWidget);
  }

  Future<void> changeReservation() async {
    final _changeButton = find.widgetWithText(OutlinedGrayButton, FAStrings.buttonChange);

    await tester.tap(_changeButton);
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
  }

  Future<void> findReserveButton() async {
    final _reserveButton = find.widgetWithText(YellowButton, FAStrings.buttonReserve);
    expect(_reserveButton, findsOneWidget);
  }
}
