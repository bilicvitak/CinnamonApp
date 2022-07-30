import 'package:cinnamon_flutter_template_1/constants/dependencies.dart';
import 'package:cinnamon_flutter_template_1/screens/calendar/calendar_controller.dart';
import 'package:cinnamon_flutter_template_1/services/shared_firebase_data_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../constants/mock_repository.dart';
import 'calendar_controller_test.mocks.dart';

@GenerateMocks([SharedFirebaseDataService])
void main() {
  late CalendarController _calendarController;
  final _mockSharedFirebaseDataService = MockSharedFirebaseDataService();

  setUp(() {
    _calendarController = CalendarController();

    sharedFirebaseDataService = _mockSharedFirebaseDataService;
  });

  tearDown(() {
    _calendarController.dispose();
  });

  group('Check calendar events', () {
    test('Calendar events should be empty', () async {
      when(_mockSharedFirebaseDataService.lessons).thenReturn([]);

      _calendarController.filterLessons();

      expect(_calendarController.events, []);
    });

    test('Calendar events should be filtered as lectures and code labs', () async {
      when(_mockSharedFirebaseDataService.lessons)
          .thenReturn([MockRepository.calendarLesson]);

      _calendarController.filterLessons();

      expect(_calendarController.events, MockRepository.calendarEvents);
    });
  });
}
