import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tmdb_movies/core/utils/dio/dio_helper.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tmdb_movies/modules/favorites/database/favorites_db.dart';
import 'package:tmdb_movies/modules/search/controllers/bloc/search_bloc.dart';
import 'package:tmdb_movies/modules/search/model/search_model.dart';
import 'package:tmdb_movies/modules/search/repository/search_repository.dart';

/// GetIt is a simple service locator for Dart and Flutter projects. [GetIt]
final gi = GetIt.instance;

/// init GetIt
Future<void> initGi() async {
  await dotenv.load();

  final isar = await Isar.open(
    [
      MovieSchema
    ],
    directory: await getApplicationDocumentsDirectory().then(
      (value) => value.path,
    ),
  );

  
  gi

    //bloc
    ..registerFactory<SearchBloc>(() => SearchBloc(gi()))

    // repositories
    ..registerLazySingleton(() => SearchRepository(dio: gi()))

    // data ( local + remote) repositories Objects
    ..registerLazySingleton<Isar>(() => isar)
    ..registerLazySingleton<Dio>(DioHelper().init)

  //Isar Mangers
  ..registerLazySingleton<FavoritesDB>(FavoritesDB.new);
}
