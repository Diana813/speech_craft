part of 'search_results_cubit.dart';

@immutable
sealed class SearchResultsState extends Equatable {
  @override
  List<Object?> get props => [];
}


final class SearchResultsInitial extends SearchResultsState {}


final class SearchResultsLoading extends SearchResultsState {}


final class SearchResultsLoaded extends SearchResultsState {
  final List<SearchResultEntity> videos;

  SearchResultsLoaded({required this.videos});

  @override
  List<Object?> get props => videos;
}


final class SearchResultsAtError extends SearchResultsState {
  final String errorMessage;

  SearchResultsAtError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
