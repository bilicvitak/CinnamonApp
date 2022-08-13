import 'package:cinnamon_flutter_template_1/constants/dependencies.dart';
import 'package:cinnamon_flutter_template_1/screens/login/login_controller.dart';
import 'package:cinnamon_flutter_template_1/screens/main_screen.dart';
import 'package:cinnamon_flutter_template_1/services/dio_service.dart';
import 'package:cinnamon_flutter_template_1/services/firebase_service.dart';
import 'package:cinnamon_flutter_template_1/services/logger_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart' as flutter_test;
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'login_controller_test.mocks.dart';

Map<String, dynamic> getData() => {'key': 'value'};

@GenerateMocks([
  FirebaseService,
  CollectionReference,
  QuerySnapshot,
  DioService,
], customMocks: [
  MockSpec<QueryDocumentSnapshot>(unsupportedMembers: {#data}, fallbackGenerators: {#data: getData})
])
void main() {
  late LoginController _loginController;
  final _mockFirebaseService = MockFirebaseService();

  setUp(() {
    Get.put(LoggerService());

    _loginController = LoginController();

    firebaseService = _mockFirebaseService;
  });

  tearDown(() => _loginController.dispose());

  test('Get user by email', () {
    final users = MockCollectionReference<Map<String, dynamic>>();
    final firebaseUser = MockQuerySnapshot<Map<String, dynamic>>();

    when(_mockFirebaseService.getCollectionReference(collection: anyNamed('collection')))
        .thenReturn(users);

    when(users.where(any)).thenReturn(users);

    when(users.get()).thenAnswer((_) async => firebaseUser);
  });
}
