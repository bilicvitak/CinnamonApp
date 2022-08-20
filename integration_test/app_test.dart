import 'package:cinnamon_flutter_template_1/constants/errors.dart';
import 'package:cinnamon_flutter_template_1/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'robots/login_robot.dart';
import 'robots/onboarding_robot.dart';
import 'robots/splash_robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Integration tests', () {
    testWidgets('First scenario', (tester) async {
      /// Start the app
      await app.main();

      /// Splash screen
      final splashRobot = SplashRobot(tester);
      await splashRobot.findFirstYellowContainer();
      await splashRobot.findWhiteContainer();
      await splashRobot.findLogo();
      await splashRobot.findSecondYellowContainer();

      /// Onboarding screen
      final onboardingRobot = OnboardingRobot(tester);
      await onboardingRobot.findFirstSlide();
      await onboardingRobot.swipeToLeft();
      await onboardingRobot.findSecondSlide();
      await onboardingRobot.swipeToLeft();
      await onboardingRobot.findThirdSlide();
      await onboardingRobot.swipeToLeft();
      await onboardingRobot.findFourthSlide();
      await onboardingRobot.clickLoginButton();

      /// Login screen
      final loginRobot = LoginRobot(tester);
      await loginRobot.goBack();
      await onboardingRobot.clickLoginButton();

      /// --- invalid email and password
      await loginRobot.enterEmail(email: 'ivapapac22');
      await loginRobot.findEmailError();

      await loginRobot.enterPassword(password: '1234');
      await loginRobot.findPasswordError();

      await loginRobot.findDisabledLoginButton();

      /// --- user does not exist
      await loginRobot.enterEmail(email: 'ivo.ivic@gmail.com');
      await loginRobot.enterPassword(password: 'lozinka1234');
      await loginRobot.clickLoginButton(resultCode: FCErrors.userNotFound);

      /// --- wrong password
      await loginRobot.enterEmail(email: 'ivapapac22@gmail.com');
      await loginRobot.enterPassword(password: 'lozinka1234');
      await loginRobot.clickLoginButton(resultCode: FCErrors.wrongPassword);

      /// --- valid user
      await loginRobot.enterEmail(email: 'ivapapac22@gmail.com');
      await loginRobot.toggleObscureText();
      await loginRobot.enterPassword(password: 'cinnamon12');
      await loginRobot.clickLoginButton();

      /// Main Screen
    });
  });
}
