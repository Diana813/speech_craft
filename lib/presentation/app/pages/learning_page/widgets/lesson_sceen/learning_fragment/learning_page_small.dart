import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/widgets/lesson_sceen/bottom_controls/small_screen_bottom_controls.dart';

import '../../../cubit/video_loader/video_loader_cubit.dart';
import '../../../learning_fragment.dart';

class LearningPageSmall extends StatelessWidget {
  const LearningPageSmall({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<VideoLoaderCubit>(context).onVideoUploading();

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
      body: const LearningFragment(),
      bottomNavigationBar: const SmallScreenBottomControls(),
    );
  }
}
