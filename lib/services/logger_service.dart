import 'dart:convert';

import 'package:get/get.dart';
import 'package:logger/logger.dart';

/// Offers colorful logging and is much more robust than a simple `print`
/// We initialize it here and then call it whereever with a simple `Get.find`

class LoggerService extends GetxService {
  static final instance = Get.find<LoggerService>();

  /// ------------------------
  /// VARIABLES
  /// ------------------------

  late final Logger _logger;

  /// ------------------------
  /// GETTERS
  /// ------------------------

  Logger get logger => _logger;

  /// ------------------------
  /// SETTERS
  /// ------------------------

  set logger(Logger value) => _logger = value;

  /// ------------------------
  /// INIT
  /// ------------------------

  @override
  void onInit() {
    super.onInit();
    logger = Logger(
      printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 3,
        lineLength: 50,
        noBoxingByDefault: true,
      ),
    );
  }

  /// ------------------------
  /// METHODS
  /// ------------------------

  /// Verbose log, grey color
  void v(value) => logger.v(value);

  /// 🐛 Debug log, blue color
  void d(value) => logger.d(value);

  /// 💡 Info log, light blue color
  void i(value) => logger.i(value);

  /// ⚠️ Warning log, orange color
  void w(value) => logger.w(value);

  /// ⛔ Error log, red color
  void e(value) => logger.e(value);

  /// 👾 What a terrible failure error, purple color
  void wtf(value) => logger.wtf(value);

  /// Logs JSON responses with proper formatting
  void logJson(String data) {
    final object = json.decode(data);

    final prettyString = const JsonEncoder.withIndent('  ').convert(object);
    logger.i(prettyString);
  }
}
