import 'package:flutter/material.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/widgets/lesson_sceen/learning_fragment_wrapper_provider.dart';


class LearningPageSmall extends StatelessWidget {
  final String videoId;

  const LearningPageSmall({super.key, required this.videoId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'talk trainer',
          style: Theme.of(context).textTheme.titleLarge!,
        ),
        leading: BackButton(
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
      ),
      body: LearningFragmentWrapperProvider(videoId: videoId),
    );
  }
}
