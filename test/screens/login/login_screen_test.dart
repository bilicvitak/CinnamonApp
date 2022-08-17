import 'package:cinnamon_flutter_template_1/constants/keys.dart';
import 'package:cinnamon_flutter_template_1/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

import 'login_screen_test_mocks.dart';

void main() {
  late Widget loginScreen;
  late MockLoginController _mockLoginController;

  setUp(() {
    _mockLoginController = MockLoginController();

    loginScreen = ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        home: LoginScreen(
          controller: _mockLoginController,
        ),
      ),
    );
  });

  tearDown(() => _mockLoginController.dispose());

  testWidgets('email and password fields are valid, sign in method is called', (tester) async {
    // Build widget
    await tester.pumpWidget(loginScreen);

    await tester.enterText(find.byKey(FAKeys.loginEmail), 'ipapac@foi.hr');
    await tester.enterText(find.byKey(FAKeys.loginPassword), '123456789');

    // Rebuild widget with entered values
    await tester.pump();

    await tester.tap(find.byKey(FAKeys.loginButton));

    expect(_mockLoginController.errorTextEmail, false);
    expect(_mockLoginController.errorTextPassword, false);
    expect(_mockLoginController.validated, true);
    expect(_mockLoginController.isSignInCalled, true);
  });

  testWidgets('email and password fields are not valid, sign in method is not called',
      (tester) async {
    // Build widget
    await tester.pumpWidget(loginScreen);

    await tester.enterText(find.byKey(FAKeys.loginEmail), 'ipapac');
    await tester.enterText(find.byKey(FAKeys.loginPassword), '12345');

    // Rebuild widget with entered values
    await tester.pump();

    await tester.tap(find.byKey(FAKeys.loginButton));

    expect(_mockLoginController.errorTextEmail, true);
    expect(_mockLoginController.errorTextPassword, true);
    expect(_mockLoginController.validated, false);
    expect(_mockLoginController.isSignInCalled, false);
  });

  testWidgets('show password', (tester) async {
    // Build widget
    await tester.pumpWidget(loginScreen);
    final isObscure = _mockLoginController.obscureText;

    await tester.enterText(find.byKey(FAKeys.loginPassword), '12345');
    await tester.tap(find.byKey(FAKeys.loginShowPassword));

    expect(_mockLoginController.obscureText, !isObscure);
  });
  
  testWidgets('go to reset password screen', (tester) async {
    // Build widget
    await tester.pumpWidget(loginScreen);
    
    await tester.tap(find.byKey(FAKeys.loginForgotPassword));

    expect(_mockLoginController.isGoToPasswordResetCalled, true);
  });
}
