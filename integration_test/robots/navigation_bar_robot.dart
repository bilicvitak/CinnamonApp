import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class NavigationBarRobot {
  final WidgetTester _tester;

  NavigationBarRobot(this._tester);

  Future<void> clickNavigationBarItem({int index = 0}) async {
    final bottomNavigationBar = _tester.widget<BottomNavigationBar>(find.byType(BottomNavigationBar));

    bottomNavigationBar.onTap!(index);
    await _tester.pumpAndSettle(const Duration(milliseconds: 500));
  }

  Future<void> findNavigationBar() async {
    final navigationBar = find.byType(BottomNavigationBar);

    await _tester.pumpAndSettle();

    expect(navigationBar, findsOneWidget);
  }
}
