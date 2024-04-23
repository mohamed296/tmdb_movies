import 'package:flutter/widgets.dart';
import 'package:tmdb_movies/modules/search/model/search_model.dart';
import 'package:tmdb_movies/modules/search/view/widget/build_image.dart';
import 'package:tmdb_movies/modules/search/view/widget/build_item_details.dart';

class BuildGridItem extends StatelessWidget {
  const BuildGridItem({
    super.key,
    required this.context,
    required this.item,
  });

  final BuildContext context;
  final Result item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          BuildImage(posterPath: item.posterPath),
          BuildItemDetails(context: context, item: item),
        ],
      ),
    );
  }
}


