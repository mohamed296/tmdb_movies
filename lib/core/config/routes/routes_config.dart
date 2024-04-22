import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tmdb_movies/core/config/routes/routes_names.dart';
import 'package:tmdb_movies/modules/search/view/search_view.dart';

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
        builder: (context, state) => const SearchView(),
        // redirect: (context, state) async {
        //   final users = gi<AuthDB>();
        //   final user = await users.getUser();
        //   if (user != null) {
        //     return '/history';
        //   }
        //   return null;
        // },
        routes: const [],
      ),
    ],
  );
}
