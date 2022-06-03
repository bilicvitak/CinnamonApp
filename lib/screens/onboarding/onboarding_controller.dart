import 'package:get/get.dart';

class OnboardingController extends GetxController {

  /// ------------------------
  /// VARIABLES
  /// ------------------------

  final _numberOfDots = 4.obs;
  final _currentPosition = 0.0.obs;
  final _onboardingPageHeight = Get.height.obs;

  /// ------------------------
  /// GETTERS
  /// ------------------------

  int get numberOfDots => _numberOfDots.value;
  double get currentPosition => _currentPosition.value;
  double get onboardingPageHeight => _onboardingPageHeight.value;

  /// ------------------------
  /// SETTERS
  /// ------------------------

  set numberOfDots(int value) => _numberOfDots.value = value;
  set currentPosition(double value) => _currentPosition.value = value;
  set onboardingPageHeight(double value) => _onboardingPageHeight.value = value;

  /// ------------------------
  /// METHODS
  /// ------------------------

  double validPosition(double position) {
    if (position >= numberOfDots) {
      return 0;
    }
    if (position < 0) {
      return numberOfDots - 1.0;
    }
    return position;
  }

  void updatePosition(double position) => currentPosition = validPosition(position);
}
