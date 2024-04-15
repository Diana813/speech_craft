import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../data/models/searchResult/search_result.dart';

part 'search_results_state.dart';

class SearchResultsCubit extends Cubit<SearchResultsState> {
  SearchResultsCubit() : super(SearchResultsInitial());

  void onSearchResultLoading(){
    emit(SearchResultsLoading());
  }
  void onSearchResultLoaded(List<SearchResult> videos){
    emit(SearchResultsLoaded(videos: videos));
  }
  void onSearchResultsAtError(String errorMessage){
    emit(SearchResultsAtError(errorMessage: errorMessage));
  }
}
