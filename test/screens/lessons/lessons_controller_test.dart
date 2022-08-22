
import 'package:cinnamon_flutter_template_1/constants/dependencies.dart';
import 'package:cinnamon_flutter_template_1/screens/lessons/lessons_controller.dart';
import 'package:cinnamon_flutter_template_1/services/shared_firebase_data_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../constants/mock_repository.dart';
import 'lessons_controller_test.mocks.dart';

@GenerateMocks([SharedFirebaseDataService])
void main() {
  late LessonsController _lessonsController;
  final _mockSharedFirebaseDataService = MockSharedFirebaseDataService();

  setUp(() {
    sharedFirebaseDataService = _mockSharedFirebaseDataService;
    
    _lessonsController = LessonsController();
  });

  tearDown(() {
    _lessonsController.dispose();
  });

  group('Filtering upcoming lessons', () {
    test('Upcoming lessons should be empty when empty list of lessons is passed', () {
      /// Arrange
      /// -- Stubbing
      when(_mockSharedFirebaseDataService.lessons).thenReturn([]);

      /// Act
      _lessonsController.filterUpcomingLessons();

      /// Assert
      expect(_lessonsController.upcomingLessons, []);
    });

    test('Upcoming lessons should not be empty when non-empty list of lessons is passed', () {
      /// Arrange
      /// -- Stubbing
      when(_mockSharedFirebaseDataService.lessons).thenReturn(MockRepository.lessonsLessons);

      /// Act
      _lessonsController.filterUpcomingLessons();

      /// Assert
      expect(_lessonsController.upcomingLessons, MockRepository.lessonsUpcomingLessons);
    });
  });

  group('Filtering past lessons', () {
    test('Past lessons should be empty when empty list of lessons is passed', () {
      /// Arrange
      /// -- Stubbing
      when(_mockSharedFirebaseDataService.lessons).thenReturn([]);

      /// Act
      _lessonsController.filterPastLessons();

      /// Assert
      expect(_lessonsController.pastLessons, []);
    });

    test('Past lessons should not be empty when non-empty list of lessons is passed', () {
      /// Arrange
      /// -- Stubbing
      when(_mockSharedFirebaseDataService.lessons).thenReturn(MockRepository.lessonsLessons);

      /// Act
      _lessonsController.filterPastLessons();

      /// Assert
      expect(_lessonsController.pastLessons, MockRepository.lessonsPastLessons);
    });
  });

  test('Upcoming lessons counter should be incremented', () {
    /// Arrange
    /// -- Stubbing
    when(_mockSharedFirebaseDataService.lessons).thenReturn(MockRepository.lessonsLessons);

    /// Act
    _lessonsController.countUpcomingAndPastLessons();

    /// Assert
    expect(_lessonsController.upcomingLessonsCounter, 1);
  });
}
