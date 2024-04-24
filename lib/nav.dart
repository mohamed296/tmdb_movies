import 'package:easix/easix.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tmdb_movies/core/config/theme/app_colors.dart';
import 'package:tmdb_movies/core/config/theme/size.dart';
import 'package:tmdb_movies/modules/favorites/view/favorite_view.dart';
import 'package:tmdb_movies/modules/search/view/search_view.dart';

class NavBar extends HookWidget {
  /// Default constructor.
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState(0);
    final screens = useMemoized(
      () => [
        const SearchView(),
        const FavoriteView(),
      ],
    );

    final List<NavModel> icons = useMemoized(
      () => [
        NavModel(
          title: 'MOVIES',
          icon: Icons.home_outlined,
          activeIcon: Icons.home,
        ),
        NavModel(
          title: 'FAVORITES',
          icon: Icons.favorite_border,
          activeIcon: Icons.favorite,
        ),
      ],
    );

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        decoration: BoxDecoration(
          color: AppColor.primaryColor.withOpacity(0.8),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(14),
            topRight: Radius.circular(14),
          ),
        ),
        child: SafeArea(
          child: Row(
            children: [
              for (var i = 0; i < icons.length; i++)
                Expanded(
                  child: SizedBox(
                    height: height * .06,
                    child: InkWell(
                      onTap: () => selectedIndex.value = i,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            selectedIndex.value == i
                                ? CircleAvatar(
                                    radius: 23,
                                    backgroundColor: AppColor.backgroundColor,
                                    child: Icon(
                                      icons[i].activeIcon,
                                      color: AppColor.primaryColor,
                                      size: 26,
                                    ),
                                  )
                                : Icon(
                                    icons[i].icon,
                                    color: Colors.white,
                                  ),
                            Visibility(
                              visible: selectedIndex.value != i,
                              child: 2.ph,
                            ),
                            Visibility(
                              visible: selectedIndex.value != i,
                              child: Text(
                                icons[i].title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: selectedIndex.value,
        children: screens,
      ),
    );
  }
}

class NavModel {
  /// Default constructor.
  NavModel({
    this.title = '',
    this.icon,
    this.activeIcon,
  });

  /// Title. (required)
  final String title;

  /// Icon. (required)
  final IconData? icon;

  /// Active icon. (required)
  final IconData? activeIcon;
}
