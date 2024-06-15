import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/cubit/learning/start_button_cubit.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/cubit/learning/video_player/video_player_cubit.dart';

import '../../../../../../common/theme.dart';
import '../../../cubit/learning/control_cubit.dart';
import '../icon_button.dart';

class LargeScreenBottomControls extends StatelessWidget {
  const LargeScreenBottomControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          AppIconButton(
            backgroundColorDefault: AppTheme.lightGrey.shade700,
            backgroundColorPressed: AppTheme.grey.shade200,
            onPressed: () => context.read<ControlCubit>().translateSegment(),
            child: const Icon(
              Icons.translate_rounded,
              color: Colors.red,
            ),
          ),
          AppIconButton(
            backgroundColorDefault: AppTheme.lightGrey.shade700,
            backgroundColorPressed: AppTheme.grey.shade200,
            onPressed: () => context.read<ControlCubit>().listenSegment(),
            child: const Icon(Icons.headset_rounded, color: Colors.red),
          ),
          AppIconButton(
            backgroundColorDefault: AppTheme.lightGrey.shade700,
            backgroundColorPressed: AppTheme.grey.shade200,
            onPressed: () {
              BlocProvider.of<StartButtonCubit>(context).startTraining();
              BlocProvider.of<VideoPlayerCubit>(context).playIfNotPlaying();
            },
            child: const Icon(Icons.play_arrow, color: Colors.red),
          ),
          AppIconButton(
            backgroundColorDefault: AppTheme.lightGrey.shade700,
            backgroundColorPressed: AppTheme.grey.shade200,
            onPressed: () =>
                context.read<ControlCubit>().replayVideoSegment(),
            child: const Icon(Icons.replay, color: Colors.red),
          ),
        ]);
  }
}
