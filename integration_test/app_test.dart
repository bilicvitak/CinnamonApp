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
    testWidgets('First scenario - whole app', (tester) async {
      /// Initialize robots
      final splashRobot = SplashRobot(tester);
      final onboardingRobot = OnboardingRobot(tester);
      final loginRobot = LoginRobot(tester);
      final homeRobot = HomeRobot(tester);
      final notificationsRobot = NotificationsRobot(tester);
      final navigationBarRobot = NavigationBarRobot(tester);
      final calendarRobot = CalendarRobot(tester);
      final lessonsRobot = LessonsRobot(tester);
      final lessonDetailsRobot = LessonDetailsRobot(tester);
      final lessonReservationsRobot = LessonReservationsRobot(tester);
      final profileRobot = ProfileRobot(tester);

      /// Start the app
      await app.main();

      /// Splash screen
      await splashRobot.findFirstYellowContainer();
      await splashRobot.findWhiteContainer();
      await splashRobot.findLogo();
      await splashRobot.findSecondYellowContainer();

      /// Onboarding screen
      await onboardingRobot.findFirstSlide();
      await onboardingRobot.swipeToLeft();
      await onboardingRobot.findSecondSlide();
      await onboardingRobot.swipeToLeft();
      await onboardingRobot.findThirdSlide();
      await onboardingRobot.swipeToLeft();
      await onboardingRobot.findFourthSlide();
      await onboardingRobot.clickLoginButton();

      /// Login screen
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

      /// Home Screen
      /// --- find upcoming lesson, go to lesson details, go back
      await homeRobot.findUpcomingLesson();
      await homeRobot.goToUpcomingLessonDetails();
      await homeRobot.goBackToHome();

      /// --- find upcoming lesson, go to reserve seat, close & go back
      await homeRobot.findUpcomingLesson();
      await homeRobot.goToReserveSeat();
      await homeRobot.closeAndGoToHome();

      /// --- find upcoming lesson, go to notifications
      await homeRobot.findUpcomingLesson();
      await homeRobot.goToNotifications();

      /// Notifications screen
      await notificationsRobot.findNotifications();
      //await _notificationsRobot.dismissNotification();
      await notificationsRobot.scrollPage();
      await notificationsRobot.refreshNotifications();
      await notificationsRobot.closeNotifications();

      /// Calendar screen
      /// --- find bottom navigation bar, go to calendar screen, swipe left and right
      await navigationBarRobot.findNavigationBar();
      await navigationBarRobot.clickNavigationBarItem(index: 2);
      await calendarRobot.findCellCalendar();
      await calendarRobot.swipeLeft();
      await calendarRobot.clickChevronRight();
      await calendarRobot.swipeRight();
      await calendarRobot.clickChevronLeft();

      /// Lessons screen
      /// --- go to lessons screen, find upcoming & past lessons, scroll page
      await navigationBarRobot.clickNavigationBarItem(index: 1);
      await lessonsRobot.findUpcomingLessons();
      await lessonsRobot.scrollPageVertically();
      await lessonsRobot.findPastLessons();

      /// Lesson details & Lesson reservations screen
      /// --- go to lesson (past) details screen, rate lesson
      await lessonsRobot.clickOnPastLesson();
      await lessonDetailsRobot.findLessonDetails(isPastLesson: true);
      await lessonDetailsRobot.scrollPageVertically();
      await lessonDetailsRobot.rateLesson(rating: 4);

      /// --- open pdf viewer, go back
      await lessonDetailsRobot.openPdfFile();
      await lessonDetailsRobot.goBack();

      /// --- scroll down, go back to lessons
      await lessonDetailsRobot.scrollPageVertically(direction: AxisDirection.down);
      await lessonDetailsRobot.goBack();

      /// --- go to lesson (upcoming) details screen, click reserve a seat
      await lessonsRobot.scrollPageVertically(direction: AxisDirection.down);
      await lessonsRobot.clickOnUpcomingLesson();
      await lessonDetailsRobot.findLessonDetails();
      await lessonDetailsRobot.clickReserveButton();

      /// --- find seat & reserve button, make a reservation, close screen
      await lessonReservationsRobot.findSeats();
      await lessonReservationsRobot.findSeatLegend();
      await lessonReservationsRobot.findReserveButton();
      await lessonReservationsRobot.selectSeat();
      await lessonReservationsRobot.reserveSeat();
      await lessonReservationsRobot.closeScreen();

      /// --- find reserved seat, change reservation
      await lessonDetailsRobot.findReservedSeat();
      await lessonDetailsRobot.changeReservation();

      /// --- cancel reservation, close screen
      await lessonReservationsRobot.cancelReservations();
      await lessonReservationsRobot.closeScreen();

      /// --- find reserve button, go back
      await lessonDetailsRobot.findReserveButton();
      await lessonDetailsRobot.goBack();

      /// Profile screen
      /// --- find settings
      await navigationBarRobot.clickNavigationBarItem(index: 3);
      await profileRobot.findProfileSettings();

      /// --- toggle notifications, toggle dark mode
      await profileRobot.toggleNotifications();
      await profileRobot.toggleDarkMode();

      /// --- go to terms
      await profileRobot.clickTerms();
      await profileRobot.goBack();

      /// --- edit user info
      await profileRobot.clickEditUserInfo();
      await profileRobot.editProfilePicture();
      await profileRobot.editName();
      await profileRobot.editEmail();
      await profileRobot.clickSaveButton();
      await profileRobot.findUserInfo();

      /// --- edit user's goals
      await profileRobot.clickEditGoals();
      await profileRobot.selectGoals();
      await profileRobot.deselectGoals();
      await profileRobot.clickSaveButton();
      await profileRobot.findUserGoals();

      /// --- sign out
      await profileRobot.signOut();
    });

    testWidgets('Second scenario - user forgot password', (tester) async {});

    testWidgets('Third scenario - registration', (tester) async {});
  });
}
