import 'package:cinnamon_flutter_template_1/constants/dependencies.dart';
import 'package:cinnamon_flutter_template_1/constants/keys.dart';
import 'package:flutter_test/flutter_test.dart';

class SplashRobot {
  final WidgetTester _tester;

  SplashRobot(this._tester);

  Future<void> findFirstYellowContainer() async {
    logger.i('[START][SPLASH] findFirstYellowContainer');

    final splashFirstYellowContainer = find.byKey(FAKeys.splashFirstYellowContainer);

    await _tester.pumpAndSettle();

    expect(splashFirstYellowContainer, findsOneWidget);

    logger.i('[FINISH][SPLASH] findFirstYellowContainer');
  }

  Future<void> findWhiteContainer() async {
    logger.i('[START][SPLASH] findWhiteContainer');

    final splashWhiteContainer = find.byKey(FAKeys.splashWhiteContainer);

    await _tester.pump(const Duration(seconds: 1));

    expect(splashWhiteContainer, findsOneWidget);

    logger.i('[FINISH][SPLASH] findWhiteContainer');
  }

  Future<void> findLogo() async {
    logger.i('[START][SPLASH] findLogo');

    final splashLogoFull = find.byKey(FAKeys.splashLogoFull);

    await _tester.pump(const Duration(seconds: 1));

    expect(splashLogoFull, findsOneWidget);

    logger.i('[FINISH][SPLASH] findLogo');
  }

  Future<void> findSecondYellowContainer() async {
    logger.i('[START][SPLASH] findSecondYellowContainer');

    final splashSecondYellowContainer = find.byKey(FAKeys.splashSecondYellowContainer);

    await _tester.pump(const Duration(seconds: 2));

    expect(splashSecondYellowContainer, findsOneWidget);

    logger.i('[FINISH][SPLASH] findSecondYellowContainer');
  }
}
