import 'package:flutter/material.dart';
import 'package:tmdb_movies/core/config/theme/size.dart';
import 'package:tmdb_movies/modules/search/model/movies_data_model.dart';
import 'package:tmdb_movies/modules/search/view/widget/build_grid_item.dart';

class BuildGridView extends StatelessWidget {
  const BuildGridView({
    super.key,
    required this.items,
    required this.shrinkWrap,
    this.physics,
  });

  final List items;
  final bool shrinkWrap;
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: shrinkWrap,
      physics: physics,
      padding: EdgeInsets.all(designPadding),
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 20.0,
        mainAxisExtent: size.height * 0.3,
      ),
      itemBuilder: (context, index) =>
          BuildGridItem(context: context, item: items[index]),
    );
  }
}
