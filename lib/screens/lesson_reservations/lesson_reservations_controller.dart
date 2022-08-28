import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../constants/dependencies.dart';
import '../../constants/firestore_collections.dart';
import '../../models/lesson/lesson.dart';
import '../../models/lesson_details/lesson_details.dart';
import '../../models/reservation/reservation.dart';
import '../../models/reservation_seat/reservation_seat.dart';
import '../../models/seat/seat.dart';

import '../../models/user/user.dart' as cinnamon_user;
import '../home/home_controller.dart';
import '../lesson_details/lesson_details_controller.dart';

class LessonReservationsController extends GetxController {
  /// ------------------------
  /// VARIABLES
  /// ------------------------

  final _lesson = LessonDetails.blank().obs;

  final _seats = <Seat>[].obs;

  final _reservationsDetails = <int, ReservationSeat>{}.obs;
  final _reservations = <Map<String, DocumentReference>>[].obs;
  final _reservationId = ''.obs;

  final _selectedSeat = Seat.blank().obs;
  final _isSeatReserved = false.obs;

  StreamSubscription? firebaseReservations;

  /// ------------------------
  /// GETTERS
  /// ------------------------

  LessonDetails get lesson => _lesson.value;

  List<Seat> get seats => _seats;

  Map<int, ReservationSeat> get reservationsDetails => _reservationsDetails;

  List<Map<String, DocumentReference>> get reservations => _reservations;

  String get reservationId => _reservationId.value;

  Seat get selectedSeat => _selectedSeat.value;

  bool get isSeatReserved => _isSeatReserved.value;

  /// ------------------------
  /// SETTERS
  /// ------------------------

  set lesson(LessonDetails value) => _lesson.value = value;

  set seats(List<Seat> value) => _seats.assignAll(value);

  set reservationsDetails(Map<int, ReservationSeat> value) => _reservationsDetails.assignAll(value);

  set reservations(List<Map<String, DocumentReference>> value) => _reservations.assignAll(value);

  set reservationId(String value) => _reservationId.value = value;

  set selectedSeat(Seat value) => _selectedSeat.value = value;

  set isSeatReserved(bool value) => _isSeatReserved.value = value;

  /// ------------------------
  /// INIT
  /// ------------------------

  @override
  Future<void> onInit() async {
    super.onInit();

    lesson = Get.arguments['selectedLesson'];
    isSeatReserved = Get.arguments['isSeatReserved'];
    selectedSeat = Get.arguments['selectedSeat'] ?? Seat.blank();

    await filterSeats();
    await getReservations();

    await listenReservationChanges();
  }

  @override
  void dispose() {
    firebaseReservations?.cancel();
    super.dispose();
  }

  /// ------------------------
  /// METHODS
  /// ------------------------

  void getBackAndRefresh() {
    if (Get.isRegistered<LessonDetailsController>()) {
      Get.find<LessonDetailsController>()
        ..isSeatReserved = isSeatReserved
        ..reservedSeat = selectedSeat;
    }

    if (Get.isRegistered<HomeController>()) {
      Get.find<HomeController>()
        ..isSeatReserved = isSeatReserved
        ..reservedSeat = selectedSeat;
    }

    Get.back();
  }

  Future<void> filterSeats() async {
    final firebaseSeats =
        await firebaseService.getDocuments(collectionPath: FCFirestoreCollections.seatsCollection);

    if (firebaseSeats == null) {
      return;
    }

    seats = firebaseSeats.docs.map((doc) => Seat.fromJson({'id': doc.id, ...doc.data()})).toList();
    seats.sort((a, b) => a.position.compareTo(b.position));
  }

  Future<void> getReservations() async {
    final lectureId = '${FCFirestoreCollections.lessonsCollection}/Lesson${lesson.lessonNumber}';
    final lectureRef = firebaseService.getDocumentReference(doc: lectureId);

    final firebaseReservation = await firebaseService
        .getCollectionReference(collection: FCFirestoreCollections.reservationsCollection)
        .where('lectureId', isEqualTo: lectureRef)
        .get();

    final reservation = Reservation.fromJson(firebaseReservation.docs.single.data());
    reservationId = firebaseReservation.docs.single.id;

    await _setSeatReservation(reservation.students);
  }

  Seat _getSeat(String seatPath) => seats
      .where((seat) => '${FCFirestoreCollections.seatsCollection}/${seat.id}' == seatPath)
      .single;

  Future<cinnamon_user.User?> _getUser(String path) async {
    final firebaseUser = await firebaseService.getDocument(docPath: path);

    if (firebaseUser != null) {
      return cinnamon_user.User.fromJson(firebaseUser.data()!);
    } else {
      return null;
    }
  }

  Future<void> _setSeatReservation(List<Map<String, String>> students) async {
    reservations.clear();
    reservationsDetails.clear();

    for (final seat in seats) {
      reservationsDetails.addAll({seat.position: ReservationSeat(seat: seat)});
    }

    if (students.isNotEmpty) {
      await Future.forEach<Map<String, String>>(students, (student) async {
        final seat = _getSeat(student['seatId']!);
        final user = await _getUser(student['userId']!);

        if (user != null) {
          final seatRef = firebaseService.getDocumentReference(doc: student['seatId']!);
          final userRef = firebaseService.getDocumentReference(doc: student['userId']!);

          reservations.add({
            'seatId': seatRef,
            'userId': userRef,
          });

          reservationsDetails.addAll({seat.position: ReservationSeat(seat: seat, student: user)});

          if (user.id == firebaseService.firebaseUser.value?.uid) {
            isSeatReserved = true;
            selectedSeat = seat;
          }
        }
      });
    }

    _reservations.refresh();
    _reservationsDetails.refresh();
  }

  Future<void> listenReservationChanges() async {
    final lectureId = '${FCFirestoreCollections.lessonsCollection}/Lesson${lesson.lessonNumber}';
    final lectureRef = firebaseService.getDocumentReference(doc: lectureId);

    firebaseReservations = firebaseService.firebaseFirestore
        .collection(FCFirestoreCollections.reservationsCollection)
        .where('lectureId', isEqualTo: lectureRef)
        .snapshots()
        .listen((event) async {
      for (final change in event.docChanges) {
        if (change.type == DocumentChangeType.modified) {
          if (change.doc.data() != null) {
            final reservation = Reservation.fromJson(change.doc.data()!);
            await _setSeatReservation(reservation.students);
          }
        }
      }
    });
  }

  Future<void> reserveSeat() async {
    final seatRef = firebaseService.getDocumentReference(
        collection: FCFirestoreCollections.seatsCollection, doc: selectedSeat.id);
    final userRef = firebaseService.getDocumentReference(
        collection: FCFirestoreCollections.usersCollection,
        doc: '${firebaseService.firebaseUser.value?.uid}');

    reservations.add({'seatId': seatRef, 'userId': userRef});

    final success = await firebaseService.updateDoc(
        collection: FCFirestoreCollections.reservationsCollection,
        doc: reservationId,
        field: 'students',
        value: reservations);
  }

  Future<void> cancelReservation() async {
    final seatId = '${FCFirestoreCollections.seatsCollection}/${selectedSeat.id}';
    final seatRef = firebaseService.getDocumentReference(doc: seatId);

    reservations.removeWhere((element) => element.containsValue(seatRef));

    final success = await firebaseService.updateDoc(
        collection: FCFirestoreCollections.reservationsCollection,
        doc: reservationId,
        field: 'students',
        value: reservations);

    isSeatReserved = false;
  }
}
