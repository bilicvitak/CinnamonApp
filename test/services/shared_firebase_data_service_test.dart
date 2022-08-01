import 'package:cinnamon_flutter_template_1/constants/dependencies.dart';
import 'package:cinnamon_flutter_template_1/services/firebase_service.dart';
import 'package:cinnamon_flutter_template_1/services/shared_firebase_data_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../constants/mock_repository.dart';
import 'shared_firebase_data_service_test.mocks.dart';

Map<String, dynamic> getData() => {'key': 'value'};

@GenerateMocks([
  FirebaseService,
  QuerySnapshot,
  User,
  DocumentReference
], customMocks: [
  MockSpec<QueryDocumentSnapshot>(
      unsupportedMembers: {#data}, fallbackGenerators: {#data: getData}),
  MockSpec<DocumentSnapshot>(unsupportedMembers: {#data}, fallbackGenerators: {#data: getData}),
])
void main() {
  final _mockFirebaseService = MockFirebaseService();

  setUp(() {
    Get.put(SharedFirebaseDataService());

    firebaseService = _mockFirebaseService;
  });

  tearDown(() => Get.delete<SharedFirebaseDataService>());

  group('Get all lessons', () {
    test("List of lessons shouldn't change when snapshot is null", () async {
      /// Arrange
      /// -- Stubbing
      when(_mockFirebaseService.getDocuments(collectionPath: anyNamed('collectionPath')))
          .thenAnswer((_) async => null);

      sharedFirebaseDataService.lessons = MockRepository.sharedFirebaseLessons;

      /// Act
      await sharedFirebaseDataService.getAllLessons();

      /// Assert
      expect(sharedFirebaseDataService.lessons, MockRepository.sharedFirebaseLessons);
    });

    test('List of lessons should be updated', () async {
      /// Arrange
      /// -- Mock data
      final QuerySnapshot<Map<String, dynamic>> querySnapshot = MockQuerySnapshot();
      final QueryDocumentSnapshot<Map<String, dynamic>> firstDoc = MockQueryDocumentSnapshot();
      final QueryDocumentSnapshot<Map<String, dynamic>> secondDoc = MockQueryDocumentSnapshot();

      /// -- Stubbing
      when(_mockFirebaseService.getDocuments(collectionPath: anyNamed('collectionPath')))
          .thenAnswer((_) async => querySnapshot);

      when(querySnapshot.docs).thenReturn([firstDoc, secondDoc]);
      when(firstDoc.data()).thenReturn(MockRepository.homeLessons[0].lessonDetails!.toJson());
      when(secondDoc.data()).thenReturn(MockRepository.homeLessons[1].lessonDetails!.toJson());

      /// Act
      await sharedFirebaseDataService.getAllLessons();

      /// Assert
      expect(sharedFirebaseDataService.lessons, MockRepository.homeLessons);
    });
  });

  group('Get notifications', () {
    /// Arrange
    /// -- Mock data
    final mockUser = MockUser();
    final DocumentSnapshot<Map<String, dynamic>> documentSnapshot = MockDocumentSnapshot();
    final DocumentReference<Map<String, dynamic>> firstDoc = MockDocumentReference();
    final DocumentReference<Map<String, dynamic>> secondDoc = MockDocumentReference();

    test("List of notifications shouldn't be updated when snapshot is null", () async {
      /// -- Stubbing
      when(_mockFirebaseService.firebaseUser).thenReturn(Rx<User?>(mockUser));
      when(mockUser.uid).thenReturn('XON8xfws6bVg3FnLs2wEGl3mMPv1');

      when(_mockFirebaseService.getDocument(docPath: anyNamed('docPath')))
          .thenAnswer((_) async => null);

      /// Act
      await sharedFirebaseDataService.getNotifications();

      /// Assert
      expect(sharedFirebaseDataService.notifications, []);
    });

    test('List of notifications should be updated', () async {
      /// -- Stubbing
      when(_mockFirebaseService.firebaseUser).thenReturn(Rx<User?>(mockUser));
      when(mockUser.uid).thenReturn('XON8xfws6bVg3FnLs2wEGl3mMPv1');

      when(_mockFirebaseService.getDocument(docPath: anyNamed('docPath')))
          .thenAnswer((_) async => documentSnapshot);

      when(_mockFirebaseService.getDocumentReference(
              doc: 'lectures/Lesson1', collection: anyNamed('collection')))
          .thenReturn(firstDoc);

      when(_mockFirebaseService.getDocumentReference(
              doc: 'lectures/Lesson2', collection: anyNamed('collection')))
          .thenReturn(secondDoc);

      when(firstDoc.path).thenReturn('lectures/Lesson1');
      when(secondDoc.path).thenReturn('lectures/Lesson2');

      when(documentSnapshot.data()).thenReturn(MockRepository.sharedFirebaseNotificationJson);

      /// Act
      await sharedFirebaseDataService.getNotifications();

      /// Assert
      expect(sharedFirebaseDataService.notifications, MockRepository.homeNotifications);
    });
  });
}
