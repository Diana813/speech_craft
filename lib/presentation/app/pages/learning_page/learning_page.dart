import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/search_results_fragment.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/widgets/lesson_sceen/learning_fragment/learning_page_large.dart';

import '../../../../data/models/search_request/search_key_words.dart';
import 'cubit/resize_navigation/resize_navigation_cubit.dart';

class LearningPage extends StatefulWidget {
  const LearningPage({super.key, required this.title, required this.keyWords});

  final String title;
  final SearchKeyWords? keyWords;

  @override
  State<LearningPage> createState() => _LearningPageState();
}

class _LearningPageState extends State<LearningPage> {
  @override
  Widget build(BuildContext context) {
    bool isLessonScreenVisible = Breakpoints.mediumAndUp.isActive(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.titleLarge!,
        ),
      ),
      body: SafeArea(
        child: AdaptiveLayout(
          body: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.smallAndUp: SlotLayout.from(
                key: const Key('primary-body'),
                builder: (context) => SearchResults(
                  searchKeyWords: widget.keyWords,
                ),
              ),
              Breakpoints.mediumAndUp: SlotLayout.from(
                key: const Key('secondary-body'),
                builder: (context) => BlocBuilder<ScreenResizedNavigationCubit,
                    ScreenResizedNavigationState>(
                  builder: (context, state) {
                    context
                        .read<ScreenResizedNavigationCubit>()
                        .lessonScreenDisplayed(
                            isLessonScreenDisplayed: isLessonScreenVisible);
                    return LearningPageLarge(keywords: widget.keyWords);
                  },
                ),
              ),
            },
          ),
        ),
      ),
    );
  }
}
