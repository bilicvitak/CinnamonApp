import 'package:cinnamon_flutter_template_1/constants/keys.dart';
import 'package:cinnamon_flutter_template_1/constants/strings.dart';
import 'package:cinnamon_flutter_template_1/widgets/outlined_gray_button.dart';
import 'package:cinnamon_flutter_template_1/widgets/seat_card.dart';
import 'package:cinnamon_flutter_template_1/widgets/white_button.dart';
import 'package:flutter_test/flutter_test.dart';

class LessonReservationsRobot {
  final WidgetTester _tester;

  LessonReservationsRobot(this._tester);

  Future<void> findSeats() async {
    final seats = find.byType(SeatCard);
    expect(seats, findsWidgets);
  }

  Future<void> findSeatLegend() async {
    final seatAvailableText = find.text(FAStrings.lessonsSeatAvailable);
    final seatNotAvailableText = find.text(FAStrings.lessonsSeatNotAvailable);
    final seatSelectedText = find.text(FAStrings.lessonsSeatSelected);

    expect(seatAvailableText, findsOneWidget);
    expect(seatNotAvailableText, findsOneWidget);
    expect(seatSelectedText, findsOneWidget);
  }

  Future<void> findReserveButton() async {
    final reserveButton = find.widgetWithText(WhiteButton, FAStrings.buttonReserve);
    final selectedSeatTitle = find.textContaining(FAStrings.lessonsSelectedSeat);

    expect(selectedSeatTitle, findsOneWidget);
    expect(reserveButton, findsOneWidget);
  }

  Future<void> selectSeat() async {
    final seat = find.byType(SeatCard).at(0);

    await _tester.tap(seat);
    await _tester.pump();

    final seatWidget = _tester.widget<SeatCard>(seat);
    final seatName = seatWidget.reservation.seat.name;
    final selectedSeat = find.textContaining('${FAStrings.lessonsSelectedSeat}\n$seatName');

    expect(seatWidget.isSelected, true);
    expect(selectedSeat, findsOneWidget);
  }

  Future<void> reserveSeat() async {
    final seat = find.byType(SeatCard).at(0);
    final reserveButton = find.widgetWithText(WhiteButton, FAStrings.buttonReserve);
    final cancelButton = find.widgetWithText(OutlinedGrayButton, FAStrings.buttonCancel);

    await _tester.tap(reserveButton);
    await _tester.pump(const Duration(milliseconds: 500));

    final seatWidget = _tester.widget<SeatCard>(seat);

    expect(reserveButton, findsNothing);
    expect(cancelButton, findsOneWidget);
    expect(seatWidget.isReserved, true);
  }

  Future<void> closeScreen() async {
    final closeButton = find.byKey(FAKeys.reservationsClose);

    await _tester.tap(closeButton);
    await _tester.pumpAndSettle();
  }

  Future<void> cancelReservations() async {
    final cancelButton = find.widgetWithText(OutlinedGrayButton, FAStrings.buttonCancel);
    final seat = find.byType(SeatCard).at(0);
    final reserveButton = find.widgetWithText(WhiteButton, FAStrings.buttonReserve);

    await _tester.tap(cancelButton);
    await _tester.pump(const Duration(milliseconds: 500));

    final seatWidget = _tester.widget<SeatCard>(seat);

    expect(cancelButton, findsNothing);
    expect(reserveButton, findsOneWidget);
    expect(seatWidget.isReserved, false);
  }
}