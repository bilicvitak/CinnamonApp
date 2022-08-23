import 'package:flutter/material.dart';

class FAKeys {
  /// Splash screen
  static const splashWhiteContainer = Key('splashWhiteContainer');
  static const splashFirstYellowContainer = Key('splashFirstYellowContainer');
  static const splashSecondYellowContainer = Key('splashSecondYellowContainer');
  static const splashLogoFull = Key('splashLogoFull');

  /// Onboarding screen
  static const onboardingScreen = Key('onboardingScreen');
  static const onboardingRegistrationButton = Key('onboardingRegistrationButton');
  static const onboardingLoginButton = Key('onboardingLoginButton');
  static const onboardingPageView = Key('onboardingPageView');
  static const onboardingDotsIndicator = Key('onboardingDotsIndicator');
  static const onboardingLessonSchedule = Key('onboardingLessonSchedule');
  static const onboardingSeats = Key('onboardingSeats');
  static const onboardingFirstWhiteImage = Key('onboardingFirstWhiteImage');
  static const onboardingSecondWhiteImage = Key('onboardingSecondWhiteImage');

  /// Login screen
  static const loginEmail = Key('loginEmail');
  static const loginPassword = Key('loginPassword');
  static const loginButton = Key('loginButton');
  static const loginShowPassword = Key('loginShowPassword');
  static const loginForgotPassword = Key('loginForgotPassword');

  /// Home screen
  static const homeNotificationButton = Key('homeNotificationButton');
  static const homeChevronRight = Key('homeChevronRight');
  static const homeLessonTitle = Key('homeLessonTitle');
  static const homeLessonTime = Key('homeLessonTime');

  /// Notifications screen
  static final notificationsRefreshIndicator = GlobalKey<RefreshIndicatorState>();
  static const notificationsListView = Key('notificationsListView');

  /// Navigation bar
  static const navigationCalendarButton = Key('navigationCalendarButton');
  static const navigationHomeButton = Key('navigationHomeButton');
  static const navigationLessonsButton = Key('navigationLessonsButton');
  static const navigationProfileButton = Key('navigationProfileButton');

  /// Calendar screen
  static const calendarSwipeRight = Key('calendarSwipeRight');
  static const calendarSwipeLeft = Key('calendarSwipeLeft');

  /// Lessons screen
  static const lessonsScrollView = Key('lessonsScrollView');
  static const lessonsUpcomingListView = Key('lessonsUpcomingListView');
  static const lessonsPastListView = Key('lessonsPastListView');

  /// Lesson Details screen
  static const lessonDescription = Key('lessonDescription');
  static const lessonLocation = Key('lessonLocation');
  static const lessonDate = Key('lessonDate');
  static const lessonStarFilled = Key('lessonStarFilled');
  static const lessonStarEmpty = Key('lessonStarEmpty');
  static const lessonDetailsScrollView = Key('lessonDetailsScrollView');
  static const lessonAttachmentDownload = Key('lessonAttachmentDownload');
  static const lessonPdfViewer = Key('lessonPdfViewer');

  /// Lesson Reservations screen
  static const reservationsClose = Key('reservationsClose');

  /// Profile screen
  static const profilePicture = Key('profilePicture');
  static const profileFullName = Key('profileFullName');
  static const profileEmail = Key('profileEmail');
  static const profileGoalsList = Key('profileGoalsList');
  static const profileNotificationsToggle = Key('profileNotificationsToggle');
  static const profileDarkModeToggle = Key('profileDarkModeToggle');
  static const profileTermsScrollView = Key('profileTermsScrollView');
  static const profileEditFullName = Key('profileEditFullName');
  static const profileEditEmail = Key('profileEditEmail');
  static const profileNotificationsOn = Key('profileNotificationsOn');
  static const profileNotificationsOff = Key('profileNotificationsOff');
  static const profileDarkModeOff = Key('profileDarkModeOff');
  static const profileDarkModeOn = Key('profileDarkModeOn');
  static const profileGoalsContainer = Key('profileGoalsContainer');
}
