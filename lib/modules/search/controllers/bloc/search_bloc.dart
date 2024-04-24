import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tmdb_movies/modules/search/model/movies_data_model.dart';
import 'package:tmdb_movies/modules/search/repository/search_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(
    this._searchRepository,
  ) : super(const SearchState()) {
    on<SearchInitialEvent>(
        (event, emit) async => _onSearchInitialEvent(event, emit));
    on<GetTopMoviesEvent>((event, emit) async => _getTopMovies(event, emit));
  }

  List<Movie> _results = [];
  bool _hasReachedMax = false;

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
      emit(state.copyWith(
          status: event.page == 1
              ? SearchStatus.error
              : SearchStatus.errorPagination,
          error: error));
    } else {
      _hasReachedMax = event.page == result!.totalPages;
      if (event.page == 1) {
        _results = result.results!;
      } else {
        _results.addAll(result.results!);
      }

      emit(state.copyWith(
          status: SearchStatus.loaded,
          results: List.from(_results),
          hasReachedMax: _hasReachedMax));
    }
  }

  Future<void> _getTopMovies(
      GetTopMoviesEvent event, Emitter<SearchState> emit) async {
    if (event.page == 1) {
      emit(state.copyWith(status: SearchStatus.initial));
    } else {
      emit(state.copyWith(status: SearchStatus.loading));
    }

    final (error, result) = await _searchRepository.topMovies(page: event.page);

    if (error != null) {
      emit(state.copyWith(
          status: event.page == 1
              ? SearchStatus.error
              : SearchStatus.errorPagination,
          error: error));
    } else {
      _hasReachedMax = event.page == result!.totalPages;
      if (event.page == 1) {
        _results = result.results!;
      } else {
        _results.addAll(result.results!);
      }

      emit(state.copyWith(
          status: SearchStatus.loaded,
          topMoviesResults: List.from(_results),
          hasReachedMax: _hasReachedMax));
    }
  }
}
