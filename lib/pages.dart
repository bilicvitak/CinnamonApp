import 'package:get/get.dart';

import 'screens/lesson_details/lesson_details_bindings.dart';
import 'screens/lesson_details/lesson_details_screens/lesson_screen_pdf_viewer.dart';
import 'screens/lesson_details/lesson_screen_details.dart';
import 'screens/lesson_reservations/lesson_reservations_bindings.dart';
import 'screens/lesson_reservations/lesson_screen_reservations.dart';
import 'screens/login/login_bindings.dart';
import 'screens/login/login_screen.dart';
import 'screens/login/login_screens/login_screen_email_check.dart';
import 'screens/login/login_screens/login_screen_finish.dart';
import 'screens/login/login_screens/login_screen_new_password.dart';
import 'screens/login/login_screens/login_screen_password_reset.dart';
import 'screens/main_screen.dart';
import 'screens/notifications/notifications_binding.dart';
import 'screens/notifications/notifications_screen.dart';
import 'screens/onboarding/onboarding_binding.dart';
import 'screens/onboarding/onboarding_screen.dart';
import 'screens/profile/profile_binding.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/profile/profile_screens/profile_screen_edit.dart';
import 'screens/profile/profile_screens/profile_screen_goals.dart';
import 'screens/profile/profile_screens/profile_screen_terms.dart';
import 'screens/registration/registration_binding.dart';
import 'screens/registration/registration_screen.dart';
import 'screens/registration/registration_screens/registration_screen_code.dart';
import 'screens/registration/registration_screens/registration_screen_finish.dart';
import 'screens/registration/registration_screens/registration_screen_goals.dart';
import 'screens/registration/registration_screens/registration_screen_notifications.dart';
import 'screens/registration/registration_screens/registration_screen_profile_picture.dart';
import 'screens/splash/splash_binding.dart';
import 'screens/splash/splash_screen.dart';

final pages = [
  GetPage(
    name: SplashScreen.routeName,
    page: () => SplashScreen(),
    binding: SplashBinding(),
  ),
  GetPage(
    name: OnboardingScreen.routeName,
    page: () => OnboardingScreen(),
    binding: OnboardingBinding(),
    transition: Transition.upToDown,
    transitionDuration: const Duration(seconds: 1),
  ),
  GetPage(
    name: RegistrationScreen.routeName,
    page: () => RegistrationScreen(),
    binding: RegistrationBinding(),
  ),
  GetPage(
    name: RegistrationScreenCode.routeName,
    page: () => RegistrationScreenCode(),
    binding: RegistrationBinding(),
  ),
  GetPage(
    name: RegistrationScreenProfilePicture.routeName,
    page: () => RegistrationScreenProfilePicture(),
    binding: RegistrationBinding(),
  ),
  GetPage(
    name: RegistrationScreenGoals.routeName,
    page: () => RegistrationScreenGoals(),
    binding: RegistrationBinding(),
  ),
  GetPage(
    name: RegistrationScreenNotifications.routeName,
    page: () => RegistrationScreenNotifications(),
    binding: RegistrationBinding(),
  ),
  GetPage(
    name: RegistrationScreenFinish.routeName,
    page: () => RegistrationScreenFinish(),
    binding: RegistrationBinding(),
  ),
  GetPage(
    name: LoginScreen.routeName,
    page: () => LoginScreen(),
    binding: LoginBinding(),
  ),
  GetPage(
    name: LoginPasswordResetScreen.routeName,
    page: () => LoginPasswordResetScreen(),
    binding: LoginBinding(),
  ),
  GetPage(
    name: LoginCheckYourEmailScreen.routeName,
    page: () => LoginCheckYourEmailScreen(),
    binding: LoginBinding(),
  ),
  GetPage(
    name: LoginNewPasswordScreen.routeName,
    page: () => LoginNewPasswordScreen(),
    binding: LoginBinding(),
  ),
  GetPage(
    name: LoginFinishScreen.routeName,
    page: () => LoginFinishScreen(),
    binding: LoginBinding(),
  ),
  GetPage(
    name: MainScreen.routeNameTransition,
    page: () => MainScreen(),
    transition: Transition.upToDown,
    transitionDuration: const Duration(seconds: 1),
  ),
  GetPage(
    name: MainScreen.routeName,
    page: () => MainScreen(),
  ),
  GetPage(
    name: LessonScreenDetails.routeName,
    page: () => LessonScreenDetails(),
    binding: LessonDetailsBinding(),
  ),
  GetPage(
    name: LessonScreenPdfViewer.routeName,
    page: () => LessonScreenPdfViewer(),
    binding: LessonDetailsBinding(),
  ),
  GetPage(
    name: LessonScreenReservations.routeName,
    page: () => LessonScreenReservations(),
    binding: LessonReservationsBinding(),
  ),
  GetPage(
    name: ProfileScreen.routeName,
    page: () => ProfileScreen(),
    binding: ProfileBinding(),
  ),
  GetPage(
    name: ProfileScreenTerms.routeName,
    page: () => ProfileScreenTerms(),
    binding: ProfileBinding(),
  ),
  GetPage(
    name: ProfileScreenGoals.routeName,
    page: () => ProfileScreenGoals(),
    binding: ProfileBinding(),
  ),
  GetPage(
    name: ProfileScreenEdit.routeName,
    page: () => ProfileScreenEdit(),
    binding: ProfileBinding(),
  ),
  GetPage(
    name: NotificationsScreen.routeName,
    page: () => NotificationsScreen(),
    binding: NotificationsBinding(),
  ),
];
