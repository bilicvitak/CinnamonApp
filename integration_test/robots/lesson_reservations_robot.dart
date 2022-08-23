import 'dart:math';

import 'package:cinnamon_flutter_template_1/constants/keys.dart';
import 'package:cinnamon_flutter_template_1/constants/strings.dart';
import 'package:cinnamon_flutter_template_1/models/seat/seat.dart';
import 'package:cinnamon_flutter_template_1/widgets/outlined_gray_button.dart';
import 'package:cinnamon_flutter_template_1/widgets/seat_card.dart';
import 'package:cinnamon_flutter_template_1/widgets/white_button.dart';
import 'package:flutter_test/flutter_test.dart';

class LessonReservationsRobot {
  final WidgetTester tester;

  LessonReservationsRobot(this.tester);

  Future<void> findSeats() async {
    final _seats = find.byType(SeatCard);
    expect(_seats, findsWidgets);
  }

  Future<void> findSeatLegend() async {
    final _seatAvailableText = find.text(FAStrings.lessonsSeatAvailable);
    final _seatNotAvailableText = find.text(FAStrings.lessonsSeatNotAvailable);
    final _seatSelectedText = find.text(FAStrings.lessonsSeatSelected);

    expect(_seatAvailableText, findsOneWidget);
    expect(_seatNotAvailableText, findsOneWidget);
    expect(_seatSelectedText, findsOneWidget);
  }

  Future<void> findReserveButton() async {
    final _reserveButton = find.widgetWithText(WhiteButton, FAStrings.buttonReserve);
    final _selectedSeatTitle = find.textContaining(FAStrings.lessonsSelectedSeat);

    expect(_selectedSeatTitle, findsOneWidget);
    expect(_reserveButton, findsOneWidget);
  }

  Future<void> selectSeat() async {
    final _seat = find.byType(SeatCard).at(0);
    final _seatWidget = tester.widget<SeatCard>(_seat);
    final _position = _seatWidget.reservation.seat.name;
    final _selectedSeat = find.textContaining('${FAStrings.lessonsSelectedSeat}\n$_position');

    await tester.tap(_seat);
    await tester.pump();

    expect(_seatWidget.isSelected, true);
    expect(_selectedSeat, findsOneWidget);
  }

  Future<void> reserveSeat() async {
    final _seat = find.byType(SeatCard).at(0);
    final _seatWidget = tester.widget<SeatCard>(_seat);
    final _reserveButton = find.widgetWithText(WhiteButton, FAStrings.buttonReserve);
    final _cancelButton = find.widgetWithText(OutlinedGrayButton, FAStrings.buttonCancel);

    await tester.tap(_reserveButton);
    await tester.pump(const Duration(milliseconds: 500));

    expect(_reserveButton, findsNothing);
    expect(_cancelButton, findsOneWidget);
    expect(_seatWidget.isReserved, true);
  }

  Future<void> closeScreen() async {
    final _closeButton = find.byKey(FAKeys.reservationsClose);

    await tester.tap(_closeButton);
    await tester.pumpAndSettle();
  }

  Future<void> cancelReservations() async {
    final _cancelButton = find.widgetWithText(OutlinedGrayButton, FAStrings.buttonCancel);
    final _seat = find.byType(SeatCard).at(0);
    final _seatWidget = tester.widget<SeatCard>(_seat);
    final _reserveButton = find.widgetWithText(WhiteButton, FAStrings.buttonReserve);

    await tester.tap(_cancelButton);
    await tester.pump(const Duration(milliseconds: 500));

    expect(_cancelButton, findsNothing);
    expect(_reserveButton, findsOneWidget);
    expect(_seatWidget.isReserved, false);
  }
}