import 'package:get/get.dart';

import 'lesson_details_controller.dart';

class LessonDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LessonDetailsController());
  }
}
