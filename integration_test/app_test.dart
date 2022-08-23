import 'package:cinnamon_flutter_template_1/constants/errors.dart';
import 'package:cinnamon_flutter_template_1/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'robots/calendar_robot.dart';
import 'robots/home_robot.dart';
import 'robots/lesson_details_robot.dart';
import 'robots/lesson_reservations_robot.dart';
import 'robots/lessons_robot.dart';
import 'robots/login_robot.dart';
import 'robots/navigation_bar_robot.dart';
import 'robots/notifications_robot.dart';
import 'robots/onboarding_robot.dart';
import 'robots/profile_robot.dart';
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
      final _lessonsRobot = LessonsRobot(tester);
      final _lessonDetailsRobot = LessonDetailsRobot(tester);
      final _lessonReservationsRobot = LessonReservationsRobot(tester);
      final _profileRobot = ProfileRobot(tester);

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
      //await _notificationsRobot.dismissNotification();
      await _notificationsRobot.scrollPage();
      await _notificationsRobot.refreshNotifications();
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

      /// Lessons screen
      /// --- go to lessons screen, find upcoming & past lessons, scroll page
      await _navigationBarRobot.clickNavigationBarItem(index: 1);
      await _lessonsRobot.findUpcomingLessons();
      await _lessonsRobot.scrollPageVertically();
      await _lessonsRobot.findPastLessons();

      /// Lesson details & Lesson reservations screen
      /// --- go to lesson (past) details screen, rate lesson
      await _lessonsRobot.clickOnPastLesson();
      await _lessonDetailsRobot.findLessonDetails(isPastLesson: true);
      //await _lessonDetailsRobot.scrollPageVertically();
      await _lessonDetailsRobot.rateLesson(rating: 4);

      /// --- open pdf viewer, go back
      await _lessonDetailsRobot.openPdfFile();
      await _lessonDetailsRobot.goBack();

      /// --- scroll down, go back to lessons
      await _lessonDetailsRobot.scrollPageVertically(direction: AxisDirection.down);
      await _lessonDetailsRobot.goBack();

      /// --- go to lesson (upcoming) details screen, click reserve a seat
      await _lessonsRobot.scrollPageVertically(direction: AxisDirection.down);
      await _lessonsRobot.clickOnUpcomingLesson();
      await _lessonDetailsRobot.findLessonDetails();
      await _lessonDetailsRobot.clickReserveButton();

      /// --- find seat & reserve button, make a reservation, close screen
      await _lessonReservationsRobot.findSeats();
      await _lessonReservationsRobot.findSeatLegend();
      await _lessonReservationsRobot.findReserveButton();
      await _lessonReservationsRobot.selectSeat();
      await _lessonReservationsRobot.reserveSeat();
      await _lessonReservationsRobot.closeScreen();

      /// --- find reserved seat, change reservation
      await _lessonDetailsRobot.findReservedSeat();
      await _lessonDetailsRobot.changeReservation();

      /// --- cancel reservation, close screen
      await _lessonReservationsRobot.cancelReservations();
      await _lessonReservationsRobot.closeScreen();

      /// --- find reserve button, go back
      await _lessonDetailsRobot.findReserveButton();
      await _lessonDetailsRobot.goBack();

      /// Profile screen
      /// --- find settings
      await _navigationBarRobot.clickNavigationBarItem(index: 3);
      await _profileRobot.findProfileSettings();

      /// --- toggle notifications, toggle dark mode
      await _profileRobot.toggleNotifications();
      await _profileRobot.toggleDarkMode();

      /// --- go to terms
      await _profileRobot.clickTerms();
      await _profileRobot.goBack();

      /// --- edit user info
      await _profileRobot.clickEditUserInfo();
      await _profileRobot.editProfilePicture();
      await _profileRobot.editName();
      await _profileRobot.editEmail();
      await _profileRobot.clickSaveButton();
      await _profileRobot.findUserInfo();

      /// --- edit user's goals
      await _profileRobot.clickEditGoals();
      await _profileRobot.selectGoals();
      await _profileRobot.deselectGoals();
      await _profileRobot.clickSaveButton();
      await _profileRobot.findUserGoals();

      /// --- sign out
      await _profileRobot.signOut();
    });
  });
}
