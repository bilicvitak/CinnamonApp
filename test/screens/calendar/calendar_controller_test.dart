import 'package:cinnamon_flutter_template_1/screens/calendar/calendar_controller.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class CalendarControllerMock extends Mock implements CalendarController {
  var pageChanged = false;

  @override
  void nextPage(DateTime? dateTime) {
    if (dateTime != null) {
      pageChanged = true;
    }
  }

  @override
  void previousPage(DateTime? dateTime) {
    if (dateTime != null) {
      pageChanged = true;
    }
  }
}

void main() {
  late CalendarControllerMock _calendarController;

  setUp(() {
    _calendarController = CalendarControllerMock();
  });

  tearDown(() {
    _calendarController.dispose();
  });

  test('Calendar should jump to the next page', () {
    _calendarController.nextPage(DateTime.now());
    expect(_calendarController.pageChanged, true);
  });

  test('Calendar should not jump to the next page', () {
    _calendarController.nextPage(null);
    expect(_calendarController.pageChanged, false);
  });

  test('Calendar should jump to the previous page', () {
    _calendarController.previousPage(DateTime.now());
    expect(_calendarController.pageChanged, true);
  });

  test('Calendar should not jump to the previous page', () {
    _calendarController.previousPage(null);
    expect(_calendarController.pageChanged, false);
  });
}
