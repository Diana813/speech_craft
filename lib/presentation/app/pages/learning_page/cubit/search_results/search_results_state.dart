part of 'search_results_cubit.dart';

@immutable
sealed class SearchResultsState extends Equatable {
  const SearchResultsState();

  @override
  List<Object?> get props => [];
}

final class SearchResultsInitial extends SearchResultsState {
  final SearchParams? queryParams;

  const SearchResultsInitial({this.queryParams});

  @override
  List<Object?> get props => [queryParams];
}

final class SearchResultsLoading extends SearchResultsState {
  const SearchResultsLoading();
}

final class SearchResultsLoaded extends SearchResultsState {
  final List<SearchResultEntity> videos;

  const SearchResultsLoaded({required this.videos});

  @override
  List<Object?> get props => [videos];
}

final class SearchResultsAtError extends SearchResultsState {
  final String errorMessage;

  const SearchResultsAtError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

final class VideoIdChanged extends SearchResultsState {
  final List<SearchResultEntity> videos;
  final String videoId;

  const VideoIdChanged({required this.videos, required this.videoId});

  @override
  List<Object?> get props => [videos, videoId];
}
