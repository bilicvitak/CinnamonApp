import 'package:cinnamon_flutter_template_1/constants/dependencies.dart';
import 'package:cinnamon_flutter_template_1/constants/keys.dart';
import 'package:flutter_test/flutter_test.dart';

class SplashRobot {
  final WidgetTester _tester;

  SplashRobot(this._tester);

  Future<void> findFirstYellowContainer() async {
    logger.i('[START] findFirstYellowContainer');

    final splashFirstYellowContainer = find.byKey(FAKeys.splashFirstYellowContainer);

    await _tester.pumpAndSettle();

    expect(splashFirstYellowContainer, findsOneWidget);

    logger.i('[FINISH] findFirstYellowContainer');
  }

  Future<void> findWhiteContainer() async {
    logger.i('[START] findWhiteContainer');

    final splashWhiteContainer = find.byKey(FAKeys.splashWhiteContainer);

    await _tester.pump(const Duration(seconds: 1));

    expect(splashWhiteContainer, findsOneWidget);

    logger.i('[FINISH] findWhiteContainer');
  }

  Future<void> findLogo() async {
    logger.i('[START] findLogo');

    final splashLogoFull = find.byKey(FAKeys.splashLogoFull);

    await _tester.pump(const Duration(seconds: 1));

    expect(splashLogoFull, findsOneWidget);

    logger.i('[FINISH] findLogo');
  }

  Future<void> findSecondYellowContainer() async {
    logger.i('[START] findSecondYellowContainer');

    final splashSecondYellowContainer = find.byKey(FAKeys.splashSecondYellowContainer);

    await _tester.pump(const Duration(seconds: 2));

    expect(splashSecondYellowContainer, findsOneWidget);

    logger.i('[FINISH] findSecondYellowContainer');
  }
}
