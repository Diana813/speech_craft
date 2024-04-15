import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:speech_craft/presentation/app/pages/learning/search_results_screen.dart';
import 'package:speech_craft/presentation/app/pages/learning/learning_screen.dart';

import '../../../../data/models/search_key_words.dart';

class LearningPage extends StatefulWidget {
  const LearningPage({super.key, required this.title, this.searchKeyWords});

  final String title;
  final SearchKeyWords? searchKeyWords;

  @override
  State<LearningPage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<LearningPage> {
  @override
  Widget build(BuildContext context) {
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
                builder: (context) => SearchResults(searchKeyWords: widget.searchKeyWords),
              ),
              Breakpoints.mediumAndUp: SlotLayout.from(
                key: const Key('primary-body'),
                builder: (context) => Row(
                  children: [
                    const Expanded(
                      flex: 5,
                      child: LearningScreen(),
                    ),
                    Expanded(
                      flex: 2,
                      child: SearchResults(searchKeyWords: widget.searchKeyWords),
                    )
                  ],
                ),
              )
            },
          ),
        ),
      ),
    );
  }
}
