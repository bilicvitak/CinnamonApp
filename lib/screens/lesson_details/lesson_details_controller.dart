import 'package:get/get.dart';
import 'package:open_file/open_file.dart';

import '../../constants/dependencies.dart';
import '../../constants/firestore_collections.dart';
import '../../constants/strings.dart';
import '../../models/lesson/lesson.dart';
import '../../models/lesson_details/lesson_details.dart';
import '../../models/reservation/reservation.dart';
import '../../models/seat/seat.dart';
import '../lesson_reservations/lesson_screen_reservations.dart';
import 'lesson_details_screens/lesson_screen_pdf_viewer.dart';

class LessonDetailsController extends GetxController {
  /// ------------------------
  /// VARIABLES
  /// ------------------------

  final _lesson = LessonDetails.blank().obs;
  final _rating = 0.obs;
  final _selectedFileUrl = ''.obs;
  final _isPastLesson = false.obs;

  final _isSeatReserved = false.obs;
  final _reservedSeat = Seat.blank().obs;

  /// ------------------------
  /// GETTERS
  /// ------------------------

  LessonDetails get lesson => _lesson.value;

  int get rating => _rating.value;

  String get selectedFileUrl => _selectedFileUrl.value;

  bool get isPastLesson => _isPastLesson.value;

  bool get isSeatReserved => _isSeatReserved.value;

  Seat get reservedSeat => _reservedSeat.value;

  /// ------------------------
  /// SETTERS
  /// ------------------------

  set lesson(LessonDetails value) => _lesson.value = value;

  set rating(int value) => _rating.value = value;

  set selectedFileUrl(String value) => _selectedFileUrl.value = value;

  set isPastLesson(bool value) => _isPastLesson.value = value;

  set isSeatReserved(bool value) => _isSeatReserved.value = value;

  set reservedSeat(Seat value) => _reservedSeat.value = value;

  /// ------------------------
  /// INIT
  /// ------------------------

  @override
  Future<void> onInit() async {
    super.onInit();

    await initializeVariables();
  }

  /// ------------------------
  /// METHODS
  /// ------------------------

  Future<void> initializeVariables() async {
    lesson = Get.arguments['lesson'];
    isPastLesson = lesson.lectureStart.isBefore(DateTime.now());

    if (Get.arguments['isSeatReserved'] != null) {
      isSeatReserved = Get.arguments['isSeatReserved'];
      reservedSeat = Get.arguments['reservedSeat'];
    } else {
      await _getReservedSeat();
    }

    await _getLessonRating();
  }

  /// lesson details => pdf viewer
  void goToLessonScreenPdfViewer() => Get.toNamed(LessonScreenPdfViewer.routeName);

  /// lesson details => lesson reservations
  void goToLessonReservations() => Get.toNamed(LessonScreenReservations.routeName, arguments: {
        'selectedLesson': lesson,
        'isSeatReserved': isSeatReserved,
        'selectedSeat': reservedSeat,
      });

  /// FUNCTION: Create lesson from lesson details
  Lesson getLesson() => Lesson(
      lessonName: lesson.lessonName,
      lessonStart: lesson.lectureStart,
      lessonEnd: lesson.codeLabEnd);

  /// FUNCTION: Create lecture from lesson details
  Lesson getLecture() => Lesson(
      lessonName: lesson.lectureName,
      lessonStart: lesson.lectureStart,
      lessonEnd: lesson.lectureEnd);

  /// FUNCTION: Create code lab from lesson details
  Lesson getCodeLab() => Lesson(
      lessonName: lesson.codeLabName,
      lessonStart: lesson.codeLabStart,
      lessonEnd: lesson.codeLabEnd);

  /// FUNCTION: Get user rating
  Future<void> _getLessonRating() async {
    final userRef = firebaseService.getDocumentReference(
        collection: FCFirestoreCollections.usersCollection,
        doc: firebaseService.firebaseUser.value!.uid);

    final lectureRef = firebaseService.getDocumentReference(
        collection: FCFirestoreCollections.lessonsCollection, doc: 'Lesson${lesson.lessonNumber}');

    final ratingsCollection = firebaseService.getCollectionReference(
        collection: FCFirestoreCollections.lessonRatingsCollection);

    final snapshot = await ratingsCollection
        .where('lectureId', isEqualTo: lectureRef)
        .where('userId', isEqualTo: userRef)
        .get();

    if (snapshot.docs.isNotEmpty) {
      rating = await snapshot.docs.single.data()['rating'];
    }
  }

  /// FUNCTION: Set lesson rating in Firebase
  Future<void> rateLesson() async {
    final userRef = firebaseService.getDocumentReference(
        collection: FCFirestoreCollections.usersCollection,
        doc: firebaseService.firebaseUser.value!.uid);

    final lectureRef = firebaseService.getDocumentReference(
        collection: FCFirestoreCollections.lessonsCollection, doc: 'Lesson${lesson.lessonNumber}');

    final ratingsCollection = firebaseService.getCollectionReference(
        collection: FCFirestoreCollections.lessonRatingsCollection);

    final snapshot = await ratingsCollection
        .where('lectureId', isEqualTo: lectureRef)
        .where('userId', isEqualTo: userRef)
        .get();

    if (snapshot.docs.isEmpty) {
      await ratingsCollection.add({'lectureId': lectureRef, 'rating': rating, 'userId': userRef});
    } else {
      final ratingId = snapshot.docs.first.id;
      final result = await firebaseService.updateDoc(
          collection: FCFirestoreCollections.lessonRatingsCollection,
          doc: ratingId,
          field: 'rating',
          value: rating);
    }
  }

  /// FUNCTION: Get user's seat for selected lesson
  Future<void> _getReservedSeat() async {
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
            '${FCFirestoreCollections.lessonsCollection}/Lesson${lesson.lessonNumber}')
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
      reservedSeat = Seat.fromJson({'id': firebaseSeat.id, ...firebaseSeat.data()!});
    }
  }

  /// FUNCTION: Get file name from storage
  String getFileName(String url) {
    final ref = firebaseService.firebaseStorage.refFromURL(url);
    return ref.name;
  }

  /// FUNCTION: Save file to device
  Future<void> saveFile({required String url, required String name}) async {
    final filePath = await firebaseService.saveFile(url, name);

    if (filePath != null) {
      await OpenFile.open(filePath);
    } else {
      Get.snackbar(FAStrings.errorError, 'message');
    }
  }
}
