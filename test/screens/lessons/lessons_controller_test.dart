import 'dart:math';

import 'package:cinnamon_flutter_template_1/models/lesson/lesson.dart';
import 'package:cinnamon_flutter_template_1/screens/lessons/lessons_controller.dart';
import 'package:cinnamon_flutter_template_1/services/shared_firebase_data_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'lessons_controller_test.mocks.dart';

@GenerateMocks([SharedFirebaseDataService])
void main() {
  late LessonsController _lessonsController;

  setUp(() {
    _lessonsController = LessonsController()
      ..sharedFirebaseDataService = MockSharedFirebaseDataService();
  });

  tearDown(() {
    _lessonsController.dispose();
  });

  group('Filtering upcoming lessons', () {
    test('Upcoming lessons should be empty when empty list of lessons is passed', () {
      when(_lessonsController.sharedFirebaseDataService.lessons).thenReturn([]);

      _lessonsController.filterUpcomingLessons();

      expect(_lessonsController.upcomingLessons, []);
    });

    test('Upcoming lessons should not be empty when non-empty list of lessons is passed', () {
      when(_lessonsController.sharedFirebaseDataService.lessons).thenReturn([
        Lesson(
            lessonName: 'Halfway through',
            lessonStart: DateTime.fromMillisecondsSinceEpoch(1658422800000),
            lessonEnd: DateTime.fromMillisecondsSinceEpoch(1658430000000)),
        Lesson(
            lessonName: 'Some Machine Learning magic',
            lessonStart: DateTime.fromMillisecondsSinceEpoch(1658854800000),
            lessonEnd: DateTime.fromMillisecondsSinceEpoch(1658862000000)),
        Lesson(
            lessonName: 'Wrapping Up',
            lessonStart: DateTime.fromMillisecondsSinceEpoch(1659459600000),
            lessonEnd: DateTime.fromMillisecondsSinceEpoch(1659466800000)),
      ]);

      _lessonsController.filterUpcomingLessons();

      expect(_lessonsController.upcomingLessons, [
        Lesson(
            lessonName: 'Wrapping Up',
            lessonStart: DateTime.fromMillisecondsSinceEpoch(1659459600000),
            lessonEnd: DateTime.fromMillisecondsSinceEpoch(1659466800000)),
      ]);
    });
  });

  group('Filtering past lessons', () {
    test('Past lessons should be empty when empty list of lessons is passed', () {
      when(_lessonsController.sharedFirebaseDataService.lessons).thenReturn([]);

      _lessonsController.filterPastLessons();

      expect(_lessonsController.pastLessons, []);
    });

    test('Past lessons should not be empty when non-empty list of lessons is passed', () {
      when(_lessonsController.sharedFirebaseDataService.lessons).thenReturn([
        Lesson(
            lessonName: 'Halfway through',
            lessonStart: DateTime.fromMillisecondsSinceEpoch(1658422800000),
            lessonEnd: DateTime.fromMillisecondsSinceEpoch(1658430000000)),
        Lesson(
            lessonName: 'Some Machine Learning magic',
            lessonStart: DateTime.fromMillisecondsSinceEpoch(1658854800000),
            lessonEnd: DateTime.fromMillisecondsSinceEpoch(1658862000000)),
        Lesson(
            lessonName: 'Wrapping Up',
            lessonStart: DateTime.fromMillisecondsSinceEpoch(1659459600000),
            lessonEnd: DateTime.fromMillisecondsSinceEpoch(1659466800000)),
      ]);

      _lessonsController.filterPastLessons();

      expect(_lessonsController.pastLessons, [
        Lesson(
            lessonName: 'Halfway through',
            lessonStart: DateTime.fromMillisecondsSinceEpoch(1658422800000),
            lessonEnd: DateTime.fromMillisecondsSinceEpoch(1658430000000)),
        Lesson(
            lessonName: 'Some Machine Learning magic',
            lessonStart: DateTime.fromMillisecondsSinceEpoch(1658854800000),
            lessonEnd: DateTime.fromMillisecondsSinceEpoch(1658862000000)),
      ]);
    });
  });

  test('Upcoming lessons counter should be incremented', () {
    when(_lessonsController.sharedFirebaseDataService.lessons).thenReturn([
      Lesson(
          lessonName: 'Halfway through',
          lessonStart: DateTime.fromMillisecondsSinceEpoch(1658422800000),
          lessonEnd: DateTime.fromMillisecondsSinceEpoch(1658430000000)),
      Lesson(
          lessonName: 'Some Machine Learning magic',
          lessonStart: DateTime.fromMillisecondsSinceEpoch(1658854800000),
          lessonEnd: DateTime.fromMillisecondsSinceEpoch(1658862000000)),
      Lesson(
          lessonName: 'Wrapping Up',
          lessonStart: DateTime.fromMillisecondsSinceEpoch(1659459600000),
          lessonEnd: DateTime.fromMillisecondsSinceEpoch(1659466800000)),
    ]);

    _lessonsController.countUpcomingLessons();

    expect(_lessonsController.upcomingLessonsCounter, 1);
  });
}
