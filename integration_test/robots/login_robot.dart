import 'dart:async';
import 'dart:math';

import 'package:cinnamon_flutter_template_1/constants/dependencies.dart';
import 'package:cinnamon_flutter_template_1/constants/errors.dart';
import 'package:cinnamon_flutter_template_1/constants/keys.dart';
import 'package:cinnamon_flutter_template_1/constants/strings.dart';
import 'package:cinnamon_flutter_template_1/widgets/yellow_back_button.dart';
import 'package:cinnamon_flutter_template_1/widgets/yellow_button.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

class LoginRobot {
  final WidgetTester _tester;

  LoginRobot(this._tester);

  Future<void> goBack() async {
    final backButton = find.byType(YellowBackButton);

    await _tester.tap(backButton);
    await _tester.pumpAndSettle();
  }

  Future<void> enterEmail({required String email}) async {
    final loginEmail = find.byKey(FAKeys.loginEmail);

    await _tester.tap(loginEmail);
    await _tester.pump(const Duration(milliseconds: 500));
    await _tester.enterText(loginEmail, email);
    await _tester.pump(const Duration(seconds: 1));

    FocusManager.instance.primaryFocus?.unfocus();
    await _tester.pump(const Duration(milliseconds: 500));
  }

  Future<void> findEmailError({bool isEmpty = false}) async {
    if (isEmpty) {
      final emailEmptyError = find.text(FAStrings.registrationValidationRequiredField);
      expect(emailEmptyError, findsOneWidget);
    } else {
      final emailInvalidError = find.text(FAStrings.registrationValidationValidEmail);
      expect(emailInvalidError, findsOneWidget);
    }
  }

  Future<void> enterPassword({required String password}) async {
    final loginPassword = find.byKey(FAKeys.loginPassword);

    await _tester.tap(loginPassword);
    await _tester.pump(const Duration(milliseconds: 500));
    await _tester.enterText(loginPassword, password);
    await _tester.pump(const Duration(seconds: 1));

    FocusManager.instance.primaryFocus?.unfocus();
    await _tester.pump(const Duration(milliseconds: 500));
  }

  Future<void> findPasswordError({bool isEmpty = false}) async {
    if (isEmpty) {
      final passwordEmptyError = find.text(FAStrings.registrationValidationRequiredField);
      expect(passwordEmptyError, findsOneWidget);
    } else {
      final passwordInvalidError = find.text(FAStrings.registrationValidationShortPassword);
      expect(passwordInvalidError, findsOneWidget);
    }
  }

  Future<void> toggleObscureText() async {
    final showPassword = find.byKey(FAKeys.loginShowPassword);
    await _tester.tap(showPassword);
    await _tester.pump();
  }

  Future<void> findDisabledLoginButton() async {
    final loginButton = find.byKey(FAKeys.loginButton);

    expect(_tester.widget<YellowButton>(loginButton).enabled, false);
  }

  Future<void> clickLoginButton({int resultCode = 0}) async {
    final loginButton = find.byKey(FAKeys.loginButton);

    await _tester.ensureVisible(loginButton);
    await _tester.tap(loginButton);

    fakeAsync((async) {
      Future.delayed(const Duration(seconds: 1));
      async.elapse(Duration.zero);
    });

    await _tester.pumpAndSettle(const Duration(seconds: 1));

    fakeAsync((async) {
      Future.delayed(const Duration(seconds: 1));
      async.elapse(const Duration(seconds: 1));
    });

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
  }
}
