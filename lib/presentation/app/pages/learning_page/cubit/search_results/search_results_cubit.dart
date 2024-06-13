import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:speech_craft/domain/use_cases/search_use_cases.dart';

import '../../../../../../domain/entities/search_result_entity.dart';

part 'search_results_state.dart';

class SearchResultsCubit extends Cubit<SearchResultsState> {
  final SearchUseCases searchUseCases;

  SearchResultsCubit({required this.searchUseCases})
      : super(const SearchResultsInitial());

  void onSearchParamsSubmitted(
      {String? keywords, String? regionCode, String? languageCode}) async {
    emit(const SearchResultsLoading());

    final params = SearchParams(
        keywords: keywords, regionCode: regionCode, languageCode: languageCode);

    final videosOrFailures = await searchUseCases.call(params: params);
    videosOrFailures.fold(
      (videos) => emit(SearchResultsLoaded(videos: videos)),
      (failure) =>
          emit(SearchResultsAtError(errorMessage: failure.getMessage())),
    );
  }

  void onSelectedItemChanged(
      {required String videoId, required List<SearchResultEntity> videos}) {
    emit(VideoIdChanged(videoId: videoId, videos: videos));
  }
}
