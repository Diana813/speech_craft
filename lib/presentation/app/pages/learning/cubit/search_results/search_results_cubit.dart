import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:speech_craft/domain/use_cases/search_use_cases.dart';

import '../../../../../../domain/entities/search_result_entity.dart';

part 'search_results_state.dart';

class SearchResultsCubit extends Cubit<SearchResultsState> {
  SearchResultsCubit() : super(SearchResultsInitial());
  final SearchUseCases searchUseCases = SearchUseCases();

  void onSearchParamsSubmitted() async {
    emit(SearchResultsLoading());

    final videosOrFailures = await searchUseCases.getSearchResults();
    videosOrFailures.fold(
      (videos) => emit(SearchResultsLoaded(videos: videos)),
      (failure) => emit(SearchResultsAtError(errorMessage: failure.message)),
    );
  }
}
