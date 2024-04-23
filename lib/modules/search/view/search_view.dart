
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:tmdb_movies/core/dependency_injection/get_it.dart';
import 'package:tmdb_movies/modules/search/controllers/bloc/search_bloc.dart';
import 'package:tmdb_movies/modules/search/view/widget/build_body.dart';


class SearchView extends HookWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final queryController = useTextEditingController();
    final queryFocus = useFocusNode();
    return Scaffold(
      appBar: AppBar(title: const Text('TMDB')),
      body: BlocProvider(
        create: (_) => gi<SearchBloc>(),
        child:
            BuildBody(queryController: queryController, queryFocus: queryFocus),
      ),
    );
  }
}
