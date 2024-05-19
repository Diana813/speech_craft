import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_craft/data/models/search_request/search_key_words.dart';
import 'package:speech_craft/presentation/app/pages/learning/cubit/search_results/search_results_cubit.dart';

import '../../../../../../injection_container.dart';
import '../../search_results_screen.dart';

class SearchResultsWrapperProvider extends StatelessWidget {
  final SearchKeyWords? searchKeyWords;

  const SearchResultsWrapperProvider({super.key, required this.searchKeyWords});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => serviceLocator<SearchResultsCubit>(),
        child: SearchResults(
          searchKeyWords: searchKeyWords,
        ));
  }
}
