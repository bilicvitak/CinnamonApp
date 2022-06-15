import 'package:get/get.dart';

import '../../constants/dependencies.dart';
import '../../models/user/user.dart' as cinnamon_user;
import '../main_screen.dart';
import 'login_screen.dart';
import 'login_screens/login_screen_email_check.dart';
import 'login_screens/login_screen_finish.dart';
import 'login_screens/login_screen_new_password.dart';
import 'login_screens/login_screen_password_reset.dart';

class LoginController extends GetxController {
  static final instance = Get.find<LoginController>();

  /// ------------------------
  /// VARIABLES
  /// ------------------------

  var baseUrl = 'https://us-central1-cinnamonapp-73a64.cloudfunctions.net/sendEmailAgain?userId=';

  /// Login fields
  final _email = ''.obs;
  final _password = ''.obs;

  /// Enable button
  final _errorTextEmail = false.obs;
  final _errorTextPassword = false.obs;
  final _validated = false.obs;

  final _obscureText = true.obs;

  final _resetCode = ''.obs;
  final _newPassword = ''.obs;
  final _repeatNewPassword = ''.obs;

  late cinnamon_user.User user;

  final _errorTextNewPassword = false.obs;
  final _errorTextRepeatNewPassword = false.obs;

  final _errorUserNotFound = false.obs;
  final _errorWrongPassword = false.obs;

  final _codeVerified = false.obs;

  /// ------------------------
  /// GETTERS
  /// ------------------------

  String get email => _email.value;

  String get password => _password.value;

  bool get errorTextEmail => _errorTextEmail.value;

  bool get errorTextPassword => _errorTextPassword.value;

  bool get validated => _validated.value;

  bool get obscureText => _obscureText.value;

  String get resetCode => _resetCode.value;

  String get newPassword => _newPassword.value;

  String get repeatNewPassword => _repeatNewPassword.value;

  bool get errorTextNewPassword => _errorTextNewPassword.value;

  bool get errorTextRepeatNewPassword => _errorTextRepeatNewPassword.value;

  bool get errorUserNotFound => _errorUserNotFound.value;

  bool get errorWrongPassword => _errorWrongPassword.value;

  bool get codeVerified => _codeVerified.value;

  /// ------------------------
  /// SETTERS
  /// ------------------------

  set email(String value) => _email.value = value;

  set password(String value) => _password.value = value;

  set errorTextEmail(bool value) => _errorTextEmail.value = value;

  set errorTextPassword(bool value) => _errorTextPassword.value = value;

  set validated(bool value) => _validated.value = value;

  set obscureText(bool value) => _obscureText.value = value;

  set resetCode(String value) => _resetCode.value = value;

  set newPassword(String value) => _newPassword.value = value;

  set repeatNewPassword(String value) => _repeatNewPassword.value = value;

  set errorTextNewPassword(bool value) => _errorTextNewPassword.value = value;

  set errorTextRepeatNewPassword(bool value) => _errorTextRepeatNewPassword.value = value;

  set errorUserNotFound(bool value) => _errorUserNotFound.value = value;

  set errorWrongPassword(bool value) => _errorWrongPassword.value = value;

  set codeVerified(bool value) => _codeVerified.value = value;

  /// ------------------------
  /// METHODS
  /// ------------------------

  void goToLogIn() {
    Get.toNamed(LoginScreen.routeName);
  }

  /// login screen -> password reset screen
  void goToPasswordReset() {
    errorTextEmail = false;
    validated = false;
    Get.toNamed(LoginPasswordResetScreen.routeName);
  }

  /// email check screen -> new password screen
  void goToNewPassword() {
    Get.toNamed(LoginNewPasswordScreen.routeName);
  }

  void goToHome() {
    Get.offAllNamed(MainScreen.routeNameTransition);
  }

  /// FUNCTION: Validate login fields
  void validateLoginFields() {
    if (email.isNotEmpty) {
      errorTextEmail = true;
    }

    if (password.isNotEmpty) {
      errorTextPassword = true;
    }

    if (!email.isEmail || password.length < 6 || !password.contains(RegExp('[0-9]'))) {
      validated = false;
      return;
    }

    validated = true;
  }

  void showPassword() => obscureText = !obscureText;

  /// FUNCTION: Validate e-mail
  void validateEmail() {
    if (email.isNotEmpty) {
      errorTextEmail = true;
    }

    if (!email.isEmail) {
      validated = false;
      return;
    }

    validated = true;
  }

  /// FUNCTION: Sign In
  Future<void> signIn() async {
    final success = await firebaseService.signIn(email, password);

    if (success) {
      await Get.toNamed(MainScreen.routeName);
    }
  }

  /// FUNCTION: Get user by email
  Future<cinnamon_user.User> _getUserByEmail() async {
    final firebaseUsers = await firebaseService
        .getCollectionReference(collection: firebaseService.usersCollection)
        .where('email', isEqualTo: email)
        .get();

    return cinnamon_user.User.fromJson(firebaseUsers.docs.single.data());
  }

  /// FUNCTION: Send email with code to reset the password
  Future<void> sendEmailPasswordReset() async {
    user = await _getUserByEmail();

    final data = baseUrl + user.id;
    await dioService.getURL(Uri.parse(data).toString());

    await firebaseService.firebaseFirestore
        .collection(firebaseService.usersCollection)
        .doc(user.id)
        .update({'codeIsVerified': false});

    await Get.toNamed(LoginCheckYourEmailScreen.routeName);
  }

  /// FUNCTION: Check code validation
  Future<void> validateAccount() async {
    codeVerified = await firebaseService.validateAccount(resetCode, user.id);

    if (!codeVerified) {
      Get.snackbar('Error', 'Account validation not successful');
    }
  }

  /// FUNCTION: Save new password
  Future<void> resetPassword() async {
    final signInSuccess = await firebaseService.signIn(email, user.password!);

    if (signInSuccess) {
      final changePasswordSuccess =
          await firebaseService.changePassword(email, newPassword, user.id);

      if (changePasswordSuccess) {
        await Get.offAllNamed(LoginFinishScreen.routeName);
      }
    }
  }
}
