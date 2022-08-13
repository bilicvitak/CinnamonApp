import 'package:cinnamon_flutter_template_1/screens/custom_bottom_navigation_bar/custom_bottom_navigation_bar_controller.dart';
import 'package:cinnamon_flutter_template_1/screens/registration/registration_controller.dart';
import 'package:cinnamon_flutter_template_1/services/dio_service.dart';
import 'package:cinnamon_flutter_template_1/services/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/annotations.dart';
import 'package:test/test.dart';

Map<String, dynamic> getData() => {'key': 'value'};

@GenerateMocks([
  FirebaseService,
  User,
  DioService,
  CustomBottomNavigationBarController,
  QuerySnapshot,
  DocumentReference
], customMocks: [
  MockSpec<QueryDocumentSnapshot>(unsupportedMembers: {#data}, fallbackGenerators: {#data: getData})
])
void main() {
  late RegistrationController _registrationController;

  setUp(() {
    _registrationController = RegistrationController();
  });

  tearDown(() => _registrationController.dispose());
}
