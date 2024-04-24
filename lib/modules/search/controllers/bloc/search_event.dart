part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchInitialEvent extends SearchEvent {
  final String query;
  final int? page;

  const SearchInitialEvent({required this.query, this.page = 1});
}

class GetTopMoviesEvent extends SearchEvent {
  final int? page;

  const GetTopMoviesEvent({this.page = 1});
}