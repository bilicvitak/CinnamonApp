import 'package:cinnamon_flutter_template_1/constants/dependencies.dart';
import 'package:cinnamon_flutter_template_1/screens/lesson_reservations/lesson_reservations_controller.dart';
import 'package:mockito/annotations.dart';
import 'package:test/test.dart';

import '../home/home_controller_test.mocks.dart';

@GenerateMocks([])
void main() {
  late LessonReservationsController _lessonReservationsController;
  final _mockFirebaseService = MockFirebaseService();
  final _sharedFirebaseDataService = MockSharedFirebaseDataService();

  setUp(() {
    _lessonReservationsController = LessonReservationsController();

    firebaseService = _mockFirebaseService;
    sharedFirebaseDataService = _sharedFirebaseDataService;
  });

  tearDown(() => _lessonReservationsController.dispose());
}
