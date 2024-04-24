import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tmdb_movies/core/dependency_injection/get_it.dart';
import 'package:tmdb_movies/modules/favorites/database/favorites_db.dart';
import 'package:tmdb_movies/modules/search/model/movies_data_model.dart';

class BuildActions extends HookWidget {
  const BuildActions({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final isFavorite = useState(false);
    final movieIsarId = useState<int?>(movie.isarId);

    useEffect(() {
      final subscription = gi<FavoritesDB>().moviesStream.listen((movies) {
        final favorite = movies.firstWhere(
          (m) => m.id == movie.id,
        );
        movieIsarId.value = favorite.isarId;
        isFavorite.value = movies.any((m) => m.id == movie.id);
      }, onError: (error) {
        log('Error listening to moviesStream: $error');
        isFavorite.value = false;
      });

      return subscription.cancel;
    }, []);

    return Positioned(
      bottom: 50,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15.0),
                backgroundColor: isFavorite.value
                    ? const Color(0xFFFF7272).withOpacity(0.3)
                    : const Color(0xFFFF7272),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () async {
                if (isFavorite.value) {
                  await gi<FavoritesDB>().deleteMovie(movieIsarId.value!);
                } else {
                  await gi<FavoritesDB>().saveMovie(movie);
                }
                // Toggle the favorite state locally
                isFavorite.value = !isFavorite.value;
              },
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.white),
                  children: [
                    TextSpan(
                      text: isFavorite.value ? 'Remove from ' : 'Add to ',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const TextSpan(
                      text: 'Favorite',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
