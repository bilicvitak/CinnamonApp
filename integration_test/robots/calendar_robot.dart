import 'package:cell_calendar/cell_calendar.dart';
import 'package:cinnamon_flutter_template_1/constants/keys.dart';
import 'package:flutter_test/flutter_test.dart';

class CalendarRobot {
  final WidgetTester _tester;

  CalendarRobot(this._tester);

  Future<void> findCellCalendar() async {
    final cellCalendar = find.byType(CellCalendar);
    expect(cellCalendar, findsOneWidget);
  }

  Future<void> swipeLeft() async {
    final cellCalendar = find.byType(CellCalendar);
    final cellCalendarController =
        _tester.widget<CellCalendar>(cellCalendar).cellCalendarPageController;
    final page = cellCalendarController?.page;

    await _tester.drag(cellCalendar, const Offset(-500, 0));
    await _tester.pumpAndSettle();

    await _findNextPage(initialPage: page!);
  }

  Future<void> swipeRight() async {
    final cellCalendar = find.byType(CellCalendar);
    final cellCalendarController =
        _tester.widget<CellCalendar>(cellCalendar).cellCalendarPageController;
    final page = cellCalendarController?.page;

    await _tester.drag(cellCalendar, const Offset(500, 0));
    await _tester.pumpAndSettle();

    await _findPreviousPage(initialPage: page!);
  }

  Future<void> clickChevronRight() async {
    final cellCalendar = find.byType(CellCalendar);
    final cellCalendarController =
        _tester.widget<CellCalendar>(cellCalendar).cellCalendarPageController;
    final page = cellCalendarController?.page;
    final chevronRight = find.byKey(FAKeys.calendarSwipeLeft);

    await _tester.tap(chevronRight);
    await _tester.pumpAndSettle();

    await _findNextPage(initialPage: page!);
  }

  Future<void> clickChevronLeft() async {
    final cellCalendar = find.byType(CellCalendar);
    final cellCalendarController =
        _tester.widget<CellCalendar>(cellCalendar).cellCalendarPageController;
    final page = cellCalendarController?.page;
    final chevronLeft = find.byKey(FAKeys.calendarSwipeRight);

    await _tester.tap(chevronLeft);
    await _tester.pumpAndSettle();

    await _findPreviousPage(initialPage: page!);
  }

  Future<void> _findPreviousPage({double initialPage = 0}) async {
    final cellCalendar = find.byType(CellCalendar);
    final cellCalendarController =
        _tester.widget<CellCalendar>(cellCalendar).cellCalendarPageController;

    expect(cellCalendarController?.page, initialPage - 1);
  }

  Future<void> _findNextPage({double initialPage = 0}) async {
    final cellCalendar = find.byType(CellCalendar);
    final cellCalendarController =
        _tester.widget<CellCalendar>(cellCalendar).cellCalendarPageController;

    expect(cellCalendarController?.page, initialPage + 1);
  }
}
