import 'package:isar/isar.dart';
import 'package:tmdb_movies/core/dependency_injection/get_it.dart';
import 'package:tmdb_movies/modules/search/model/movies_data_model.dart';

class FavoritesDB {
  final Isar isar = gi<Isar>();

  Stream<List<Movie>> get moviesStream =>
      isar.movies.buildQuery<Movie>().watch(fireImmediately: true);

  Future<List<Movie>> getMovies() async {
    return isar.movies.where().findAll();
  }

  Future<void> saveMovie(Movie movie) async {
    await isar.writeTxn(() async {
      await isar.movies.put(movie);
    });
  }

  Future<void> deleteMovie(int id) async {
    await isar.writeTxn(() async {
      await isar.movies.delete(id);
    });
  }

  Future<bool> isMovieFavorite(int movieId) async {
    final movie = await isar.movies.filter().idEqualTo(movieId).findFirst();
    return movie != null;
  }
}
