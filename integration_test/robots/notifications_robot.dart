import 'package:cinnamon_flutter_template_1/constants/dependencies.dart';
import 'package:cinnamon_flutter_template_1/constants/keys.dart';
import 'package:cinnamon_flutter_template_1/constants/strings.dart';
import 'package:cinnamon_flutter_template_1/widgets/notification_card.dart';
import 'package:cinnamon_flutter_template_1/widgets/yellow_close_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class NotificationsRobot {
  final WidgetTester tester;

  NotificationsRobot(this.tester);

  Future<void> findNotifications() async {
    final _notificationTitle = find.text(FAStrings.notificationsNotifications);
    final _notificationCards = find.byType(NotificationCard);

    expect(_notificationTitle, findsOneWidget);
    expect(_notificationCards, findsWidgets);
  }

  Future<void> refreshNotifications() async {
    final _refreshIndicator = find.byKey(FAKeys.notificationsRefreshIndicator);

    await tester.drag(_refreshIndicator, const Offset(0, 500));
    await tester.pump();

    expect(FAKeys.notificationsRefreshIndicator.currentState != null, true);
  }

  Future<void> scrollPage() async {
    final _listView = find.byKey(FAKeys.notificationsListView);
    final _initialPosition = tester.getCenter(_listView);

    await tester.drag(_listView, const Offset(0, -500));
    await tester.pumpAndSettle();

    final _newPosition = tester.getCenter(_listView);

    expect(_newPosition.dy < _initialPosition.dy, true);
  }

  Future<void> dismissNotification() async {
    final _notificationCard = find.byType(Dismissible).at(0);

    await tester.drag(_notificationCard, const Offset(-200, 0));
    await tester.pumpAndSettle();

    /// TODO: Add assert
  }

  Future<void> closeNotifications() async {
    final _yellowCloseButton = find.byType(YellowCloseButton);

    await tester.ensureVisible(_yellowCloseButton);
    await tester.tap(_yellowCloseButton);
    await tester.pumpAndSettle();
  }
}
