import 'package:get/get.dart';

import '../../constants/dependencies.dart';
import '../../constants/strings.dart';
import '../main_screen.dart';
import '../onboarding/onboarding_screen.dart';

class SplashController extends GetxController {
  /// ------------------------
  /// VARIABLES
  /// ------------------------

  final _whiteContainerHeight = Get.height.obs;
  final _textSlide = (-0.15).obs;
  final _logoOpacity = 0.0.obs;
  final _yellowContainerHeight = Get.height.obs;

  /// ------------------------
  /// GETTERS
  /// ------------------------

  double get whiteContainerHeight => _whiteContainerHeight.value;

  double get textSlide => _textSlide.value;

  double get logoOpacity => _logoOpacity.value;

  double get yellowContainerHeight => _yellowContainerHeight.value;

  /// ------------------------
  /// SETTERS
  /// ------------------------

  set whiteContainerHeight(double value) => _whiteContainerHeight.value = value;

  set textSlide(double value) => _textSlide.value = value;

  set logoOpacity(double value) => _logoOpacity.value = value;

  set yellowContainerHeight(double value) => _yellowContainerHeight.value = value;

  /// ------------------------
  /// INIT
  /// ------------------------

  @override
  Future<void> onInit() async {
    super.onInit();

    await runAnimation();
    await initializeStorage();

    if (firebaseService.firebaseUser.value == null) {
      await Get.offAllNamed(OnboardingScreen.routeName);
    } else {
      await Get.offAllNamed(MainScreen.routeNameTransition);
    }
  }

  /// ------------------------
  /// METHODS
  /// ------------------------

  Future<void> runAnimation() async {
    /// down drop White Container
    await Future.delayed(const Duration(seconds: 1));
    whiteContainerHeight = 0;

    /// show logo and text
    await Future.delayed(const Duration(seconds: 1));
    logoOpacity = 1;

    /// slide text
    await Future.delayed(const Duration(milliseconds: 200));
    textSlide = 0;

    /// down drop Yellow Container
    await Future.delayed(const Duration(milliseconds: 2500));
    yellowContainerHeight = 0;
  }

  Future<void> initializeStorage() async {
    final notifications = storageService.contains(key: FAStrings.notificationsKey);
    if (!notifications) {
      await storageService.insertValue(key: FAStrings.notificationsKey, value: false);
    }

    final darkMode = storageService.contains(key: FAStrings.darkModeKey);
    if (!darkMode) {
      await storageService.insertValue(key: FAStrings.darkModeKey, value: false);
    }
  }
}
