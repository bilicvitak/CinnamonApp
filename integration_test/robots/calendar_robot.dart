import 'package:cell_calendar/cell_calendar.dart';
import 'package:cinnamon_flutter_template_1/constants/dependencies.dart';
import 'package:cinnamon_flutter_template_1/constants/keys.dart';
import 'package:flutter_test/flutter_test.dart';

class CalendarRobot {
  final WidgetTester _tester;

  CalendarRobot(this._tester);

  Future<void> findCellCalendar() async {
    logger.i('[START][CALENDAR] findCellCalendar');

    final cellCalendar = find.byType(CellCalendar);

    await _tester.pump(const Duration(milliseconds: 500));

    expect(cellCalendar, findsOneWidget);

    logger.i('[FINISH][CALENDAR] findCellCalendar');
  }

  Future<void> swipeLeft() async {
    logger.i('[START][CALENDAR] swipeLeft');

    final cellCalendar = find.byType(CellCalendar);
    final cellCalendarController =
        _tester.widget<CellCalendar>(cellCalendar).cellCalendarPageController;
    final page = cellCalendarController?.page;

    await _tester.drag(cellCalendar, const Offset(-500, 0));
    await _tester.pumpAndSettle();

    await _findNextPage(initialPage: page!);

    logger.i('[FINISH][CALENDAR] swipeLeft');
  }

  Future<void> swipeRight() async {
    logger.i('[START][CALENDAR] swipeRight');

    final cellCalendar = find.byType(CellCalendar);
    final cellCalendarController =
        _tester.widget<CellCalendar>(cellCalendar).cellCalendarPageController;
    final page = cellCalendarController?.page;

    await _tester.drag(cellCalendar, const Offset(500, 0));
    await _tester.pumpAndSettle();

    await _findPreviousPage(initialPage: page!);

    logger.i('[FINISH][CALENDAR] swipeRight');
  }

  Future<void> clickChevronRight() async {
    logger.i('[START][CALENDAR] clickChevronRight');

    final cellCalendar = find.byType(CellCalendar);
    final cellCalendarController =
        _tester.widget<CellCalendar>(cellCalendar).cellCalendarPageController;
    final page = cellCalendarController?.page;
    final chevronRight = find.byKey(FAKeys.calendarSwipeLeft);

    await _tester.tap(chevronRight);
    await _tester.pumpAndSettle();

    await _findNextPage(initialPage: page!);

    logger.i('[FINISH][CALENDAR] clickChevronRight');
  }

  Future<void> clickChevronLeft() async {
    logger.i('[START][CALENDAR] clickChevronLeft');

    final cellCalendar = find.byType(CellCalendar);
    final cellCalendarController =
        _tester.widget<CellCalendar>(cellCalendar).cellCalendarPageController;
    final page = cellCalendarController?.page;
    final chevronLeft = find.byKey(FAKeys.calendarSwipeRight);

    await _tester.tap(chevronLeft);
    await _tester.pumpAndSettle();

    await _findPreviousPage(initialPage: page!);

    logger.i('[FINISH][CALENDAR] clickChevronLeft');
  }

  Future<void> _findPreviousPage({double initialPage = 0}) async {
    logger.i('[START][CALENDAR] _findPreviousPage');

    final cellCalendar = find.byType(CellCalendar);
    final cellCalendarController =
        _tester.widget<CellCalendar>(cellCalendar).cellCalendarPageController;

    expect(cellCalendarController?.page, initialPage - 1);

    logger.i('[FINISH][CALENDAR] _findPreviousPage');
  }

  Future<void> _findNextPage({double initialPage = 0}) async {
    logger.i('[START][CALENDAR] _findNextPage');

    final cellCalendar = find.byType(CellCalendar);
    final cellCalendarController =
        _tester.widget<CellCalendar>(cellCalendar).cellCalendarPageController;

    expect(cellCalendarController?.page, initialPage + 1);

    logger.i('[FINISH][CALENDAR] _findNextPage');
  }
}
