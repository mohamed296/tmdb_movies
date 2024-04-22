import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tmdb_movies/modules/search/model/search_model.dart';
import 'package:tmdb_movies/modules/search/repository/search_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(
    this._searchRepository,
  ) : super(const SearchState()) {
    on<SearchInitialEvent>((event, emit) => _onSearchInitialEvent(event, emit));
  }

  final List<Result> _results = [];
  final bool _hasReachedMax = false;

  final SearchRepository _searchRepository;

  Future<void> _onSearchInitialEvent(
      SearchInitialEvent event, Emitter<SearchState> emit) async {
    if (event.page == 1) {
      emit(state.copyWith(status: SearchStatus.initial));
    } else {
      emit(state.copyWith(status: SearchStatus.loading));
    }

    final (error, result) = await _searchRepository.searchMovies(
        query: event.query, page: event.page);

    if (error != null) {
      emit(state.copyWith(status: SearchStatus.error, error: error));
    } else {
      if (result!.results!.isEmpty) {
        emit(state.copyWith(hasReachedMax: true));
      } else {
        _results.addAll(result.results!);
        emit(state.copyWith(
            status: SearchStatus.loaded,
            results: List.from(_results),
            hasReachedMax: _hasReachedMax));
      }
    }
  }
}
