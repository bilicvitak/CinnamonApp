import 'package:cinnamon_flutter_template_1/constants/keys.dart';
import 'package:flutter_test/flutter_test.dart';

class SplashRobot {
  final WidgetTester _tester;

  SplashRobot(this._tester);

  Future<void> findFirstYellowContainer() async {
    final splashFirstYellowContainer = find.byKey(FAKeys.splashFirstYellowContainer);

    await _tester.pumpAndSettle();

    expect(splashFirstYellowContainer, findsOneWidget);
  }

  Future<void> findWhiteContainer() async {
    final splashWhiteContainer = find.byKey(FAKeys.splashWhiteContainer);

    await _tester.pump(const Duration(seconds: 1));

    expect(splashWhiteContainer, findsOneWidget);
  }

  Future<void> findLogo() async {
    final splashLogoFull = find.byKey(FAKeys.splashLogoFull);

    await _tester.pump(const Duration(seconds: 1));

    expect(splashLogoFull, findsOneWidget);
  }

  Future<void> findSecondYellowContainer() async {
    final splashSecondYellowContainer = find.byKey(FAKeys.splashSecondYellowContainer);

    await _tester.pump(const Duration(seconds: 2));

    expect(splashSecondYellowContainer, findsOneWidget);
  }
}
