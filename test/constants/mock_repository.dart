import 'package:cell_calendar/cell_calendar.dart';
import 'package:cinnamon_flutter_template_1/constants/colors.dart';
import 'package:cinnamon_flutter_template_1/models/lesson/lesson.dart';
import 'package:cinnamon_flutter_template_1/models/lesson_details/lesson_details.dart';
import 'package:cinnamon_flutter_template_1/models/notification/notification.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class MockRepository {
  static final _dateTime = DateTime.now();

  /// Calendar controller
  static final calendarLesson = Lesson(
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
      fileUrl: const [
        'https://firebasestorage.googleapis.com/v0/b/cinnamonapp-73a64.appspot.com/o/lectures%2Flecture1%2FLanguageTour.pptx.pdf?alt=media&token=a3d2f19c-1acf-43d1-84a2-d642c9c9099b'
      ],
      lessonNumber: 1,
    ),
  );

  static final calendarEvents = [
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
  ];

  /// Image picker
  static Future<XFile> get imageFile async {
    final data = await rootBundle.load('assets/images/profile.jpg');
    final bytes = data.buffer.asUint8List();
    final xfile = XFile(r'tempDir\tmp.tmp', bytes: bytes);

    return xfile;
  }

  /// Lessons controller
  static final lessonsLessons = <Lesson>[
    Lesson(
      lessonName: 'Halfway through',
      lessonStart: _dateTime.subtract(
        const Duration(days: 2, hours: 2),
      ),
      lessonEnd: _dateTime.subtract(
        const Duration(days: 2),
      ),
    ),
    Lesson(
      lessonName: 'Some Machine Learning magic',
      lessonStart: _dateTime.subtract(
        const Duration(days: 1, hours: 2),
      ),
      lessonEnd: _dateTime.subtract(
        const Duration(days: 1),
      ),
    ),
    Lesson(
      lessonName: 'Wrapping Up',
      lessonStart: _dateTime.add(
        const Duration(days: 1),
      ),
      lessonEnd: _dateTime.add(
        const Duration(days: 1, hours: 2),
      ),
    ),
  ];

  static final lessonsUpcomingLessons = <Lesson>[
    Lesson(
      lessonName: 'Wrapping Up',
      lessonStart: _dateTime.add(
        const Duration(days: 1),
      ),
      lessonEnd: _dateTime.add(
        const Duration(days: 1, hours: 2),
      ),
    ),
  ];

  static final lessonsPastLessons = <Lesson>[
    Lesson(
      lessonName: 'Halfway through',
      lessonStart: _dateTime.subtract(
        const Duration(days: 2, hours: 2),
      ),
      lessonEnd: _dateTime.subtract(
        const Duration(days: 2),
      ),
    ),
    Lesson(
      lessonName: 'Some Machine Learning magic',
      lessonStart: _dateTime.subtract(
        const Duration(days: 1, hours: 2),
      ),
      lessonEnd: _dateTime.subtract(
        const Duration(days: 1),
      ),
    ),
  ];

  /// Home controller
  static final homeInitialUpcomingLesson = Lesson(
    lessonName: 'Lesson 1',
    lessonStart: _dateTime.add(
      const Duration(hours: 2),
    ),
    lessonEnd: _dateTime.add(
      const Duration(hours: 4),
    ),
    lessonDetails: LessonDetails(
      lessonName: 'Lesson 1',
      description: 'Lorem ipsum',
      location: 'Slavonska avenija 6, 10000 Zagreb',
      lectureName: 'Lecture 1',
      lectureStart: _dateTime.add(
        const Duration(hours: 2),
      ),
      lectureEnd: _dateTime.add(
        const Duration(hours: 3),
      ),
      codeLabName: 'Code lab 1',
      codeLabStart: _dateTime.add(
        const Duration(hours: 3),
      ),
      codeLabEnd: _dateTime.add(
        const Duration(hours: 4),
      ),
      fileUrl: const [
        'https://firebasestorage.googleapis.com/v0/b/cinnamonapp-73a64.appspot.com/o/lectures%2Flecture1%2FLanguageTour.pptx.pdf?alt=media&token=a3d2f19c-1acf-43d1-84a2-d642c9c9099b'
      ],
      lessonNumber: 1,
    ),
  );

  static final homeInitialUpcomingLecture = Lesson(
    lessonName: 'Lecture 1',
    lessonStart: _dateTime.add(
      const Duration(hours: 2),
    ),
    lessonEnd: _dateTime.add(
      const Duration(hours: 3),
    ),
  );

  static final homeInitialUpcomingCodeLab = Lesson(
    lessonName: 'Code lab 1',
    lessonStart: _dateTime.add(
      const Duration(hours: 3),
    ),
    lessonEnd: _dateTime.add(
      const Duration(hours: 4),
    ),
  );

  static final homeLessons = [
    Lesson(
      lessonName: 'Lesson 2',
      lessonStart: _dateTime.add(const Duration(days: 1, hours: 2)),
      lessonEnd: _dateTime.add(const Duration(days: 1, hours: 4)),
      lessonDetails: LessonDetails(
        lessonName: 'Lesson 2',
        description: 'Lorem ipsum',
        location: 'Slavonska avenija 6, 10000 Zagreb',
        lectureName: 'Lecture 2',
        lectureStart: _dateTime.add(const Duration(days: 1, hours: 2)),
        lectureEnd: _dateTime.add(const Duration(days: 1, hours: 3)),
        codeLabName: 'Code lab 2',
        codeLabStart: _dateTime.add(const Duration(days: 1, hours: 3)),
        codeLabEnd: _dateTime.add(const Duration(days: 1, hours: 4)),
        fileUrl: const [
          'https://firebasestorage.googleapis.com/v0/b/cinnamonapp-73a64.appspot.com/o/lectures%2Flecture1%2FLanguageTour.pptx.pdf?alt=media&token=a3d2f19c-1acf-43d1-84a2-d642c9c9099b'
        ],
        lessonNumber: 2,
      ),
    ),
    Lesson(
      lessonName: 'Lesson 3',
      lessonStart: _dateTime.add(const Duration(days: 2, hours: 2)),
      lessonEnd: _dateTime.add(const Duration(days: 2, hours: 4)),
      lessonDetails: LessonDetails(
        lessonName: 'Lesson 3',
        description: 'Lorem ipsum',
        location: 'Slavonska avenija 6, 10000 Zagreb',
        lectureName: 'Lecture 3',
        lectureStart: _dateTime.add(const Duration(days: 2, hours: 2)),
        lectureEnd: _dateTime.add(const Duration(days: 2, hours: 3)),
        codeLabName: 'Code lab 3',
        codeLabStart: _dateTime.add(const Duration(days: 2, hours: 3)),
        codeLabEnd: _dateTime.add(const Duration(days: 2, hours: 4)),
        fileUrl: const [
          'https://firebasestorage.googleapis.com/v0/b/cinnamonapp-73a64.appspot.com/o/lectures%2Flecture1%2FLanguageTour.pptx.pdf?alt=media&token=a3d2f19c-1acf-43d1-84a2-d642c9c9099b'
        ],
        lessonNumber: 3,
      ),
    ),
  ];

  static final homeUpcomingLesson = Lesson(
    lessonName: 'Lesson 2',
    lessonStart: _dateTime.add(const Duration(days: 1, hours: 2)),
    lessonEnd: _dateTime.add(const Duration(days: 1, hours: 4)),
    lessonDetails: LessonDetails(
      lessonName: 'Lesson 2',
      description: 'Lorem ipsum',
      location: 'Slavonska avenija 6, 10000 Zagreb',
      lectureName: 'Lecture 2',
      lectureStart: _dateTime.add(const Duration(days: 1, hours: 2)),
      lectureEnd: _dateTime.add(const Duration(days: 1, hours: 3)),
      codeLabName: 'Code lab 2',
      codeLabStart: _dateTime.add(const Duration(days: 1, hours: 3)),
      codeLabEnd: _dateTime.add(const Duration(days: 1, hours: 4)),
      fileUrl: const [
        'https://firebasestorage.googleapis.com/v0/b/cinnamonapp-73a64.appspot.com/o/lectures%2Flecture1%2FLanguageTour.pptx.pdf?alt=media&token=a3d2f19c-1acf-43d1-84a2-d642c9c9099b'
      ],
      lessonNumber: 2,
    ),
  );

  static final homeUpcomingLecture = Lesson(
    lessonName: 'Lecture 2',
    lessonStart: _dateTime.add(
      const Duration(days: 1, hours: 2),
    ),
    lessonEnd: _dateTime.add(
      const Duration(days: 1, hours: 3),
    ),
  );

  static final homeUpcomingCodeLab = Lesson(
    lessonName: 'Code lab 2',
    lessonStart: _dateTime.add(
      const Duration(days: 1, hours: 3),
    ),
    lessonEnd: _dateTime.add(
      const Duration(days: 1, hours: 4),
    ),
  );

  static final homeNotifications = [
    Notification(
      title: 'Title 1',
      description: 'Description 1',
      lectureId: 'lectures/Lesson1',
      isRead: true,
    ),
    Notification(
      title: 'Title 2',
      description: 'Description 2',
      lectureId: 'lectures/Lesson2',
      isRead: false,
    ),
  ];

  /// SharedFirebaseDataService
  static final sharedFirebaseLessons = [
    Lesson(
        lessonName: 'Lesson Past',
        lessonStart: _dateTime.subtract(const Duration(hours: 2)),
        lessonEnd: _dateTime.subtract(const Duration(hours: 2))),
    Lesson(
        lessonName: 'Lesson Upcoming',
        lessonStart: _dateTime,
        lessonEnd: _dateTime.add(const Duration(hours: 3))),
  ];

  static final sharedFirebaseNotificationJson = <String, dynamic>{
    'notification': [
      homeNotifications[0].toJson(),
      homeNotifications[1].toJson(),
    ]
  };
}
