import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_craft/common/strings.dart';
import 'package:speech_craft/data/models/search_request/search_key_words.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/widgets/search_fragment/search_results_list.dart';

import 'cubit/search_results/search_results_cubit.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key, required this.searchKeyWords});

  final SearchKeyWords? searchKeyWords;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SearchResultsCubit>(context).onSearchParamsSubmitted(
      keywords: searchKeyWords?.searchFraze,
      regionCode: searchKeyWords?.regionCode,
      languageCode: searchKeyWords?.languageCode,
    );

    return BlocBuilder<SearchResultsCubit, SearchResultsState>(
      builder: (context, state) {
        if (state is SearchResultsLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
        } else if (state is SearchResultsLoaded) {
          return SearchResultsList(videos: state.videos);
        } else if (state is SearchResultsAtError) {
          return Center(child: Text('Error: ${state.errorMessage}'));
        } else {
          return const Text(emptyResults);
        }
      },
    );
  }
}
