import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/widgets/lesson_sceen/providers/learning_fragment_wrapper_provider.dart';

import '../../../../../../../data/models/search_request/search_key_words.dart';
import '../../../cubit/search_results/search_results_cubit.dart';
import '../../../search_results_fragment.dart';
import '../bottom_controls/large_screen_bottom_controls.dart';

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
          flex: 1,
          child: Container(),
        ),
        Expanded(
          flex: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 5,
                child: BlocBuilder<SearchResultsCubit, SearchResultsState>(
                  builder: (context, state) {
                    if (state is VideoIdChanged) {
                      print("Selected item changed. VideoId: ${state.videoId}");
                      return LearningFragmentWrapperProvider(videoId: state.videoId);
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
              const Expanded(
                flex: 1,
                child: LargeScreenBottomControls(),
              ),
            ],
          ),
        ),
        Expanded(flex: 1, child: Container()),
        Expanded(
          flex: 5,
          child: SearchResults(
            searchKeyWords: keywords,
          ),
        )
      ],
    );
  }
}
