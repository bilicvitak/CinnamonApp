import 'package:cinnamon_flutter_template_1/constants/dependencies.dart';
import 'package:cinnamon_flutter_template_1/constants/firestore_collections.dart';
import 'package:cinnamon_flutter_template_1/models/seat/seat.dart';
import 'package:cinnamon_flutter_template_1/screens/lesson_details/lesson_details_controller.dart';
import 'package:cinnamon_flutter_template_1/services/firebase_service.dart';
import 'package:cinnamon_flutter_template_1/services/shared_firebase_data_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:open_file/open_file.dart';
import 'package:test/test.dart';

import '../../constants/mock_repository.dart';
import 'lesson_details_controller_test.mocks.dart';

Map<String, dynamic> getData() => {'key': 'value'};

@GenerateMocks([
  FirebaseService,
  SharedFirebaseDataService,
  DocumentReference,
  CollectionReference,
  QuerySnapshot,
  User,
], customMocks: [
  MockSpec<QueryDocumentSnapshot>(
      unsupportedMembers: {#data}, fallbackGenerators: {#data: getData}),
  MockSpec<DocumentSnapshot>(unsupportedMembers: {#data}, fallbackGenerators: {#data: getData})
])
void main() {
  late LessonDetailsController _lessonDetailsController;
  final _mockSharedFirebaseDataService = MockSharedFirebaseDataService();
  final _mockFirebaseService = MockFirebaseService();

  setUp(() {
    _lessonDetailsController = LessonDetailsController();

    sharedFirebaseDataService = _mockSharedFirebaseDataService;
    firebaseService = _mockFirebaseService;

    _lessonDetailsController.lesson = MockRepository.homeInitialUpcomingLesson.lessonDetails!;
  });

  tearDown(() => _lessonDetailsController.dispose());

  group('Lesson ratings', () {
    /// Arrange
    /// -- Mock data
    final mockUser = MockUser();
    final userRef = MockDocumentReference<Map<String, dynamic>>();
    final lectureRef = MockDocumentReference<Map<String, dynamic>>();
    final ratingsRef = MockCollectionReference<Map<String, dynamic>>();
    final querySnapshot = MockQuerySnapshot<Map<String, dynamic>>();
    final queryDocumentSnapshot = MockQueryDocumentSnapshot<Map<String, dynamic>>();

    /// -- Stubbing
    when(_mockFirebaseService.firebaseUser).thenReturn(Rx<User?>(mockUser));
    when(mockUser.uid).thenReturn('XON8xfws6bVg3FnLs2wEGl3mMPv1');

    when(_mockFirebaseService.getDocumentReference(
            collection: FCFirestoreCollections.usersCollection, doc: anyNamed('doc')))
        .thenReturn(userRef);

    when(_mockFirebaseService.getDocumentReference(
            collection: FCFirestoreCollections.lessonsCollection, doc: anyNamed('doc')))
        .thenReturn(lectureRef);

    when(_mockFirebaseService.getCollectionReference(collection: anyNamed('collection')))
        .thenReturn(ratingsRef);

    when(ratingsRef.where(any, isEqualTo: anyNamed('isEqualTo'))).thenReturn(ratingsRef);
    when(ratingsRef.get()).thenAnswer((_) async => querySnapshot);

    when(_mockFirebaseService.createDoc(collection: anyNamed('collection'), data: anyNamed('data')))
        .thenAnswer((_) async => true);

    when(_mockFirebaseService.updateDoc(
      collection: anyNamed('collection'),
      doc: anyNamed('doc'),
      field: anyNamed('field'),
      value: anyNamed('value'),
    )).thenAnswer((_) async => true);

    test('Get rating snapshot by user id and lecture id', () async {
      /// Act
      await _lessonDetailsController.getRatingSnapshot();

      /// Assert
      expect(_lessonDetailsController.userRef, userRef);
      expect(_lessonDetailsController.lectureRef, lectureRef);
      expect(_lessonDetailsController.ratingsCollection, ratingsRef);
      expect(_lessonDetailsController.firebaseRating, querySnapshot);
    });

    test('Get lesson rating - Lesson rating should be 4', () async {
      /// -- Stubbing
      when(querySnapshot.docs).thenReturn([queryDocumentSnapshot]);
      when(queryDocumentSnapshot.data()).thenReturn({
        'lectureId': 'lectures/Lesson1',
        'userId': 'XON8xfws6bVg3FnLs2wEGl3mMPv1',
        'rating': 4,
      });

      /// Act
      await _lessonDetailsController.getLessonRating();

      /// Assert
      expect(_lessonDetailsController.rating, 4);
    });

    test('Get lesson rating - Lesson rating should be 0', () async {
      /// -- Stubbing
      when(querySnapshot.docs).thenReturn([]);

      /// Act
      await _lessonDetailsController.getLessonRating();

      /// Assert
      expect(_lessonDetailsController.rating, 0);
    });

    test('Rate lesson - Create new rating - Result should be true', () async {
      /// Arrange
      /// -- Stubbing
      when(querySnapshot.docs).thenReturn([]);

      /// Act
      final result = await _lessonDetailsController.rateLesson();

      /// Assert
      verify(_mockFirebaseService.createDoc(
              collection: anyNamed('collection'), data: anyNamed('data')))
          .called(1);

      expect(result, true);
    });

    test('Rate lesson - Update rating - Result should be true', () async {
      /// Arrange
      /// -- Stubbing
      when(querySnapshot.docs).thenReturn([queryDocumentSnapshot]);
      when(queryDocumentSnapshot.id).thenReturn('expected');

      /// Act
      final result = await _lessonDetailsController.rateLesson();

      /// Assert
      verify(_mockFirebaseService.updateDoc(
        collection: anyNamed('collection'),
        doc: anyNamed('doc'),
        field: anyNamed('field'),
        value: anyNamed('value'),
      )).called(1);

      expect(result, true);
    });
  });

  group('Seat reservations for selected lesson', () {
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
      await _lessonDetailsController.getReservedSeat();

      /// Assert
      expect(_lessonDetailsController.isSeatReserved, false);
      expect(_lessonDetailsController.reservedSeat, Seat.blank());
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
      await _lessonDetailsController.getReservedSeat();

      /// Assert
      expect(_lessonDetailsController.isSeatReserved, true);
      expect(
        _lessonDetailsController.reservedSeat,
        Seat(id: '6hzAdnZPnUplxyvBuXgg', name: 'A1', position: 1),
      );
    });
  });
}
