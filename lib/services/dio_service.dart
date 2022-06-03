import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../constants/dependencies.dart';

class DioService extends GetxService {
  static final instance = Get.find<DioService>();

  /// ------------------------
  /// VARIABLES
  /// ------------------------

  late final Dio _dio;

  /// ------------------------
  /// GETTERS
  /// ------------------------

  Dio get dio => _dio;

  /// ------------------------
  /// SETTERS
  /// ------------------------

  set dio(Dio value) => _dio = value;

  /// ------------------------
  /// INIT
  /// ------------------------

  @override
  void onInit() {
    super.onInit();

    dio = Dio();
    dio.interceptors.add(
      aliceService.alice.getDioInterceptor(),
    );
  }

  /// ------------------------
  /// METHODS
  /// ------------------------

  Future<dynamic> getURL(String url) async {
    try {
      final response = await dio.get(url);
      final data = response.data;

      logger.i(data);
      return data;
    } catch (e) {
      logger.e('$url\nGET\n$e');
      return null;
    }
  }
}
