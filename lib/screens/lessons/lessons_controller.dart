import 'package:get/get.dart';

import '../../constants/dependencies.dart';
import '../../models/lesson/lesson.dart';
import '../../services/shared_firebase_data_service.dart';
import '../lesson_details/lesson_screen_details.dart';
import '../lesson_reservations/lesson_screen_reservations.dart';

class LessonsController extends GetxController {
  /// ------------------------
  /// VARIABLES
  /// ------------------------

  final _upcomingLessonsCounter = 0.obs;
  final _pastLessonsCounter = 0.obs;
  final _upcomingLessons = <Lesson>[].obs;
  final _pastLessons = <Lesson>[].obs;

  final _selectedLesson = Lesson(
          lessonName: 'Selected Lesson',
          lessonStart: DateTime.now(),
          lessonEnd: DateTime.now().add(const Duration(hours: 3)))
      .obs;

  /// ------------------------
  /// GETTERS
  /// ------------------------

  int get upcomingLessonsCounter => _upcomingLessonsCounter.value;

  int get pastLessonsCounter => _pastLessonsCounter.value;

  List<Lesson> get upcomingLessons => _upcomingLessons;

  List<Lesson> get pastLessons => _pastLessons;

  Lesson get selectedLesson => _selectedLesson.value;

  /// ------------------------
  /// SETTERS
  /// ------------------------

  set upcomingLessonsCounter(int value) => _upcomingLessonsCounter.value = value;

  set pastLessonsCounter(int value) => _pastLessonsCounter.value = value;

  set upcomingLessons(List<Lesson> value) => _upcomingLessons.assignAll(value);

  set pastLessons(List<Lesson> value) => _pastLessons.assignAll(value);

  set selectedLesson(Lesson value) => _selectedLesson.value = value;

  /// ------------------------
  /// INIT
  /// ------------------------

  @override
  Future<void> onInit() async {
    super.onInit();

    await sharedFirebaseDataService.getAllLessons();

    filterPastLessons();
    filterUpcomingLessons();
    countUpcomingAndPastLessons();
  }

  /// ------------------------
  /// METHODS
  /// ------------------------

  /// lessons screen => lesson screen details
  void goToLessonScreenDetails() => Get.toNamed(LessonScreenDetails.routeName, arguments: {
        'lesson': selectedLesson.lessonDetails,
        'isSeatReserved': null,
        'reservedSeat': null,
      });

  /// lesson details screen => lesson reserve a seat
  void goToLessonScreenReserveSeat() => Get.toNamed(LessonScreenReservations.routeName);

  /// FUNCTION: count how many lessons are upcoming
  void countUpcomingAndPastLessons() {
    upcomingLessonsCounter = 0;

    for (var i = 0; i < sharedFirebaseDataService.lessons.length; ++i) {
      if (sharedFirebaseDataService.lessons[i].lessonEnd.isAfter(DateTime.now())) {
        ++upcomingLessonsCounter;
      }
    }

    pastLessonsCounter = sharedFirebaseDataService.lessons.length - upcomingLessonsCounter;
  }

  /// FUNCTION: filter upcoming lessons and return list of upcoming lessons
  void filterUpcomingLessons() {
    upcomingLessons.clear();

    for (var i = 0; i < sharedFirebaseDataService.lessons.length; ++i) {
      if (sharedFirebaseDataService.lessons[i].lessonEnd.isAfter(DateTime.now())) {
        upcomingLessons.add(sharedFirebaseDataService.lessons[i]);
      }
    }
  }

  /// FUNCTION: filter past lessons and return list of past lessons
  void filterPastLessons() {
    pastLessons.clear();

    for (var i = 0; i < sharedFirebaseDataService.lessons.length; ++i) {
      if (sharedFirebaseDataService.lessons[i].lessonEnd.isBefore(DateTime.now())) {
        pastLessons.add(sharedFirebaseDataService.lessons[i]);
      }
    }
  }
}
