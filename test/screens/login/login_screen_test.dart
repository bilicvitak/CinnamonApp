import 'package:cinnamon_flutter_template_1/constants/keys.dart';
import 'package:cinnamon_flutter_template_1/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

import 'login_screen_test_mocks.dart';

void main() {
  late Widget _loginScreen;
  late MockLoginController _mockLoginController;

  setUp(() {
    /// Arrange
    _mockLoginController = MockLoginController();

    _loginScreen = ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        home: LoginScreen(
          controller: _mockLoginController,
        ),
      ),
    );
  });

  tearDown(() => _mockLoginController.dispose());

  group('Login screen', () {
    /// Arrange
    final _loginEmail = find.byKey(FAKeys.loginEmail);
    final _loginPassword = find.byKey(FAKeys.loginPassword);
    final _loginButton = find.byKey(FAKeys.loginButton);
    final _loginShowPassword = find.byKey(FAKeys.loginShowPassword);
    final _loginForgotPassword = find.byKey(FAKeys.loginForgotPassword);

    testWidgets('email and password fields are valid, sign in method is called', (tester) async {
      /// Act
      await tester.pumpWidget(_loginScreen); // Build widget

      await tester.tap(_loginEmail);
      await tester.enterText(_loginEmail, 'ipapac@foi.hr');
      await tester.tap(_loginPassword);
      await tester.enterText(_loginPassword, '123456789');
      await tester.pump();

      FocusManager.instance.primaryFocus?.unfocus();

      await tester.tap(_loginButton);
      await tester.pump();

      /// Assert
      expect(_mockLoginController.errorTextEmail, false);
      expect(_mockLoginController.errorTextPassword, false);
      expect(_mockLoginController.validated, true);
      expect(_mockLoginController.isSignInCalled, true);
    });

    testWidgets('email and password fields are not valid, sign in method is not called',
        (tester) async {
      /// Act
      await tester.pumpWidget(_loginScreen);

      await tester.tap(_loginEmail);
      await tester.enterText(_loginEmail, 'ipapac');
      await tester.tap(_loginPassword);
      await tester.enterText(_loginPassword, '12345');
      await tester.pump();

      FocusManager.instance.primaryFocus?.unfocus();

      await tester.tap(_loginButton);
      await tester.pump();

      /// Assert
      expect(_mockLoginController.errorTextEmail, true);
      expect(_mockLoginController.errorTextPassword, true);
      expect(_mockLoginController.validated, false);
      expect(_mockLoginController.isSignInCalled, false);
    });

    testWidgets('show password', (tester) async {
      /// Arrange
      final isObscure = _mockLoginController.obscureText;

      /// Act
      await tester.pumpWidget(_loginScreen);
      await tester.tap(_loginPassword);
      await tester.enterText(_loginPassword, '12345');
      await tester.pump();
      await tester.tap(_loginShowPassword);

      /// Assert
      expect(_mockLoginController.obscureText, !isObscure);
    });

    testWidgets('go to reset password screen', (tester) async {
      /// Act
      await tester.pumpWidget(_loginScreen);
      await tester.tap(_loginForgotPassword);

      /// Assert
      expect(_mockLoginController.isGoToPasswordResetCalled, true);
    });
  });
}
