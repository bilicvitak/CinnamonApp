import 'package:cinnamon_flutter_template_1/screens/login/login_controller.dart';

class MockLoginController extends LoginController {
  var isSignInCalled = false;
  var isGoToPasswordResetCalled = false;

  @override
  Future<void> signIn() async {
    isSignInCalled = true;
  }

  @override
  void goToPasswordReset() {
    isGoToPasswordResetCalled = true;
  }
}
