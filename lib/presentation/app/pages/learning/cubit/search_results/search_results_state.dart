part of 'search_results_cubit.dart';

@immutable
sealed class SearchResultsState {}

final class SearchResultsInitial extends SearchResultsState {}

final class SearchResultsLoading extends SearchResultsState {}

final class SearchResultsLoaded extends SearchResultsState {
  final List<SearchResult> videos;

  SearchResultsLoaded({required this.videos});
}

final class SearchResultsAtError extends SearchResultsState {
  final String errorMessage;

  SearchResultsAtError({required this.errorMessage});
}
