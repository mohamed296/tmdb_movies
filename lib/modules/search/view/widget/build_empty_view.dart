import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tmdb_movies/core/config/theme/size.dart';
import 'package:tmdb_movies/core/constants/assets_path.dart';

class BuildEmptyView extends StatelessWidget {
  const BuildEmptyView({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          height: size.height * 0.74,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AssetsPath.noItemSvg),
              Text(
                'Nothing to See Here',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
