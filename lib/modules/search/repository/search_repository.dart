import 'package:dio/dio.dart';
import 'package:tmdb_movies/core/apis/api_class.dart';
import 'package:tmdb_movies/modules/search/model/search_model.dart';

class SearchRepository {
  SearchRepository({required Dio dio}) : _dio = dio;

  final Dio _dio;
  Future<(String?, SearchModel?)> searchMovies(
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
      final result = SearchModel.fromJson(response.data);

      return (null, result);
    } on DioException catch (e) {
      return (e.error.toString(), null);
    } catch (e) {
      return (e.toString(), null);
    }
  }
}
