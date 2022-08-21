import 'package:cell_calendar/cell_calendar.dart';
import 'package:cinnamon_flutter_template_1/constants/keys.dart';
import 'package:flutter_test/flutter_test.dart';

class CalendarRobot {
  final WidgetTester tester;

  CalendarRobot(this.tester);

  Future<void> findCellCalendar() async {
    final _cellCalendar = find.byType(CellCalendar);
    expect(_cellCalendar, findsOneWidget);
  }

  Future<void> swipeLeft() async {
    final _cellCalendar = find.byType(CellCalendar);
    final _cellCalendarController =
        tester.widget<CellCalendar>(_cellCalendar).cellCalendarPageController;
    final _page = _cellCalendarController?.page;

    await tester.drag(_cellCalendar, const Offset(-500, 0));
    await tester.pumpAndSettle();

    await _findNextPage(initialPage: _page!);
  }

  Future<void> swipeRight() async {
    final _cellCalendar = find.byType(CellCalendar);
    final _cellCalendarController =
        tester.widget<CellCalendar>(_cellCalendar).cellCalendarPageController;
    final _page = _cellCalendarController?.page;

    await tester.drag(_cellCalendar, const Offset(500, 0));
    await tester.pumpAndSettle();

    await _findPreviousPage(initialPage: _page!);
  }

  Future<void> clickChevronRight() async {
    final _cellCalendar = find.byType(CellCalendar);
    final _cellCalendarController =
        tester.widget<CellCalendar>(_cellCalendar).cellCalendarPageController;
    final _page = _cellCalendarController?.page;
    final _chevronRight = find.byKey(FAKeys.calendarSwipeLeft);

    await tester.tap(_chevronRight);
    await tester.pumpAndSettle();

    await _findNextPage(initialPage: _page!);
  }

  Future<void> clickChevronLeft() async {
    final _cellCalendar = find.byType(CellCalendar);
    final _cellCalendarController =
        tester.widget<CellCalendar>(_cellCalendar).cellCalendarPageController;
    final _page = _cellCalendarController?.page;
    final _chevronLeft = find.byKey(FAKeys.calendarSwipeRight);

    await tester.tap(_chevronLeft);
    await tester.pumpAndSettle();

    await _findPreviousPage(initialPage: _page!);
  }

  Future<void> _findPreviousPage({double initialPage = 0}) async {
    final _cellCalendar = find.byType(CellCalendar);
    final _cellCalendarController =
        tester.widget<CellCalendar>(_cellCalendar).cellCalendarPageController;

    expect(_cellCalendarController?.page, initialPage - 1);
  }

  Future<void> _findNextPage({double initialPage = 0}) async {
    final _cellCalendar = find.byType(CellCalendar);
    final _cellCalendarController =
        tester.widget<CellCalendar>(_cellCalendar).cellCalendarPageController;

    expect(_cellCalendarController?.page, initialPage + 1);
  }
}
