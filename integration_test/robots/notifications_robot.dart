import 'package:cinnamon_flutter_template_1/constants/keys.dart';
import 'package:cinnamon_flutter_template_1/constants/strings.dart';
import 'package:cinnamon_flutter_template_1/widgets/notification_card.dart';
import 'package:cinnamon_flutter_template_1/widgets/yellow_close_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class NotificationsRobot {
  final WidgetTester _tester;

  NotificationsRobot(this._tester);

  Future<void> findNotifications() async {
    final notificationTitle = find.text(FAStrings.notificationsNotifications);
    final notificationCards = find.byType(NotificationCard);

    expect(notificationTitle, findsOneWidget);
    expect(notificationCards, findsWidgets);
  }

  Future<void> refreshNotifications() async {
    final refreshIndicator = find.byKey(FAKeys.notificationsRefreshIndicator);

    await _tester.drag(refreshIndicator, const Offset(0, 500));
    await _tester.pump();

    expect(FAKeys.notificationsRefreshIndicator.currentState != null, true);
  }

  Future<void> scrollPage() async {
    final listView = find.byKey(FAKeys.notificationsListView);
    final initialPosition = _tester.getCenter(listView);

    await _tester.drag(listView, const Offset(0, -500));
    await _tester.pumpAndSettle();

    final newPosition = _tester.getCenter(listView);

    expect(newPosition.dy < initialPosition.dy, true);
  }

  Future<void> dismissNotification() async {
    final notificationCard = find.byType(Dismissible).at(0);
    final key = _tester.widget<Dismissible>(notificationCard).key;

    await _tester.timedDrag(notificationCard, const Offset(-500, 0), const Duration(milliseconds: 500));
    await _tester.pumpAndSettle();

    expect(find.byKey(key!), findsNothing);
  }

  Future<void> closeNotifications() async {
    final yellowCloseButton = find.byType(YellowCloseButton);

    await _tester.ensureVisible(yellowCloseButton);
    await _tester.tap(yellowCloseButton);
    await _tester.pumpAndSettle();
  }
}
