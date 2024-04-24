import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tmdb_movies/core/config/routes/routes_names.dart';
import 'package:tmdb_movies/modules/favorites/view/favorite_view.dart';
import 'package:tmdb_movies/modules/movie/view/movie_view.dart';
import 'package:tmdb_movies/modules/search/model/movies_data_model.dart';
import 'package:tmdb_movies/modules/search/view/search_view.dart';
import 'package:tmdb_movies/nav.dart';

/// Global navigator key to be used by [GoRouter].
final globalNavigatorKey = GlobalKey<NavigatorState>();

/// global context
final globalContext = globalNavigatorKey.currentState?.context;

/// Global navigator to be used by [GoRouter].
final navigate = GoRouter.of(globalNavigatorKey.currentState!.context);

/// Get current location from router
String getCurrentLocationFromRouter(GoRouter navigate) {
  final lastMatch = navigate.routerDelegate.currentConfiguration.last;
  final matchList = lastMatch is ImperativeRouteMatch
      ? lastMatch.matches
      : navigate.routerDelegate.currentConfiguration;
  final location = matchList.uri.toString();
  return location;
}

/// Routes configuration for [GoRouter].
class RoutesConfig {
  /// [GoRouter] instance.
  static final GoRouter router = GoRouter(
    navigatorKey: globalNavigatorKey,
    debugLogDiagnostics: true,
    routerNeglect: true,
    initialLocation: '/',
    routes: [
      GoRoute(
        name: RouteNames.init,
        path: '/',
        builder: (context, state) => const NavBar(),
        routes: [
          GoRoute(
            name: RouteNames.movieDetail,
            path: 'movie-detail',
            builder: (context, state) => MovieScreen(
              movie: state.extra as Movie,
            ),
          ),
          GoRoute(
            name: RouteNames.favorites,
            path: 'favorites',
            builder: (context, state) => const FavoriteView(),
          ),
        ],
      ),
    ],
  );
}
