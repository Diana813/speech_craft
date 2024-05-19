import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../data/models/search_request/search_key_words.dart';
import '../../cubit/search_results/search_results_cubit.dart';
import '../../learning_screen.dart';
import '../../search_results_screen.dart';

class LearningPageLarge extends StatelessWidget {
  const LearningPageLarge({
    super.key,
    required this.keywords,
  });

  final SearchKeyWords? keywords;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: BlocBuilder<SearchResultsCubit,
              SearchResultsState>(
            builder: (context, state) {
              if (state is SearchResultsLoaded) {
                return LearningScreen(
                    videoId: state.videoIdInitial);
              } else if (state is VideoIdChanged) {
                return LearningScreen(videoId: state.videoId);
              } else {
                return const LearningScreen(videoId: '');
              }
            },
          ),
        ),
        Expanded(
          flex: 2,
          child: SearchResults(
            searchKeyWords: keywords,
          ),
        )
      ],
    );
  }
}