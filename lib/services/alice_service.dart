import 'package:alice/alice.dart';
import 'package:get/get.dart';

class AliceService extends GetxService {
  static final instance = Get.find<AliceService>();

  /// ------------------------
  /// VARIABLES
  /// ------------------------

  late final Alice _alice;

  /// ------------------------
  /// GETTERS
  /// ------------------------

  Alice get alice => _alice;

  /// ------------------------
  /// SETTERS
  /// ------------------------

  set alice(Alice value) => _alice = value;

  /// ------------------------
  /// INIT
  /// ------------------------

  @override
  void onInit() {
    super.onInit();
    alice = Alice(darkTheme: true);
  }

  /// ------------------------
  /// METHODS
  /// ------------------------

  void showAliceInspector() => alice.showInspector();
}
