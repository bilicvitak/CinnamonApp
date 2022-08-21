import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class NavigationBarRobot {
  final WidgetTester tester;

  NavigationBarRobot(this.tester);

  Future<void> clickNavigationBarItem({int index = 0}) async {
    final _bottomNavigationBar = tester.widget<BottomNavigationBar>(find.byType(BottomNavigationBar));

    _bottomNavigationBar.onTap!(index);
    await tester.pumpAndSettle();
  }

  Future<void> findNavigationBar() async {
    final _navigationBar = find.byType(BottomNavigationBar);

    await tester.pumpAndSettle();

    expect(_navigationBar, findsOneWidget);
  }
}
