import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  static final instance = Get.find<StorageService>();

  /// ------------------------
  /// VARIABLES
  /// ------------------------

  late final GetStorage _storageBox;

  /// ------------------------
  /// GETTERS
  /// ------------------------

  GetStorage get storageBox => _storageBox;

  /// ------------------------
  /// SETTERS
  /// ------------------------

  set storageBox(GetStorage value) => _storageBox = value;

  /// ------------------------
  /// INIT
  /// ------------------------

  @override
  Future<void> onInit() async {
    super.onInit();
    storageBox = GetStorage();
  }

  /// ------------------------
  /// METHODS
  /// ------------------------

  /// Delete everything from Storage
  Future<void> deleteAll() async => storageBox.erase();

  /// Insert a value in Storage
  Future<void> insertValue({required String key, required value}) async =>
      storageBox.write(key, value);

  /// Delete a value from Storage
  Future<void> deleteValue({required String key}) async => storageBox.remove(key);

  /// Check if value exists
  bool contains({required String key}) => storageBox.hasData(key);

  /// Get a value from Storage
  dynamic getValue({required String key}) => storageBox.read(key);
}
