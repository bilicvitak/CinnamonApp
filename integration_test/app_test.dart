import 'package:cinnamon_flutter_template_1/constants/errors.dart';
import 'package:cinnamon_flutter_template_1/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'robots/calendar_robot.dart';
import 'robots/home_robot.dart';
import 'robots/login_robot.dart';
import 'robots/navigation_bar_robot.dart';
import 'robots/notifications_robot.dart';
import 'robots/onboarding_robot.dart';
import 'robots/splash_robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Integration tests', () {
    testWidgets('First scenario', (tester) async {

      /// Initialize robots
      final _splashRobot = SplashRobot(tester);
      final _onboardingRobot = OnboardingRobot(tester);
      final _loginRobot = LoginRobot(tester);
      final _homeRobot = HomeRobot(tester);
      final _notificationsRobot = NotificationsRobot(tester);
      final _navigationBarRobot = NavigationBarRobot(tester);
      final _calendarRobot = CalendarRobot(tester);

      /// Start the app
      await app.main();

      /// Splash screen
      await _splashRobot.findFirstYellowContainer();
      await _splashRobot.findWhiteContainer();
      await _splashRobot.findLogo();
      await _splashRobot.findSecondYellowContainer();

      /// Onboarding screen
      await _onboardingRobot.findFirstSlide();
      await _onboardingRobot.swipeToLeft();
      await _onboardingRobot.findSecondSlide();
      await _onboardingRobot.swipeToLeft();
      await _onboardingRobot.findThirdSlide();
      await _onboardingRobot.swipeToLeft();
      await _onboardingRobot.findFourthSlide();
      await _onboardingRobot.clickLoginButton();

      /// Login screen
      await _loginRobot.goBack();
      await _onboardingRobot.clickLoginButton();

      /// --- invalid email and password
      await _loginRobot.enterEmail(email: 'ivapapac22');
      await _loginRobot.findEmailError();

      await _loginRobot.enterPassword(password: '1234');
      await _loginRobot.findPasswordError();

      await _loginRobot.findDisabledLoginButton();

      /// --- user does not exist
      await _loginRobot.enterEmail(email: 'ivo.ivic@gmail.com');
      await _loginRobot.enterPassword(password: 'lozinka1234');
      await _loginRobot.clickLoginButton(resultCode: FCErrors.userNotFound);

      /// --- wrong password
      await _loginRobot.enterEmail(email: 'ivapapac22@gmail.com');
      await _loginRobot.enterPassword(password: 'lozinka1234');
      await _loginRobot.clickLoginButton(resultCode: FCErrors.wrongPassword);

      /// --- valid user
      await _loginRobot.enterEmail(email: 'ivapapac22@gmail.com');
      await _loginRobot.toggleObscureText();
      await _loginRobot.enterPassword(password: 'cinnamon12');
      await _loginRobot.clickLoginButton();

      /// Home Screen
      /// --- find upcoming lesson, go to lesson details, go back
      await _homeRobot.findUpcomingLesson();
      await _homeRobot.goToUpcomingLessonDetails();
      await _homeRobot.goBackToHome();

      /// --- find upcoming lesson, go to reserve seat, close & go back
      await _homeRobot.findUpcomingLesson();
      await _homeRobot.goToReserveSeat();
      await _homeRobot.closeAndGoToHome();

      /// --- find upcoming lesson, go to notifications
      await _homeRobot.findUpcomingLesson();
      await _homeRobot.goToNotifications();

      /// Notifications screen
      await _notificationsRobot.findNotifications();
      await _notificationsRobot.scrollPage();
      await _notificationsRobot.refreshNotifications();
      await _notificationsRobot.dismissNotification();
      await _notificationsRobot.closeNotifications();

      /// Calendar screen
      /// --- find bottom navigation bar, go to calendar screen, swipe left and right
      await _navigationBarRobot.findNavigationBar();
      await _navigationBarRobot.clickNavigationBarItem(index: 2);
      await _calendarRobot.findCellCalendar();
      await _calendarRobot.swipeLeft();
      await _calendarRobot.clickChevronRight();
      await _calendarRobot.swipeRight();
      await _calendarRobot.clickChevronLeft();
    });
  });
}
