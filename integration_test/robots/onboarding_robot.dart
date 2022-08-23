import 'package:cinnamon_flutter_template_1/constants/keys.dart';
import 'package:cinnamon_flutter_template_1/constants/strings.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_test/flutter_test.dart';

class OnboardingRobot {
  final WidgetTester _tester;

  OnboardingRobot(this._tester);

  Future<void> findFirstSlide() async {
    final lessonAndSchedule = find.byKey(FAKeys.onboardingLessonSchedule);
    final onboardingFirstText = find.text(FAStrings.onboardingFirstText);

    await _tester.pumpAndSettle(const Duration(seconds: 1));

    expect(lessonAndSchedule, findsOneWidget);
    expect(onboardingFirstText, findsOneWidget);
  }

  Future<void> swipeToLeft() async {
    final onboardingPageView = find.byKey(FAKeys.onboardingPageView);
    final dotsIndicator = find.byKey(FAKeys.onboardingDotsIndicator);
    final positionBefore = _tester.widget<DotsIndicator>(dotsIndicator).position;

    await _tester.drag(onboardingPageView, const Offset(-500, 0));
    await _tester.pumpAndSettle();

    final positionAfter =  _tester.widget<DotsIndicator>(dotsIndicator).position;

    expect(positionAfter, positionBefore + 1);
  }

  Future<void> findSecondSlide() async {
    final onboardingSecondText = find.text(FAStrings.onboardingSecondText);
    final onboardingSeats = find.byKey(FAKeys.onboardingSeats);

    expect(onboardingSecondText, findsOneWidget);
    expect(onboardingSeats, findsOneWidget);
  }

  Future<void> findThirdSlide() async {
    final onboardingThirdText = find.text(FAStrings.onboardingThirdText);
    final onboardingFirstWhiteImage = find.byKey(FAKeys.onboardingFirstWhiteImage);

    expect(onboardingThirdText, findsOneWidget);
    expect(onboardingFirstWhiteImage, findsOneWidget);
  }

  Future<void> findFourthSlide() async {
    final onboardingFourthText = find.text(FAStrings.onboardingFourthText);
    final onboardingSecondWhiteImage = find.byKey(FAKeys.onboardingSecondWhiteImage);

    expect(onboardingFourthText, findsOneWidget);
    expect(onboardingSecondWhiteImage, findsOneWidget);
  }

  Future<void> clickRegistrationButton() async {
    final registrationButton = find.byKey(FAKeys.onboardingRegistrationButton);

    await _tester.ensureVisible(registrationButton);
    await _tester.tap(registrationButton);
    await _tester.pumpAndSettle();
  }

  Future<void> clickLoginButton() async {
    final loginButton = find.byKey(FAKeys.onboardingLoginButton);

    await _tester.ensureVisible(loginButton);
    await _tester.tap(loginButton);
    await _tester.pumpAndSettle();
  }
}
