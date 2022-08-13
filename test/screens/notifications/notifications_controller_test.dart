import 'package:cinnamon_flutter_template_1/constants/dependencies.dart';
import 'package:cinnamon_flutter_template_1/screens/notifications/notifications_controller.dart';
import 'package:cinnamon_flutter_template_1/services/firebase_service.dart';
import 'package:cinnamon_flutter_template_1/services/shared_firebase_data_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../constants/mock_repository.dart';
import 'notifications_controller_test.mocks.dart';

@GenerateMocks([
  SharedFirebaseDataService,
  FirebaseService,
  User,
  DocumentReference,
])
void main() {
  late NotificationsController _notificationsController;
  final _mockFirebaseService = MockFirebaseService();
  final _mockSharedFirebaseDataService = MockSharedFirebaseDataService();

  setUp(() {
    _notificationsController = NotificationsController();

    firebaseService = _mockFirebaseService;
    sharedFirebaseDataService = _mockSharedFirebaseDataService;
  });

  tearDown(() => _notificationsController.dispose());

  group('Update notification', () {
    /// Arrange
    /// -- Mock data
    final mockUser = MockUser();
    final DocumentReference<Map<String, dynamic>> lectureRef = MockDocumentReference();

    /// -- Stubbing
    when(_mockFirebaseService.getDocumentReference(doc: anyNamed('doc'))).thenReturn(lectureRef);

    when(_mockSharedFirebaseDataService.notifications).thenReturn(MockRepository.homeNotifications);

    when(_mockFirebaseService.updateDoc(
            collection: anyNamed('collection'),
            doc: anyNamed('doc'),
            field: anyNamed('field'),
            value: anyNamed('value')))
        .thenAnswer((_) async => true);

    test('Notifications at index 1 should be removed from list', () async {
      /// -- Stubbing
      when(_mockFirebaseService.firebaseUser).thenReturn(Rx<User?>(mockUser));
      when(mockUser.uid).thenReturn('XON8xfws6bVg3FnLs2wEGl3mMPv1');

      /// Act
      final result = await _notificationsController.updateNotification(index: 1);

      /// Assert
      expect(result, true);
      expect(sharedFirebaseDataService.notifications, MockRepository.homeNotifications);

      verify(_mockFirebaseService.updateDoc(
              collection: anyNamed('collection'),
              doc: anyNamed('doc'),
              field: anyNamed('field'),
              value: anyNamed('value')))
          .called(1);
    });

    test("Notification isn't removed when user is null", () async {
      /// -- Stubbing
      when(_mockFirebaseService.firebaseUser).thenReturn(Rx<User?>(null));

      /// Act
      final result = await _notificationsController.updateNotification(index: 1);

      /// Assert
      expect(result, false);
      expect(sharedFirebaseDataService.notifications, MockRepository.homeNotifications);

      verifyNever(_mockFirebaseService.updateDoc(
              collection: anyNamed('collection'),
              doc: anyNamed('doc'),
              field: anyNamed('field'),
              value: anyNamed('value')))
          .called(0);
    });
  });

  group('Refresh notifications', () {
    /// Arrange
    /// -- Mock data
    final mockUser = MockUser();

    /// -- Stubbing
    when(_mockSharedFirebaseDataService.notifications).thenReturn(MockRepository.homeNotifications);

    when(
      _mockFirebaseService.updateDoc(
          collection: anyNamed('collection'),
          doc: anyNamed('doc'),
          field: anyNamed('field'),
          value: anyNamed('value')),
    ).thenAnswer((_) async => true);

    when(_mockSharedFirebaseDataService.getNotifications()).thenAnswer((_) async {});

    test('All notifications should be read', () async {
      /// -- Stubbing
      when(_mockFirebaseService.firebaseUser).thenReturn(Rx<User?>(mockUser));
      when(mockUser.uid).thenReturn('XON8xfws6bVg3FnLs2wEGl3mMPv1');

      /// Act
      final result = await _notificationsController.refreshNotifications();

      /// Assert
      expect(result, true);
      expect(sharedFirebaseDataService.notifications, MockRepository.homeNotifications);

      verify(_mockFirebaseService.updateDoc(
              collection: anyNamed('collection'),
              doc: anyNamed('doc'),
              field: anyNamed('field'),
              value: anyNamed('value')))
          .called(1);
    });

    test("Notifications aren't refreshed when user is null", () async {
      /// -- Stubbing
      when(_mockFirebaseService.firebaseUser).thenReturn(Rx<User?>(null));

      /// Act
      final result = await _notificationsController.refreshNotifications();

      /// Assert
      expect(result, false);
      expect(sharedFirebaseDataService.notifications, MockRepository.homeNotifications);

      verifyNever(_mockFirebaseService.updateDoc(
              collection: anyNamed('collection'),
              doc: anyNamed('doc'),
              field: anyNamed('field'),
              value: anyNamed('value')))
          .called(0);
    });
  });
}
