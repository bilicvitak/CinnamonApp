import 'package:cell_calendar/cell_calendar.dart';
import 'package:cinnamon_flutter_template_1/constants/colors.dart';
import 'package:cinnamon_flutter_template_1/models/lesson/lesson.dart';
import 'package:cinnamon_flutter_template_1/models/lesson_details/lesson_details.dart';
import 'package:cinnamon_flutter_template_1/screens/calendar/calendar_controller.dart';
import 'package:cinnamon_flutter_template_1/services/shared_firebase_data_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'calendar_controller_test.mocks.dart';

@GenerateMocks([SharedFirebaseDataService])
void main() {
  late CalendarController _calendarController;

  setUp(() {
    _calendarController = CalendarController();
  });

  tearDown(() {
    _calendarController.dispose();
  });

  group('Check calendar events', () {
    test('Calendar events should be empty', () async {
      final mock = MockSharedFirebaseDataService();

      when(mock.lessons).thenReturn([]);

      _calendarController.filterLessons(mock.lessons);

      expect(_calendarController.events, []);
    });

    test('Calendar events should be filtered as lectures and code labs', () async {
      final mock = MockSharedFirebaseDataService();

      when(mock.lessons).thenReturn([
        Lesson(
          lessonName: 'Basics',
          lessonStart: DateTime.fromMillisecondsSinceEpoch(1655737200000),
          lessonEnd: DateTime.fromMillisecondsSinceEpoch(1655744400000),
          lessonDetails: LessonDetails(
            lessonName: 'Basics',
            description:
                'Introductory lesson to Flutter. Learning about the basics, widgets, gestures and navigation.',
            location: 'Slavonska avenija 6, 10000 Zagreb',
            lectureName: 'Basics',
            lectureStart: DateTime.fromMillisecondsSinceEpoch(1655737200000),
            lectureEnd: DateTime.fromMillisecondsSinceEpoch(1655740800000),
            codeLabName: 'Introduction to Flutter',
            codeLabStart: DateTime.fromMillisecondsSinceEpoch(1655740800000),
            codeLabEnd: DateTime.fromMillisecondsSinceEpoch(1655744400000),
            fileUrl: [
              'https://firebasestorage.googleapis.com/v0/b/cinnamonapp-73a64.appspot.com/o/lectures%2Flecture1%2FLanguageTour.pptx.pdf?alt=media&token=a3d2f19c-1acf-43d1-84a2-d642c9c9099b'
            ],
            lessonNumber: 1,
          ),
        ),
      ]);

      _calendarController.filterLessons(mock.lessons);

      expect(_calendarController.events, [
        CalendarEvent(
          eventName: 'Basics',
          eventDate: DateTime.fromMillisecondsSinceEpoch(1655737200000),
          eventBackgroundColor: FCColors.darkPurple,
        ),
        CalendarEvent(
          eventName: 'Introduction to Flutter',
          eventDate: DateTime.fromMillisecondsSinceEpoch(1655740800000),
          eventBackgroundColor: FCColors.mint,
        ),
      ]);
    });
  });
}
