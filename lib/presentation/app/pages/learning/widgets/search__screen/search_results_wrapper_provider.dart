import 'package:flutter/material.dart';
import 'package:speech_craft/presentation/app/pages/learning/cubit/search_results/search_results_cubit.dart';

import '../../../../../../data/models/search_key_words.dart';
import '../../search_results_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultsWrapperProvider extends StatelessWidget {
  const SearchResultsWrapperProvider({super.key, this.searchKeyWords});

  final SearchKeyWords? searchKeyWords;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => SearchResultsCubit(),
        child: SearchResults(
          searchKeyWords: searchKeyWords,
        ));
  }
}
