import 'package:cinnamon_flutter_template_1/constants/dependencies.dart';
import 'package:cinnamon_flutter_template_1/screens/custom_bottom_navigation_bar/custom_bottom_navigation_bar_controller.dart';
import 'package:cinnamon_flutter_template_1/screens/profile/profile_controller.dart';
import 'package:cinnamon_flutter_template_1/services/firebase_service.dart';
import 'package:cinnamon_flutter_template_1/services/storage_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/annotations.dart';
import 'package:test/test.dart';

import 'profile_controller_test.mocks.dart';

Map<String, dynamic> getData() => {'key': 'value'};

@GenerateMocks([
  FirebaseService,
  User,
  QuerySnapshot,
  DocumentReference,
  CustomBottomNavigationBarController,
  StorageService,
], customMocks: [
  MockSpec<DocumentSnapshot>(unsupportedMembers: {#data}, fallbackGenerators: {#data: getData}),
  MockSpec<QueryDocumentSnapshot>(unsupportedMembers: {#data}, fallbackGenerators: {#data: getData})
])
void main() {
  late ProfileController _profileController;
  final _mockFirebaseService = MockFirebaseService();
  final _mockStorageService = MockStorageService();

  setUp(() {
    _profileController = ProfileController();

    firebaseService = _mockFirebaseService;
    storageService = _mockStorageService;
  });

  tearDown(() => _profileController.dispose());
}
