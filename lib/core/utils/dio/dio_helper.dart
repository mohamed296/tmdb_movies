import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:tmdb_movies/core/interceptors/dio_interceptor.dart';

/// Handle Http Request class
class DioHelper {
  /// Initialize Dio
  Dio init() {
    final dio = Dio();

    // Add interceptors
    dio.interceptors.addAll([
      AppInterceptors(),
      TalkerDioLogger(),
    ]);

    return dio;
  }
}
