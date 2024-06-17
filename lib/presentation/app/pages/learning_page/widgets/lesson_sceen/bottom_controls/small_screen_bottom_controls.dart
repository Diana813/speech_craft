import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_craft/common/strings.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/cubit/learning/learning_cubit.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/cubit/video_loader/video_loader_cubit.dart';
import 'package:speech_craft/presentation/app/pages/welcome_page/widgets/query_params_wrapper_provider.dart';

import '../../../cubit/start_button_cubit.dart';
import '../../../cubit/video_player/video_player_cubit.dart';

class SmallScreenBottomControls extends StatelessWidget {
  const SmallScreenBottomControls({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Theme.of(context).shadowColor,
      unselectedItemColor: Theme.of(context).shadowColor,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.red[500],
          ),
          label: start,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.play_arrow, color: Colors.red[500]),
          label: train,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.replay, color: Colors.red[500]),
          label: replay,
        ),
      ],
      onTap: (int index) {
        if (index == 0) {
          context.read<VideoPlayerCubit>().stopMonitoringTimestamps();
          context.read<VideoLoaderCubit>().resetVideoUploadingState();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const WelcomePageWrapperProvider(title: 'talk trainer'),
            ),
          );
        } else if (index == 1) {
          context.read<StartButtonCubit>().startTraining();
          context.read<VideoPlayerCubit>().playIfNotPlaying();
          context.read<LearningCubit>().onUserResumeVideo();
        } else if (index == 2) {
          BlocProvider.of<StartButtonCubit>(context).startTraining();
          BlocProvider.of<VideoPlayerCubit>(context).replay();
          BlocProvider.of<LearningCubit>(context).onUserResumeVideo();
        }
      },
    );
  }
}
