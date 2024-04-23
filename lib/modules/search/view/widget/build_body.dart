import 'package:enhanced_paginated_view/enhanced_paginated_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tmdb_movies/core/config/theme/size.dart';
import 'package:tmdb_movies/modules/search/controllers/bloc/search_bloc.dart';
import 'package:tmdb_movies/modules/search/view/widget/build_empty_view.dart';
import 'package:tmdb_movies/modules/search/view/widget/build_grid_view.dart';
import 'package:tmdb_movies/modules/search/view/widget/custom_search_bar.dart';
import 'package:tmdb_movies/modules/search/view/widget/error_widget.dart';

class BuildBody extends StatelessWidget {
  const BuildBody({
    super.key,
    required this.queryController,
    required this.queryFocus,
  });

  final TextEditingController queryController;
  final FocusNode queryFocus;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBloc, SearchState>(
      listener: (context, state) {
        if (state.status == SearchStatus.error) {
          EasyLoading.showError(state.error!);
        } else if (state.status == SearchStatus.initial) {
          EasyLoading.show(status: 'loading...');
        } else {
          EasyLoading.dismiss();
        }
      },
      builder: (context, state) => EnhancedPaginatedView(
        header: Padding(
          padding: EdgeInsets.all(designPadding),
          child: CustomSearchBar(
            controller: queryController,
            focusNode: queryFocus,
            onChange: (value) => context
                .read<SearchBloc>()
                .add(SearchInitialEvent(page: 1, query: value)),
          ),
        ),
        showLoading: state.status == SearchStatus.loading,
        showError: state.status == SearchStatus.error,
        listOfData: state.results ?? [],
        emptyView: BuildEmptyView(context: context),
        errorWidget: (page) => ErrorPaginationWidget(
          state: state,
          page: page,
          queryController: queryController,
        ),
        onLoadMore: (page) => context
            .read<SearchBloc>()
            .add(SearchInitialEvent(page: page, query: queryController.text)),
        isMaxReached: state.hasReachedMax,
        builder: (physics, items, shrinkWrap, _) => BuildGridView(
            context: context,
            items: items,
            shrinkWrap: shrinkWrap,
            physics: physics),
      ),
    );
  }
}
