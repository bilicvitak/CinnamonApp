import 'package:get/get.dart';

import '../../constants/dependencies.dart';
import '../../constants/errors.dart';
import '../../constants/firestore_collections.dart';
import '../../constants/strings.dart';
import '../../models/user/user.dart' as cinnamon_user;
import '../main_screen.dart';
import 'login_screen.dart';
import 'login_screens/login_screen_email_check.dart';
import 'login_screens/login_screen_finish.dart';
import 'login_screens/login_screen_new_password.dart';
import 'login_screens/login_screen_password_reset.dart';

class LoginController extends GetxController {
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

  cinnamon_user.User? user;

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

  void goToLogIn() => Get.toNamed(LoginScreen.routeName);

  /// login screen -> password reset screen
  void goToPasswordReset() {
    errorTextEmail = false;
    validated = false;
    Get.toNamed(LoginPasswordResetScreen.routeName);
  }

  /// email check screen -> new password screen
  void goToNewPassword() => Get.toNamed(LoginNewPasswordScreen.routeName);

  void goToHome() => Get.offAllNamed(MainScreen.routeNameTransition);

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

  /// FUNCTION: Show/hide password
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
    final resultCode = await firebaseService.signIn(email, password);

    switch (resultCode) {
      case 0:
        await Get.toNamed(MainScreen.routeName);
        break;
      case FCErrors.userNotFound:
        Get.snackbar(FAStrings.errorError, FAStrings.errorUserNotFound);
        break;
      case FCErrors.wrongPassword:
        Get.snackbar(FAStrings.errorError, FAStrings.errorWrongPassword);
        break;
      case FCErrors.loginFail:
        Get.snackbar(FAStrings.errorError, FAStrings.errorLoginFail);
        break;
    }
  }

  /// FUNCTION: Get user by email
  Future<cinnamon_user.User?> getUserByEmail() async {
    try {
      final firebaseUsers = await firebaseService
          .getCollectionReference(collection: FCFirestoreCollections.usersCollection)
          .where('email', isEqualTo: email)
          .get();

      if (firebaseUsers.docs.isNotEmpty) {
        return cinnamon_user.User.fromJson(firebaseUsers.docs.single.data());
      }
    } catch (e) {
      logger.e(e);
    }

    return null;
  }

  /// FUNCTION: Send email with code to reset the password
  Future<void> sendEmailPasswordReset() async {
    user = await getUserByEmail();

    if (user == null) {
      return;
    }

    final data = baseUrl + user!.id;
    await dioService.getURL(Uri.parse(data).toString());

    final success = await firebaseService.updateDoc(
        collection: FCFirestoreCollections.usersCollection,
        doc: user!.id,
        field: 'codeIsVerified',
        value: false);

    if (success) {
      await Get.toNamed(LoginCheckYourEmailScreen.routeName);
    } else {
      Get.snackbar('Try again later', 'Please try to reset the password later!');
    }
  }

  /// FUNCTION: Check code validation
  Future<void> validateAccount() async {
    if (user == null) {
      return;
    }

    final resultCode = await firebaseService.validateAccount(code: resetCode, userId: user!.id);

    switch (resultCode) {
      case 0:
        codeVerified = true;
        break;
      case FCErrors.wrongCode:
        Get.snackbar(FAStrings.errorError, FAStrings.errorWrongCode);
        break;
      case FCErrors.validationFail:
        Get.snackbar(FAStrings.errorError, FAStrings.errorValidationFail);
        break;
    }
  }

  /// FUNCTION: Save new password
  Future<void> resetPassword() async {
    if (user == null) {
      return;
    }

    await firebaseService.logOut();
    final resultCode = await firebaseService.signIn(email, user!.password!);

    if (resultCode == 0) {
      final changePasswordSuccess =
          await firebaseService.changePassword(email, newPassword, user!.id);

      if (changePasswordSuccess) {
        await Get.offAllNamed(LoginFinishScreen.routeName);
      } else {
        Get.snackbar(FAStrings.errorError, FAStrings.errorPasswordResetFail);
      }
    }
  }
}
