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

    await _filterSeats();
    await _getReservations();

    await _listenReservationChanges();
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

  Future<void> _filterSeats() async {
    final firebaseSeats =
        await firebaseService.getDocuments(collectionPath: FCFirestoreCollections.seatsCollection);

    if (firebaseSeats == null) {
      return;
    }

    seats = firebaseSeats.docs.map((doc) => Seat.fromJson({'id': doc.id, ...doc.data()})).toList();
    seats.sort((a, b) => a.position.compareTo(b.position));
  }

  Future<void> _getReservations() async {
    final lectureId = '${FCFirestoreCollections.lessonsCollection}/Lesson${lesson.lessonNumber}';
    final lectureRef =
        firebaseService.firebaseFirestore.doc(lectureId); // TODO Use firebaseService method

    final firebaseReservation = await firebaseService.firebaseFirestore
        .collection(
            FCFirestoreCollections.reservationsCollection) // TODO Use firebaseService method
        .where('lectureId', isEqualTo: lectureRef)
        .get();

    final reservation = Reservation.fromJson(firebaseReservation.docs.single.data());
    reservationId = firebaseReservation.docs.single.id;

    await _setSeatReservation(reservation.students);
  }

  Seat _getSeat(String seatPath) => seats
      .where((seat) => '${FCFirestoreCollections.seatsCollection}/${seat.id}' == seatPath)
      .single;

  Future<cinnamon_user.User> _getUser(String path) async {
    // TODO Use firebaseService method
    final firebaseUser = await firebaseService.firebaseFirestore.doc(path).get();
    return cinnamon_user.User.fromJson(firebaseUser.data()!);
  }

  Future<void> _setSeatReservation(List<Map<String, String>> students) async {
    reservations.clear();
    reservationsDetails.clear();

    for (final seat in seats) {
      reservationsDetails.addAll({seat.position: ReservationSeat(seat: seat)});
    }

    await Future.forEach<Map<String, String>>(students, (student) async {
      final seat = _getSeat(student['seatId']!);
      final user = await _getUser(student['userId']!);

      // TODO Use firebaseService method
      reservations.add({
        'seatId': firebaseService.firebaseFirestore.doc(student['seatId']!),
        'userId': firebaseService.firebaseFirestore.doc(student['userId']!),
      });

      reservationsDetails.addAll({seat.position: ReservationSeat(seat: seat, student: user)});

      if (user.id == firebaseService.firebaseUser.value?.uid) {
        isSeatReserved = true;
        selectedSeat = seat;
      }
    });

    _reservations.refresh();
    _reservationsDetails.refresh();
  }

  Future<void> _listenReservationChanges() async {
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
    // TODO Use firebaseService method
    reservations.add({
      'seatId': firebaseService.firebaseFirestore
          .doc('${FCFirestoreCollections.seatsCollection}/${selectedSeat.id}'),
      'userId': firebaseService.firebaseFirestore.doc(
          '${FCFirestoreCollections.usersCollection}/${firebaseService.firebaseUser.value?.uid}')
    });

    // TODO Use firebaseService method
    await firebaseService.firebaseFirestore
        .collection(FCFirestoreCollections.reservationsCollection)
        .doc(reservationId)
        .update({'students': reservations});
  }

  Future<void> cancelReservation() async {
    // TODO Use firebaseService method
    reservations.removeWhere((element) => element.containsValue(firebaseService.firebaseFirestore
        .doc('${FCFirestoreCollections.seatsCollection}/${selectedSeat.id}')));

    // TODO Use firebaseService method
    await firebaseService.firebaseFirestore
        .collection(FCFirestoreCollections.reservationsCollection)
        .doc(reservationId)
        .update({'students': reservations});

    isSeatReserved = false;
  }
}
