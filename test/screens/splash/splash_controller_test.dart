import 'package:cinnamon_flutter_template_1/screens/splash/splash_controller.dart';
import 'package:test/test.dart';

void main() {
  test("Animation's properties should be changed", () async {
    final splashController = SplashController();

    await splashController.runAnimation();

    expect(splashController.whiteContainerHeight, 0);
    expect(splashController.logoOpacity, 1);
    expect(splashController.textSlide, 0);
    expect(splashController.yellowContainerHeight, 0);
  });
}
