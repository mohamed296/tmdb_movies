import 'package:easix/easix.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tmdb_movies/core/config/theme/size.dart';
import 'package:tmdb_movies/modules/search/model/search_model.dart';

class BuildItemDetails extends StatelessWidget {
  const BuildItemDetails({
    super.key,
    required this.context,
    required this.item,
  });

  final BuildContext context;
  final Result item;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.all(designPadding),
        height: size.height * 0.5,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, Colors.black],
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              item.title ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white),
            ),
            designPaddingCenter.ph,
            Text(
              item.releaseDate != null && item.releaseDate != ''
                  ? DateFormat.yMMMMd('en_US')
                      .format(DateTime.parse(item.releaseDate!))
                  : 'Not Found',
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

