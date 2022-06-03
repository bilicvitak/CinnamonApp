import 'package:cell_calendar/cell_calendar.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/dependencies.dart';
import '../../models/lesson/lesson.dart';

class CalendarController extends GetxController {
  /// ------------------------
  /// VARIABLES
  /// ------------------------

  final _events = <CalendarEvent>[].obs;
  final cellCalendarPageController = CellCalendarPageController();

  /// ------------------------
  /// GETTERS
  /// ------------------------

  List<CalendarEvent> get events => _events;

  /// ------------------------
  /// SETTERS
  /// ------------------------

  set events(List<CalendarEvent> value) => _events.assignAll(value);

  /// ------------------------
  /// INIT
  /// ------------------------

  @override
  Future<void> onInit() async {
    super.onInit();
    await sharedFirebaseDataService.getAllLessons();

    _filterLessons();
  }

  void _filterLessons() {
    final lectures = sharedFirebaseDataService.lessons
        .map((lesson) => Lesson(
            lessonName: lesson.lessonDetails!.lectureName,
            lessonStart: lesson.lessonDetails!.lectureStart,
            lessonEnd: lesson.lessonDetails!.lectureEnd))
        .toList();

    final codeLabs = sharedFirebaseDataService.lessons
        .map((lesson) => Lesson(
            lessonName: lesson.lessonDetails!.codeLabName,
            lessonStart: lesson.lessonDetails!.codeLabStart,
            lessonEnd: lesson.lessonDetails!.codeLabEnd))
        .toList();

    events = lectures
        .map((lecture) => CalendarEvent(
            eventID: 1.toString(),
            eventName: lecture.lessonName,
            eventDate: lecture.lessonStart,
            eventBackgroundColor: FCColors.darkPurple))
        .toList()
      ..addAll(codeLabs.map((lecture) => CalendarEvent(
          eventName: lecture.lessonName,
          eventDate: lecture.lessonStart,
          eventBackgroundColor: FCColors.mint)));
  }

  void previousPage(DateTime? datetime) {
    if (datetime != null) {
      cellCalendarPageController.jumpToDate(
        DateTime(
          datetime.year,
          datetime.month - 1,
        ),
      );
    }
  }

  void nextPage(DateTime? datetime) {
    if (datetime != null) {
      cellCalendarPageController.jumpToDate(
        DateTime(
          datetime.year,
          datetime.month + 1,
        ),
      );
    }
  }
}
