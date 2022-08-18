import 'package:cinnamon_flutter_template_1/constants/keys.dart';
import 'package:cinnamon_flutter_template_1/constants/strings.dart';
import 'package:cinnamon_flutter_template_1/main.dart' as app;
import 'package:cinnamon_flutter_template_1/screens/onboarding/onboarding_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Splash screen and onboarding', () {
    testWidgets('splash screen is loaded', (tester) async {
      /// Arrange
      final _splashFirstYellowContainer = find.byKey(FAKeys.splashFirstYellowContainer);
      final _splashWhiteContainer = find.byKey(FAKeys.splashWhiteContainer);
      final _splashLogoFull = find.byKey(FAKeys.splashLogoFull);
      final _splashSecondYellowContainer = find.byKey(FAKeys.splashSecondYellowContainer);

      /// Act
      await app.main();
      await tester.pumpAndSettle();

      /// Assert
      expect(_splashFirstYellowContainer, findsOneWidget);
      await tester.pump(const Duration(seconds: 1));
      expect(_splashWhiteContainer, findsOneWidget);
      await tester.pump(const Duration(seconds: 1));
      expect(_splashLogoFull, findsOneWidget);
      await tester.pump(const Duration(seconds: 2));
      expect(_splashSecondYellowContainer, findsOneWidget);
    });

    testWidgets('onboarding screen is loaded', (tester) async {
      /// Arrange
      await app.main();

      final _appBar = find.byKey(FAKeys.appBar);
      final _lessonAndSchedule = find.byKey(FAKeys.onboardingLessonSchedule);
      final _onboardingFirstText = find.text(FAStrings.onboardingFirstText);
      final _dotsIndicator = find.byKey(FAKeys.onboardingDotsIndicator);
      final _registrationButton = find.byKey(FAKeys.onboardingRegistrationButton);
      final _loginButton = find.byKey(FAKeys.onboardingLoginButton);

      /// Act
      await tester.pumpAndSettle(const Duration(seconds: 4));

      /// Assert
      expect(_appBar, findsOneWidget);
      expect(_lessonAndSchedule, findsOneWidget);
      expect(_onboardingFirstText, findsOneWidget);
      expect(_dotsIndicator, findsOneWidget);
      expect(Get.find<OnboardingController>().currentPosition, 0);
      expect(_registrationButton, findsOneWidget);
      expect(_loginButton, findsOneWidget);
    });

    testWidgets('change slides on swiping on onboarding screen', (tester) async {
      /// Arrange
      await app.main();
      await tester.pumpAndSettle(const Duration(seconds: 4));

      final _onboardingController = Get.find<OnboardingController>();
      final _onboardingPageView = find.byKey(FAKeys.onboardingPageView);
      final _onboardingSecondText = find.text(FAStrings.onboardingSecondText);
      final _onboardingThirdText = find.text(FAStrings.onboardingThirdText);
      final _onboardingFourthText = find.text(FAStrings.onboardingFourthText);
      final _onboardingSeats = find.byKey(FAKeys.onboardingSeats);
      final _onboardingFirstWhiteImage = find.byKey(FAKeys.onboardingFirstWhiteImage);
      final _onboardingSecondWhiteImage = find.byKey(FAKeys.onboardingSecondWhiteImage);

      /// Act & Assert
      /// --- second slide
      await tester.drag(_onboardingPageView, const Offset(-500, 0));
      await tester.pumpAndSettle();

      expect(_onboardingController.currentPosition, 1);
      expect(_onboardingSecondText, findsOneWidget);
      expect(_onboardingSeats, findsOneWidget);

      /// --- third slide
      await tester.drag(_onboardingPageView, const Offset(-500, 0));
      await tester.pumpAndSettle();

      expect(_onboardingController.currentPosition, 2);
      expect(_onboardingThirdText, findsOneWidget);
      expect(_onboardingFirstWhiteImage, findsOneWidget);

      /// --- fourth slide
      await tester.drag(_onboardingPageView, const Offset(-500, 0));
      await tester.pumpAndSettle();

      expect(_onboardingController.currentPosition, 3);
      expect(_onboardingFourthText, findsOneWidget);
      expect(_onboardingSecondWhiteImage, findsOneWidget);
    });
  });
}
