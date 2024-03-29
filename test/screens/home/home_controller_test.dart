import 'dart:async';

import 'package:cinnamon_flutter_template_1/constants/dependencies.dart';
import 'package:cinnamon_flutter_template_1/constants/firestore_collections.dart';
import 'package:cinnamon_flutter_template_1/models/notification/notification.dart';
import 'package:cinnamon_flutter_template_1/models/seat/seat.dart';
import 'package:cinnamon_flutter_template_1/screens/home/home_controller.dart';
import 'package:cinnamon_flutter_template_1/services/firebase_service.dart';
import 'package:cinnamon_flutter_template_1/services/shared_firebase_data_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../constants/mock_repository.dart';
import 'home_controller_test.mocks.dart';

Map<String, dynamic> getData() => {'key': 'value'};

@GenerateMocks([
  SharedFirebaseDataService,
  FirebaseService,
  QuerySnapshot,
  DocumentReference,
  User,
  Stream,
  StreamSubscription,
], customMocks: [
  MockSpec<QueryDocumentSnapshot>(
      unsupportedMembers: {#data}, fallbackGenerators: {#data: getData}),
  MockSpec<DocumentSnapshot>(
      unsupportedMembers: {#data}, fallbackGenerators: {#data: getData})
])
void main() {
  late HomeController _homeController;
  final _mockSharedFirebaseDataService = MockSharedFirebaseDataService();
  final _mockFirebaseService = MockFirebaseService();

  setUp(() {
    sharedFirebaseDataService = _mockSharedFirebaseDataService;
    firebaseService = _mockFirebaseService;

    when(_mockSharedFirebaseDataService.upcomingLesson)
        .thenReturn(MockRepository.homeInitialUpcomingLesson);
    when(_mockSharedFirebaseDataService.upcomingLecture)
        .thenReturn(MockRepository.homeInitialUpcomingLecture);
    when(_mockSharedFirebaseDataService.upcomingCodeLab)
        .thenReturn(MockRepository.homeInitialUpcomingCodeLab);

    _homeController = HomeController();
  });

  tearDown(() => _homeController.dispose());

  group('Filter upcoming lesson', () {
    test("Upcoming lessons don't exist", () {
      /// Arrange
      /// -- Stubbing
      when(_mockSharedFirebaseDataService.lessons).thenReturn([]);

      /// Act
      _homeController.filterUpcomingLesson();

      /// Assert
      expect(_homeController.upcomingLesson, MockRepository.homeInitialUpcomingLesson);
      expect(_homeController.upcomingLecture, MockRepository.homeInitialUpcomingLecture);
      expect(_homeController.upcomingCodeLab, MockRepository.homeInitialUpcomingCodeLab);
    });

    test('Upcoming lesson is filtered into upcoming lecture and code lab', () {
      /// Arrange
      /// -- Stubbing
      when(_mockSharedFirebaseDataService.lessons).thenReturn(MockRepository.homeLessons);

      /// Act
      _homeController.filterUpcomingLesson();

      /// Assert
      expect(_homeController.upcomingLesson, MockRepository.homeUpcomingLesson);
      expect(_homeController.upcomingLecture, MockRepository.homeUpcomingLecture);
      expect(_homeController.upcomingCodeLab, MockRepository.homeUpcomingCodeLab);
    });
  });

  group('Seat reservations for upcoming lesson', () {
    /// Arrange
    /// -- Mock snapshosts
    final QuerySnapshot<Map<String, dynamic>> querySnapshot = MockQuerySnapshot();
    final QueryDocumentSnapshot<Map<String, dynamic>> queryDocumentSnaphsot =
        MockQueryDocumentSnapshot();

    /// -- Mock document references
    final DocumentReference lecture = MockDocumentReference();
    final DocumentReference seat = MockDocumentReference();
    final DocumentReference user = MockDocumentReference();

    /// -- Mock user
    final User mockUser = MockUser();

    /// -- Stubbing
    when(_mockFirebaseService.getDocuments(collectionPath: anyNamed('collectionPath')))
        .thenAnswer((_) async => querySnapshot);

    when(querySnapshot.docs).thenReturn([queryDocumentSnaphsot]);

    when(queryDocumentSnaphsot.data()).thenReturn({
      'lectureId': lecture,
      'students': [
        {
          'seatId': seat,
          'userId': user,
        }
      ],
    });

    when(lecture.path).thenReturn('lectures/Lesson1');
    when(seat.path).thenReturn('seats/6hzAdnZPnUplxyvBuXgg');
    when(user.path).thenReturn('users/XON8xfws6bVg3FnLs2wEGl3mMPv1');

    when(_mockFirebaseService.firebaseUser).thenReturn(Rx<User?>(mockUser));

    test("Seat reservation doesn't exist in database", () async {
      /// -- Stubbing
      when(mockUser.uid).thenReturn('1234');

      /// Act
      await _homeController.getReservedSeat();

      /// Assert
      expect(_homeController.isSeatReserved, false);
      expect(_homeController.reservedSeat, Seat.blank());
    });

    test('Seat reservation exists in database', () async {
      /// -- Stubbing
      when(mockUser.uid).thenReturn('XON8xfws6bVg3FnLs2wEGl3mMPv1');

      /// -- Mock seat
      final DocumentSnapshot<Map<String, dynamic>> firebaseSeat = MockDocumentSnapshot();

      /// -- Stubbing seat
      when(_mockFirebaseService.getDocument(docPath: anyNamed('docPath')))
          .thenAnswer((_) async => firebaseSeat);

      when(firebaseSeat.id).thenReturn('6hzAdnZPnUplxyvBuXgg');
      when(firebaseSeat.data()).thenReturn({
        'name': 'A1',
        'position': 1,
      });

      /// Act
      await _homeController.getReservedSeat();

      /// Assert
      expect(_homeController.isSeatReserved, true);
      expect(
        _homeController.reservedSeat,
        Seat(id: '6hzAdnZPnUplxyvBuXgg', name: 'A1', position: 1),
      );
    });
  });

  group('Check notifications', () {
    test('Notifications are not read', () {
      /// Arrange
      /// -- Stubbing
      when(_mockSharedFirebaseDataService.notifications)
          .thenReturn(MockRepository.homeNotifications);

      _homeController.checkNotifications();

      expect(_homeController.areNotificationsRead, false);
    });

    test('Notifications are read', () {
      /// Arrange
      /// -- Stubbing
      when(_mockSharedFirebaseDataService.notifications).thenReturn(
          MockRepository.homeNotifications.map((item) => item.copyWith(isRead: true)).toList());

      /// Act
      _homeController.checkNotifications();

      /// Assert
      expect(_homeController.areNotificationsRead, true);
    });
  });

  test('Update notifications', () {
    /// Arrange
    /// -- Mock data
    final DocumentSnapshot<Map<String, dynamic>> snapshot = MockDocumentSnapshot();
    final DocumentReference lectureRef = MockDocumentReference();

    /// -- Stubbing
    when(snapshot.data()).thenReturn({
      'notification': [
        {
          'title': 'Title 1',
          'description': 'Description 1',
          'isRead': true,
          'lectureId': lectureRef,
        },
      ]
    });

    when(lectureRef.path).thenReturn('lectures/Lesson1');
    when(_mockSharedFirebaseDataService.notifications).thenReturn([]);

    /// Act
    final result = _homeController.updateNotifications(snapshot);

    /// Assert
    expect(result, [
      Notification(
        title: 'Title 1',
        description: 'Description 1',
        lectureId: 'lectures/Lesson1',
        isRead: true,
      )
    ]);
  });

  test('Listen changes on notification collection', () {
    /// Arrange
    /// -- Mock data
    final User mockUser = MockUser();
    final DocumentReference<Map<String, dynamic>> notificationRef = MockDocumentReference();
    final Stream<DocumentSnapshot<Map<String, dynamic>>> stream = MockStream();
    final StreamSubscription<DocumentSnapshot<Map<String, dynamic>>> streamSubscription =
        MockStreamSubscription();

    /// -- Stubbing
    when(_mockFirebaseService.firebaseUser).thenReturn(Rx<User?>(mockUser));
    when(mockUser.uid).thenReturn('XON8xfws6bVg3FnLs2wEGl3mMPv1');

    when(_mockFirebaseService.getDocumentReference(
      collection: anyNamed('collection'),
      doc: anyNamed('doc'),
    )).thenReturn(notificationRef);

    when(notificationRef.snapshots()).thenAnswer((_) => stream);
    when(stream.listen(any)).thenReturn(streamSubscription);

    /// Act
    _homeController.listenNotificationsChanges();

    /// Assert
    expect(_homeController.firebaseNotifications, streamSubscription);
    verify(stream.listen(any)).called(1);
  });
}
