import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_movies/modules/search/controllers/bloc/search_bloc.dart';

class ErrorPaginationWidget extends StatelessWidget {
  const ErrorPaginationWidget({
    super.key,
    required this.state,
    required this.page,
    required this.queryController,
  });

  final SearchState state;
  final int page;
  final TextEditingController queryController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(state.error ?? 'Error'),
        TextButton(
          onPressed: () => context
              .read<SearchBloc>()
              .add(SearchInitialEvent(page: page, query: queryController.text)),
          child: const Text('Retry'),
        ),
      ],
    );
  }
}
