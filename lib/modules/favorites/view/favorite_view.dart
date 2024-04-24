import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tmdb_movies/core/dependency_injection/get_it.dart';
import 'package:tmdb_movies/modules/favorites/database/favorites_db.dart';
import 'package:tmdb_movies/modules/search/view/widget/build_grid_view.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Favorites'),
        ),
        body: StreamBuilder(
            stream: gi<FavoritesDB>().moviesStream,
            builder: (context, snapshot) {
              log(snapshot.data.toString());
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              var movies = snapshot.data ?? [];
              if (movies.isEmpty) {
                return const Center(child: Text('No favorites yet'));
              }
              return BuildGridView(
                items: movies,
                shrinkWrap: true,
              );
            }));
  }
}
