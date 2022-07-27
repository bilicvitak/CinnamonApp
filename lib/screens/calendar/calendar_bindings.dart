import 'package:get/get.dart';

import '../../constants/dependencies.dart';
import 'calendar_controller.dart';

class CalendarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CalendarController());
  }
}