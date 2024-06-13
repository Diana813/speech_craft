import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_craft/data/models/search_request/search_key_words.dart';
import 'package:speech_craft/injection_container.dart';

import '../../../cubit/search_results/search_results_cubit.dart';
import '../../../learning_page.dart';

class LearningPageWrapperProvider extends StatelessWidget {
  final SearchKeyWords keywords;
  final String title;

  const LearningPageWrapperProvider(
      {super.key, required this.keywords, required this.title});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => serviceLocator<SearchResultsCubit>(),
        )
      ],
      child: LearningPage(
        keyWords: keywords,
        title: title,
      ),
    );
  }
}
