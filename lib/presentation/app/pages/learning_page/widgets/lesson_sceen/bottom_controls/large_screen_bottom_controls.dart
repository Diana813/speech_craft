import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/cubit/learning/learning_cubit.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/cubit/start_button_cubit.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/cubit/user_audio_player/user_audio_player_cubit.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/widgets/lesson_sceen/text_popup.dart';

import '../../../../../../../common/strings.dart';
import '../../../../../../common/theme.dart';
import '../../../cubit/translation/translation_cubit.dart';
import '../../../cubit/translation/translation_state.dart';
import '../../../cubit/video_player/video_player_cubit.dart';
import '../icon_button.dart';

class LargeScreenBottomControls extends StatelessWidget {
  const LargeScreenBottomControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          BlocBuilder<TranslationCubit, TranslationState>(
            builder: (context, state) {
              return AppIconButton(
                backgroundColorDefault: AppTheme.lightGrey.shade700,
                backgroundColorPressed: AppTheme.grey.shade200,
                onPressed: () async {
                  if (state is TranslationUploaded) {
                    showTextPopup(context, translation, state.sentence,
                        state.translation);
                  } else if (state is TranslationAtError) {
                    showTextPopup(context, translation, state.sentence,
                        state.errorMessage);
                  }
                },
                child: const Icon(
                  Icons.translate_rounded,
                  color: Colors.red,
                ),
              );
            },
          ),
          BlocBuilder<UserAudioPlayerCubit, UserAudioPlayerState>(
            builder: (context, state) {
              return AppIconButton(
                backgroundColorDefault: AppTheme.lightGrey.shade700,
                backgroundColorPressed: AppTheme.grey.shade200,
                onPressed: () {
                  if (state is UserAudioLoaded) {
                    context
                        .read<UserAudioPlayerCubit>()
                        .playAudio(state.audioUrl);
                  }
                },
                child: const Icon(Icons.headset_rounded, color: Colors.red),
              );
            },
          ),
          AppIconButton(
            backgroundColorDefault: AppTheme.lightGrey.shade700,
            backgroundColorPressed: AppTheme.grey.shade200,
            onPressed: () {
              BlocProvider.of<StartButtonCubit>(context).startTraining();
              BlocProvider.of<VideoPlayerCubit>(context).playIfNotPlaying();
              BlocProvider.of<LearningCubit>(context).onUserResumeVideo();
            },
            child: const Icon(Icons.play_arrow, color: Colors.red),
          ),
          AppIconButton(
            backgroundColorDefault: AppTheme.lightGrey.shade700,
            backgroundColorPressed: AppTheme.grey.shade200,
            onPressed: () {
              BlocProvider.of<StartButtonCubit>(context).startTraining();
              BlocProvider.of<VideoPlayerCubit>(context).replay();
              BlocProvider.of<LearningCubit>(context).onUserResumeVideo();
            },
            child: const Icon(Icons.replay, color: Colors.red),
          ),
        ]);
  }
}
