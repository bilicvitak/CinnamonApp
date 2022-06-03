import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/text_styles.dart';
import '../models/lesson/lesson.dart';

class SchedulePainter extends CustomPainter {
  final Lesson lessonLecture;
  final Lesson lessonCodeLab;

  SchedulePainter({
    required this.lessonLecture,
    required this.lessonCodeLab,
  });

  @override
  void paint(Canvas canvas, Size size) {
    /// variables:

    final width = size.width;
    final height = size.height;

    /// lessons start/end hours and minutes

    final lessonCodeLabStartHour = lessonCodeLab.lessonStart.hour;
    final lessonCodeLabStartMinute = lessonCodeLab.lessonStart.minute;

    final lessonCodeLabEndHour = lessonCodeLab.lessonEnd.hour;
    final lessonCodeLabEndMinute = lessonCodeLab.lessonEnd.minute;

    final lessonLectureStartHour = lessonLecture.lessonStart.hour;
    final lessonLectureStartMinute = lessonLecture.lessonStart.minute;

    final lessonLectureEndHour = lessonLecture.lessonEnd.hour;
    final lessonLectureEndMinute = lessonLecture.lessonEnd.minute;

    /// lecture / code lab duration calculation

    final lectureDuration =
        lessonLectureEndHour.toDouble() - lessonLectureStartHour.toDouble();
    final codeLabDuration =
        lessonCodeLabEndHour.toDouble() - lessonCodeLabStartHour.toDouble();

    final fullClassDuration = (lessonCodeLabEndHour > lessonLectureEndHour)
        ? lessonCodeLabEndHour -
            lessonLectureStartHour // if lecture starts first
        : lessonLectureEndHour -
            lessonCodeLabStartHour; // if code lab starts first

    /// schedule drawing start

    var scheduledTime =
        lessonLectureStartHour.toDouble(); // write time on canvas
    var scheduledTimeString = '';

    /// schedule drawing lines number and gap between the lines

    final canvasTimeLinesNumber =
        2 * fullClassDuration; // number of time lines to be drawn
    final gapBetween =
        (height - 80) / canvasTimeLinesNumber; // gap between the time lines

    /// painters:
    final whiteBox = Paint()..color = FCColors.white; //schedule rectangle
    final lecturePaintOutline = Paint() // lecture schedule border
      ..color = FCColors.mint
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    final codeLabPaintOutline = Paint() // code lab schedule border
      ..color = FCColors.indigo
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    final lectureLeftBorderPaint = Paint() // lecture schedule border left thick
      ..color = FCColors.mint
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;
    final codeLabLeftBorderPaint =
        Paint() // code lab schedule border left thick
          ..color = FCColors.indigo
          ..style = PaintingStyle.stroke
          ..strokeWidth = 8;
    final timeLinePaint = Paint() // time lines
      ..color = FCColors.lightGray
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5;

    /// text:
    ///  -------- Lecture - Title
    final textLecture = TextSpan(
      text: lessonLecture.lessonName,
      style: FATextStyles.headline,
    );


    final textLecturePainter = TextPainter(
      text: textLecture,
      textDirection: TextDirection.ltr,
      maxLines: 2,
      ellipsis: '...',
    )..layout(
        maxWidth: width * 0.4,
      );

    ///  -------- Lecture - Date and Time

    final textLectureTime = TextSpan(
      text: lessonLectureStartMinute > 9
          ? '$lessonLectureStartHour:$lessonLectureStartMinute - $lessonLectureEndHour:$lessonLectureEndMinute'
          : '$lessonLectureStartHour:0$lessonLectureStartMinute - $lessonLectureEndHour:0$lessonLectureEndMinute',
      style: FATextStyles.description,
    );

    final textLectureTimePainter = TextPainter(
      text: textLectureTime,
      textDirection: TextDirection.ltr,
    )..layout(
        maxWidth: width * 0.45,
      );

    ///  -------- Code Lab - Title

    final textCodeLab = TextSpan(
      text: lessonCodeLab.lessonName,
      style: FATextStyles.headline,
    );

    final textCodeLabPainter = TextPainter(
      text: textCodeLab,
      textDirection: TextDirection.ltr,
      maxLines: 2,
      ellipsis: '...',
    )..layout(
        maxWidth: width * 0.45,
      );

    ///  -------- Code Lab - Date and Time

    final textCodeLabTime = TextSpan(
      text: lessonCodeLabStartMinute > 9
          ? '$lessonCodeLabStartHour:$lessonCodeLabStartMinute - $lessonCodeLabEndHour:$lessonCodeLabEndMinute'
          : '$lessonCodeLabStartHour:0$lessonCodeLabStartMinute - $lessonCodeLabEndHour:0$lessonCodeLabEndMinute',


      style: FATextStyles.description,
    );

    final textCodeLabTimePainter = TextPainter(
      text: textCodeLabTime,
      textDirection: TextDirection.ltr,
    )..layout(
        maxWidth: width * 0.45,
      );

    /// canvas:

    for (var i = 0; i <= canvasTimeLinesNumber; ++i) {
      ///draw time:
      ///------------  text

      if (scheduledTime % 1 == 0) {
        scheduledTimeString = '${scheduledTime.toInt()}:00';
      } else {
        scheduledTimeString = '${scheduledTime.toInt()}:30';
      }
      scheduledTime += 0.5;

      final textSpan = TextSpan(
        text: scheduledTimeString,
        style: FATextStyles.description,
      );

      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      )..layout(
          maxWidth: width ,
        );

      /// ------------ lines

      canvas.drawLine(Offset(60, 40 + i.toDouble() * gapBetween),
          Offset(width - 20, 40 + i.toDouble() * gapBetween), timeLinePaint);
      textPainter.paint(canvas, Offset(15, 20 + i.toDouble() * gapBetween));
    }

    canvas

      /// lecture rectangle
      ..drawRect(
          const Offset(80, 40) & Size(200, lectureDuration * 2 * gapBetween),
          whiteBox)
      ..drawRect(
          const Offset(80, 40) & Size(200, lectureDuration * 2 * gapBetween),
          lecturePaintOutline)
      ..drawLine(
          const Offset(80, 39),
          Offset(80, 41 + lectureDuration * 2 * gapBetween),
          lectureLeftBorderPaint)

      /// code lab rectangle
      ..drawRect(
          Offset(120, 40 + lectureDuration * 2 * gapBetween) &
              Size(200, codeLabDuration * 2 * gapBetween),
          whiteBox)
      ..drawRect(
          Offset(120, 40 + lectureDuration * 2 * gapBetween) &
              Size(200, codeLabDuration * 2 * gapBetween),
          codeLabPaintOutline)
      ..drawLine(
          Offset(120, 39 + lectureDuration * 2 * gapBetween),
          Offset(
              120,
              41 +
                  lectureDuration * 2 * gapBetween +
                  codeLabDuration * 2 * gapBetween),
          codeLabLeftBorderPaint);

    /// text: lecture and code lab
    textLecturePainter.paint(canvas, Offset(100, 40 + gapBetween / 2));
    textLectureTimePainter.paint(canvas, Offset(100, textLecturePainter.height + 35 + gapBetween / 2));
    textCodeLabPainter.paint(
        canvas, Offset(140, 70 + lectureDuration * 2 * gapBetween));
    textCodeLabTimePainter.paint(
        canvas, Offset(140, textCodeLabPainter.height + 65 + lectureDuration * 2 * gapBetween));
  }

  @override
  bool shouldRepaint(CustomPainter oldDeligate) => true;
}
