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
  final WidgetTester tester;

  LoginRobot(this.tester);

  Future<void> goBack() async {
    final _backButton = find.byType(YellowBackButton);

    await tester.tap(_backButton);
    await tester.pumpAndSettle();
  }

  Future<void> enterEmail({required String email}) async {
    final _loginEmail = find.byKey(FAKeys.loginEmail);

    await tester.tap(_loginEmail);
    await tester.pump(const Duration(milliseconds: 500));
    await tester.enterText(_loginEmail, email);
    await tester.pump(const Duration(seconds: 1));

    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pump(const Duration(milliseconds: 500));
  }

  Future<void> findEmailError({bool isEmpty = false}) async {
    if (isEmpty) {
      final _emailEmptyError = find.text(FAStrings.registrationValidationRequiredField);
      expect(_emailEmptyError, findsOneWidget);
    } else {
      final _emailInvalidError = find.text(FAStrings.registrationValidationValidEmail);
      expect(_emailInvalidError, findsOneWidget);
    }
  }

  Future<void> enterPassword({required String password}) async {
    final _loginPassword = find.byKey(FAKeys.loginPassword);

    await tester.tap(_loginPassword);
    await tester.pump(const Duration(milliseconds: 500));
    await tester.enterText(_loginPassword, password);
    await tester.pump(const Duration(seconds: 1));

    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pump(const Duration(milliseconds: 500));
  }

  Future<void> findPasswordError({bool isEmpty = false}) async {
    if (isEmpty) {
      final _passwordEmptyError = find.text(FAStrings.registrationValidationRequiredField);
      expect(_passwordEmptyError, findsOneWidget);
    } else {
      final _passwordInvalidError = find.text(FAStrings.registrationValidationShortPassword);
      expect(_passwordInvalidError, findsOneWidget);
    }
  }

  Future<void> toggleObscureText() async {
    final _showPassword = find.byKey(FAKeys.loginShowPassword);
    await tester.tap(_showPassword);
    await tester.pump();
  }

  Future<void> findDisabledLoginButton() async {
    final _loginButton = find.byKey(FAKeys.loginButton);

    expect(tester.widget<YellowButton>(_loginButton).enabled, false);
  }

  Future<void> clickLoginButton({int resultCode = 0}) async {
    final _loginButton = find.byKey(FAKeys.loginButton);

    await tester.ensureVisible(_loginButton);
    await tester.tap(_loginButton);
    await tester.pumpAndSettle(const Duration(seconds: 1));

    switch (resultCode) {
      case 0:
        final _firebaseUser = firebaseService.firebaseUser.value;
        expect(_firebaseUser != null, true);
        break;
      case FCErrors.userNotFound:
        final _snackbar = find.widgetWithText(GetSnackBar, FAStrings.errorUserNotFound);
        expect(_snackbar, findsOneWidget);
        break;
      case FCErrors.wrongPassword:
        final _snackbar = find.widgetWithText(GetSnackBar, FAStrings.errorWrongPassword);
        expect(_snackbar, findsOneWidget);
        break;
    }
  }
}
