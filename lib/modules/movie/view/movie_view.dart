import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:tmdb_movies/core/config/theme/app_colors.dart';
import 'package:tmdb_movies/core/config/theme/size.dart';
import 'package:tmdb_movies/modules/movie/view/widget/build_actions.dart';
import 'package:tmdb_movies/modules/movie/view/widget/build_movie_information.dart';
import 'package:tmdb_movies/modules/search/model/movies_data_model.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ..._buildBackground(context, movie),
          BuildMovieInformation(context: context, movie: movie),
          BuildActions(movie: movie,),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(designPadding),
              child: GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _buildBackground(context, Movie movie) {
    return [
      Container(
        height: double.infinity,
        color: AppColor.backgroundColor,
      ),
      CachedNetworkImage(
        imageUrl: movie.posterPath != null
            ? 'https://image.tmdb.org/t/p/w1280${movie.posterPath}'
            : '',
        fit: BoxFit.cover,
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.6,
        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
          child: CircularProgressIndicator(value: downloadProgress.progress),
        ),
        errorWidget: (context, url, error) =>
            const Center(child: Icon(Icons.error)),
      ),
      const Positioned.fill(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.black,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.3, 0.6],
            ),
          ),
        ),
      ),
    ];
  }
}
