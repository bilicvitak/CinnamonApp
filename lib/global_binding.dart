import 'package:get/get.dart';

import 'screens/custom_bottom_navigation_bar/custom_bottom_navigation_bar_controller.dart';
import 'services/dio_service.dart';
import 'services/shared_firebase_data_service.dart';
import 'services/storage_service.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..put(StorageService())
      ..put(DioService())
      ..put(SharedFirebaseDataService())
      ..put(CustomBottomNavigationBarController());
  }
}
