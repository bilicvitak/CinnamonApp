import 'package:cinnamon_flutter_template_1/constants/dependencies.dart';
import 'package:cinnamon_flutter_template_1/constants/errors.dart';
import 'package:cinnamon_flutter_template_1/constants/keys.dart';
import 'package:cinnamon_flutter_template_1/constants/strings.dart';
import 'package:cinnamon_flutter_template_1/widgets/yellow_back_button.dart';
import 'package:cinnamon_flutter_template_1/widgets/yellow_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

class LoginRobot {
  final WidgetTester _tester;

  LoginRobot(this._tester);

  Future<void> goBack() async {
    logger.i('[START][LOGIN] goBack');

    final backButton = find.byType(YellowBackButton);

    await _tester.tap(backButton);
    await _tester.pumpAndSettle();

    logger.i('[FINISH][LOGIN] goBack');
  }

  Future<void> enterEmail({required String email}) async {
    logger.i('[START][LOGIN] enterEmail');

    final loginEmail = find.byKey(FAKeys.loginEmail);

    await _tester.tap(loginEmail);
    await _tester.pump(const Duration(milliseconds: 500));
    await _tester.enterText(loginEmail, email);
    await _tester.pump(const Duration(seconds: 1));

    FocusManager.instance.primaryFocus?.unfocus();
    await _tester.pump(const Duration(milliseconds: 500));

    logger.i('[FINISH][LOGIN] enterEmail');
  }

  Future<void> findEmailError({bool isEmpty = false}) async {
    logger.i('[START][LOGIN] findEmailError');

    if (isEmpty) {
      final emailEmptyError = find.text(FAStrings.registrationValidationRequiredField);
      expect(emailEmptyError, findsOneWidget);
    } else {
      final emailInvalidError = find.text(FAStrings.registrationValidationValidEmail);
      expect(emailInvalidError, findsOneWidget);
    }

    logger.i('[FINISH][LOGIN] findEmailError');
  }

  Future<void> enterPassword({required String password}) async {
    logger.i('[START][LOGIN] enterPassword');

    final loginPassword = find.byKey(FAKeys.loginPassword);

    await _tester.tap(loginPassword);
    await _tester.pump(const Duration(milliseconds: 500));
    await _tester.enterText(loginPassword, password);
    await _tester.pump(const Duration(seconds: 1));

    FocusManager.instance.primaryFocus?.unfocus();
    await _tester.pump(const Duration(milliseconds: 500));

    logger.i('[FINISH][LOGIN] enterPassword');
  }

  Future<void> findPasswordError({bool isEmpty = false}) async {
    logger.i('[START][LOGIN] findPasswordError');

    if (isEmpty) {
      final passwordEmptyError = find.text(FAStrings.registrationValidationRequiredField);
      expect(passwordEmptyError, findsOneWidget);
    } else {
      final passwordInvalidError = find.text(FAStrings.registrationValidationShortPassword);
      expect(passwordInvalidError, findsOneWidget);
    }

    logger.i('[FINISH][LOGIN] findPasswordError');
  }

  Future<void> toggleObscureText() async {
    logger.i('[START][LOGIN] toggleObscureText');

    final showPassword = find.byKey(FAKeys.loginShowPassword);
    await _tester.tap(showPassword);
    await _tester.pump();

    logger.i('[FINISH][LOGIN] toggleObscureText');
  }

  Future<void> findDisabledLoginButton() async {
    logger.i('[START][LOGIN] findDisabledLoginButton');

    final loginButton = find.byKey(FAKeys.loginButton);

    expect(_tester.widget<YellowButton>(loginButton).enabled, false);

    logger.i('[FINISH][LOGIN] findDisabledLoginButton');
  }

  Future<void> clickLoginButton({int resultCode = 0}) async {
    logger.i('[START][LOGIN] clickLoginButton');

    final loginButton = find.byKey(FAKeys.loginButton);

    await _tester.ensureVisible(loginButton);
    await _tester.tap(loginButton);
    await _tester.pump(const Duration(seconds: 2));

    switch (resultCode) {
      case 0:
        final firebaseUser = firebaseService.firebaseUser.value;
        expect(firebaseUser != null, true);
        break;
      case FCErrors.userNotFound:
        final snackbar = find.widgetWithText(GetSnackBar, FAStrings.errorUserNotFound);
        expect(snackbar, findsOneWidget);
        break;
      case FCErrors.wrongPassword:
        final snackbar = find.widgetWithText(GetSnackBar, FAStrings.errorWrongPassword);
        expect(snackbar, findsOneWidget);
        break;
    }

    await _tester.pumpAndSettle();

    logger.i('[FINISH][LOGIN] clickLoginButton');
  }
}
