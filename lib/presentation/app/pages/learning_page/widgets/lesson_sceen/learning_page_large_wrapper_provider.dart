import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_craft/data/models/search_request/search_key_words.dart';

import '../../../../../../injection_container.dart';
import '../../cubit/search_results/search_results_cubit.dart';
import 'learning_page_large.dart';

class LearningPageLargeSearchResultsWrapperProvider extends StatelessWidget {
  final SearchKeyWords? keywords;

  const LearningPageLargeSearchResultsWrapperProvider(
      {super.key, this.keywords});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => serviceLocator<SearchResultsCubit>(),
        child: LearningPageLarge(
          keywords: keywords,
        ));
  }
}
