import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_craft/common/strings.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/cubit/learning/control_cubit.dart';

import '../../../cubit/learning/start_button_cubit.dart';
import '../../../cubit/learning/video_player/video_player_cubit.dart';

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
        onTap: (int index) async {
          if (index == 0) {
            context.read<ControlCubit>().goToHome();
          } else if (index == 1) {
            context.read<StartButtonCubit>().startTraining();
            context.read<VideoPlayerCubit>().playIfNotPlaying();
          } else if (index == 2) {
            context.read<ControlCubit>().replayVideoSegment();
          }
        },
    );
  }
}
