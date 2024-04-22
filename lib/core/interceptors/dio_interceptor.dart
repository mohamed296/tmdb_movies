import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tmdb_movies/core/apis/api_class.dart';

/// No internet connection
const noInternetConnection = 'No internet connection';

/// global message error
const localError = 'Unexpected error, please try again letter';

/// App Interceptors
class AppInterceptors extends Interceptor {
  /// App Interceptors Constructor
  AppInterceptors();

  /// Header accept
  static const acceptHeader = 'accept';

  /// Header content encoding
  static const contentEncodingHeader = 'content-encoding';

  /// Header content length
  static const contentLengthHeader = 'content-length';

  /// Header content type
  static const contentTypeHeader = 'content-type';

  /// Header authorization
  static const authenticateHeader = 'Authorization';

  /// Header application json
  static const applicationJson = 'application/json';

  /// Header bearer
  static const bearer = 'Bearer ';

  /// Shared Preference Helper
  // final AuthLocalRepository authLocalRepository;

  @override
  Future<dynamic> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      handler.reject(
        DioException(
          error: noInternetConnection,
          requestOptions: options,
          response: Response(requestOptions: options),
        ),
      );
    } else if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      options.headers.addAll(
          {authenticateHeader: bearer + dotenv.env['api_access_token']!});

      options
        ..baseUrl = Api.baseUrl

        /// Redirects true
        ..followRedirects = true
        // Set a timeout of 10 seconds for the request
        ..connectTimeout = const Duration(seconds: 60)
        // Receive data with a timeout of some seconds
        ..receiveTimeout = const Duration(seconds: 60)
        // Send data with a timeout of some seconds
        ..sendTimeout = const Duration(seconds: 60);

      /// Add Header Accepted
      options.headers.addAll({
        Headers.acceptHeader: applicationJson,
        Headers.contentTypeHeader: applicationJson,
      });
      handler.next(options);
    }
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      ///TODO Handle 401 Unauthorized
    } else {
      return handler.next(err);
    }
  }
}
