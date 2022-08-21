import 'dart:math';

import 'package:cinnamon_flutter_template_1/constants/keys.dart';
import 'package:cinnamon_flutter_template_1/constants/strings.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_test/flutter_test.dart';

class OnboardingRobot {
  final WidgetTester tester;

  OnboardingRobot(this.tester);

  Future<void> findFirstSlide() async {
    final _lessonAndSchedule = find.byKey(FAKeys.onboardingLessonSchedule);
    final _onboardingFirstText = find.text(FAStrings.onboardingFirstText);

    await tester.pumpAndSettle(const Duration(seconds: 1));

    expect(_lessonAndSchedule, findsOneWidget);
    expect(_onboardingFirstText, findsOneWidget);
  }

  Future<void> swipeToLeft() async {
    final _onboardingPageView = find.byKey(FAKeys.onboardingPageView);
    final _dotsIndicator = find.byKey(FAKeys.onboardingDotsIndicator);
    final _positionBefore = tester.widget<DotsIndicator>(_dotsIndicator).position;

    await tester.drag(_onboardingPageView, const Offset(-500, 0));
    await tester.pumpAndSettle();

    final _positionAfter =  tester.widget<DotsIndicator>(_dotsIndicator).position;

    expect(_positionAfter, _positionBefore + 1);
  }

  Future<void> findSecondSlide() async {
    final _onboardingSecondText = find.text(FAStrings.onboardingSecondText);
    final _onboardingSeats = find.byKey(FAKeys.onboardingSeats);

    expect(_onboardingSecondText, findsOneWidget);
    expect(_onboardingSeats, findsOneWidget);
  }

  Future<void> findThirdSlide() async {
    final _onboardingThirdText = find.text(FAStrings.onboardingThirdText);
    final _onboardingFirstWhiteImage = find.byKey(FAKeys.onboardingFirstWhiteImage);

    expect(_onboardingThirdText, findsOneWidget);
    expect(_onboardingFirstWhiteImage, findsOneWidget);
  }

  Future<void> findFourthSlide() async {
    final _onboardingFourthText = find.text(FAStrings.onboardingFourthText);
    final _onboardingSecondWhiteImage = find.byKey(FAKeys.onboardingSecondWhiteImage);

    expect(_onboardingFourthText, findsOneWidget);
    expect(_onboardingSecondWhiteImage, findsOneWidget);
  }

  Future<void> clickRegistrationButton() async {
    final _registrationButton = find.byKey(FAKeys.onboardingRegistrationButton);

    await tester.ensureVisible(_registrationButton);
    await tester.tap(_registrationButton);
    await tester.pumpAndSettle();
  }

  Future<void> clickLoginButton() async {
    final _loginButton = find.byKey(FAKeys.onboardingLoginButton);

    await tester.ensureVisible(_loginButton);
    await tester.tap(_loginButton);
    await tester.pumpAndSettle();
  }
}
