import 'package:dio/dio.dart';
import 'package:tmdb_movies/core/apis/api_class.dart';
import 'package:tmdb_movies/modules/search/model/movies_data_model.dart';

class SearchRepository {
  SearchRepository({required Dio dio}) : _dio = dio;

  final Dio _dio;
  Future<(String?, MoviesModel?)> searchMovies(
      {required String query, int? page = 1}) async {
    try {
      final response = await _dio.get(
        Api.searchMovie,
        queryParameters: {
          'query': query,
          'include_adult': false,
          'language': 'en-US',
          'page': page,
        },
      );
      final result = MoviesModel.fromJson(response.data);

      return (null, result);
    } on DioException catch (e) {
      return (_handleDioError(e), null);
    } catch (e) {
      return (e.toString(), null);
    }
  }

  Future<(String?, MoviesModel?)> topMovies({int? page = 1}) async {
    try {
      final response = await _dio.get(
        Api.topRatedMovie,
        queryParameters: {
          'include_adult': false,
          'language': 'en-US',
          'page': page,
        },
      );
      final result = MoviesModel.fromJson(response.data);

      return (null, result);
    } on DioException catch (e) {
      return (_handleDioError(e), null);
    } catch (e) {
      return (e.toString(), null);
    }
  }

  String _handleDioError(DioException e) {
    String errorDescription = "Unknown error occurred";
    switch (e.type) {
      case DioExceptionType.cancel:
        errorDescription = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionError:
        errorDescription = "Connection timeout with API server";
        break;
      case DioExceptionType.connectionTimeout:
        errorDescription = 'Connection timeout with API server';
        break;
      case DioExceptionType.sendTimeout:
        errorDescription = "Send timeout in connection with API server";
        break;
      case DioExceptionType.receiveTimeout:
        errorDescription = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.badResponse:
        errorDescription =
            "Received invalid status code: ${e.response?.statusCode}";
        break;

      case DioExceptionType.unknown:
        errorDescription =
            "Connection to API server failed due to internet connection. Enjoy with your favorite movies";
        break;
      case DioExceptionType.badCertificate:
        errorDescription = "badCertificate";
        break;
    }
    return errorDescription;
  }
}
