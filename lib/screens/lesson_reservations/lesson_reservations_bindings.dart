import 'package:get/get.dart';

import 'lesson_reservations_controller.dart';

class LessonReservationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LessonReservationsController());
  }
}