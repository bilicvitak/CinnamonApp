import '../screens/custom_bottom_navigation_bar/custom_bottom_navigation_bar_controller.dart';
import '../services/alice_service.dart';
import '../services/dio_service.dart';
import '../services/firebase_service.dart';
import '../services/logger_service.dart';
import '../services/shared_firebase_data_service.dart';
import '../services/storage_service.dart';

/// ------------------------
/// SERVICES
/// ------------------------

final aliceService = AliceService.instance;
final dioService = DioService.instance;
final firebaseService = FirebaseService.instance;
final logger = LoggerService.instance;
final sharedFirebaseDataService = SharedFirebaseDataService.instance;
final storageService = StorageService.instance;

/// ------------------------
/// CONTROLLERS
/// ------------------------

final dashboardController = CustomBottomNavigationBarController.instance;