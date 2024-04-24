part of 'search_bloc.dart';

 class SearchState extends Equatable {
  const SearchState({
    this.status = SearchStatus.initial,
    this.results,
    this.error,
    this.hasReachedMax=false,
  });

  final SearchStatus status;
  final List<Movie>? results;
  final String? error;
  final bool hasReachedMax;

  SearchState copyWith({
    SearchStatus? status,
    List<Movie>? results,
    String? error,
    bool? hasReachedMax,
  }) {
    return SearchState(
      status: status ?? this.status,
      results: results ?? this.results,
      error: error ?? this.error,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [
        status,
        results??[],
        error??'',
        hasReachedMax,
      ];
}

enum SearchStatus {
  initial,
  loading,
  loaded,
  error,
}
