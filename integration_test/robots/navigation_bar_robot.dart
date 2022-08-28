import 'package:cinnamon_flutter_template_1/constants/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class NavigationBarRobot {
  final WidgetTester _tester;

  NavigationBarRobot(this._tester);

  Future<void> clickNavigationBarItem({int index = 0}) async {
    logger.i('[START][NAVIGATION BAR] clickNavigationBarItem');

    final bottomNavigationBar = _tester.widget<BottomNavigationBar>(find.byType(BottomNavigationBar));

    bottomNavigationBar.onTap!(index);
    await _tester.pumpAndSettle(const Duration(milliseconds: 500));

    logger.i('[FINISH][NAVIGATION BAR] clickNavigationBarItem');
  }

  Future<void> findNavigationBar() async {
    logger.i('[START][NAVIGATION BAR] findNavigationBar');

    final navigationBar = find.byType(BottomNavigationBar);

    await _tester.pumpAndSettle();

    expect(navigationBar, findsOneWidget);

    logger.i('[FINISH][NAVIGATION BAR] findNavigationBar');
  }
}
