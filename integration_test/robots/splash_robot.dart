import 'package:cinnamon_flutter_template_1/constants/keys.dart';
import 'package:flutter_test/flutter_test.dart';

class SplashRobot {
  final WidgetTester tester;

  SplashRobot(this.tester);

  Future<void> findFirstYellowContainer() async {
    final _splashFirstYellowContainer = find.byKey(FAKeys.splashFirstYellowContainer);

    await tester.pumpAndSettle();

    expect(_splashFirstYellowContainer, findsOneWidget);
  }

  Future<void> findWhiteContainer() async {
    final _splashWhiteContainer = find.byKey(FAKeys.splashWhiteContainer);

    await tester.pump(const Duration(seconds: 1));

    expect(_splashWhiteContainer, findsOneWidget);
  }

  Future<void> findLogo() async {
    final _splashLogoFull = find.byKey(FAKeys.splashLogoFull);

    await tester.pump(const Duration(seconds: 1));

    expect(_splashLogoFull, findsOneWidget);
  }

  Future<void> findSecondYellowContainer() async {
    final _splashSecondYellowContainer = find.byKey(FAKeys.splashSecondYellowContainer);

    await tester.pump(const Duration(seconds: 2));

    expect(_splashSecondYellowContainer, findsOneWidget);
  }
}
