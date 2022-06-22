import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../constants/dependencies.dart';
import '../../constants/firestore_collections.dart';
import '../../models/lesson/lesson.dart';
import '../../models/notification/notification.dart';
import '../../models/reservation/reservation.dart';
import '../../models/seat/seat.dart';
import '../lesson_details/lesson_screen_details.dart';
import '../lesson_reservations/lesson_screen_reservations.dart';

class HomeController extends GetxController {
  /// ------------------------
  /// VARIABLES
  /// ------------------------

  final _isSeatReserved = false.obs;
  final _reservedSeat = Rx<Seat>(Seat.blank());

  final _upcomingLesson = sharedFirebaseDataService.upcomingLesson.obs;
  final _upcomingLecture = sharedFirebaseDataService.upcomingLecture.obs;
  final _upcomingCodeLab = sharedFirebaseDataService.upcomingCodeLab.obs;

  StreamSubscription? firebaseNotifications;

  final _areNotificationsRead = false.obs;

  /// ------------------------
  /// GETTERS
  /// ------------------------

  bool get isSeatReserved => _isSeatReserved.value;

  Seat get reservedSeat => _reservedSeat.value;

  Lesson get upcomingLesson => _upcomingLesson.value;

  Lesson get upcomingLecture => _upcomingLecture.value;

  Lesson get upcomingCodeLab => _upcomingCodeLab.value;

  bool get areNotificationsRead => _areNotificationsRead.value;

  /// ------------------------
  /// SETTERS
  /// ------------------------

  set isSeatReserved(bool value) => _isSeatReserved.value = value;

  set reservedSeat(Seat value) => _reservedSeat.value = value;

  set upcomingLesson(Lesson value) => _upcomingLesson.value = value;

  set upcomingLecture(Lesson value) => _upcomingLecture.value = value;

  set upcomingCodeLab(Lesson value) => _upcomingCodeLab.value = value;

  set areNotificationsRead(bool value) => _areNotificationsRead.value = value;

  /// ------------------------
  /// INIT
  /// ------------------------

  @override
  Future<void> onInit() async {
    super.onInit();

    await sharedFirebaseDataService.getAllLessons();
    filterUpcomingLesson();

    await getReservedSeat();

    await sharedFirebaseDataService.getNotifications();
    checkNotifications();

    await _listenNotificationsChanges();
  }

  @override
  void dispose() {
    firebaseNotifications?.cancel();
    super.dispose();
  }

  /// ------------------------
  /// METHODS
  /// ------------------------

  /// home screen => lesson screen details
  void goToLessonScreenDetails() => Get.toNamed(LessonScreenDetails.routeName, arguments: {
        'lesson': upcomingLesson.lessonDetails,
        'isSeatReserved': isSeatReserved,
        'reservedSeat': reservedSeat,
      });

  void goToLessonScreenReservations() =>
      Get.toNamed(LessonScreenReservations.routeName, arguments: {
        'selectedLesson': upcomingLesson.lessonDetails,
        'isSeatReserved': isSeatReserved,
      });

  void filterUpcomingLesson() {
    final sortedLessons = sharedFirebaseDataService.lessons
        .where((lesson) => lesson.lessonStart.isAfter(DateTime.now()))
        .toList()
      ..sort((a, b) => a.lessonStart.compareTo(b.lessonStart));

    final lesson = sortedLessons.first;

    upcomingLesson = Lesson(
        lessonName: lesson.lessonName,
        lessonStart: lesson.lessonStart,
        lessonEnd: lesson.lessonEnd,
        lessonDetails: lesson.lessonDetails);

    upcomingLecture = Lesson(
        lessonName: lesson.lessonDetails!.lectureName,
        lessonStart: lesson.lessonDetails!.lectureStart,
        lessonEnd: lesson.lessonDetails!.lectureEnd);

    upcomingCodeLab = Lesson(
        lessonName: lesson.lessonDetails!.codeLabName,
        lessonStart: lesson.lessonDetails!.codeLabStart,
        lessonEnd: lesson.lessonDetails!.codeLabEnd);
  }

  Future<void> getReservedSeat() async {
    final firebaseReservations = await firebaseService.getDocuments(
        collectionPath: FCFirestoreCollections.reservationsCollection);

    if (firebaseReservations == null) {
      return;
    }

    final reservations =
        firebaseReservations.docs.map((doc) => Reservation.fromJson(doc.data())).toList();
    final reservation = reservations
        .where((reservation) =>
            reservation.lectureId ==
            '${FCFirestoreCollections.lessonsCollection}/Lesson${upcomingLesson.lessonDetails!.lessonNumber}')
        .single;

    String? seatId;
    for (final student in reservation.students) {
      student.forEach((key, value) {
        if (key == 'userId' &&
            value ==
                '${FCFirestoreCollections.usersCollection}/${firebaseService.firebaseUser.value!.uid}') {
          seatId = student['seatId'];
        }
      });
    }

    if (seatId != null) {
      isSeatReserved = true;

      final firebaseSeat = await firebaseService.getDocument(docPath: seatId!);
      reservedSeat = Seat.fromJson({'id': firebaseSeat?.id, ...?firebaseSeat?.data()!});
    }
  }

  Future<void> _listenNotificationsChanges() async {
    firebaseNotifications = firebaseService.firebaseFirestore
        .collection(FCFirestoreCollections.notificationsCollection)
        .doc(firebaseService.firebaseUser.value?.uid)
        .snapshots()
        .listen((snapshot) async {
      final data = snapshot.data()!['notification'] as List<dynamic>;

      sharedFirebaseDataService.notifications =
          data.map((json) => Notification.fromJson(json)).toList();

      checkNotifications();
    });
  }

  void checkNotifications() {
    final result = sharedFirebaseDataService.notifications
        .where((notification) => !notification.isRead)
        .length;

    areNotificationsRead = result == 0;
  }
}
