import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/cubit/translation/translation_cubit.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/cubit/translation/translation_state.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/widgets/lesson_sceen/text_popup.dart';

import '../../../../../../common/strings.dart';
import '../../../../../common/theme.dart';
import '../../cubit/user_audio_player/user_audio_player_cubit.dart';
import 'icon_button.dart';

class SmallScreenUpperControls extends StatelessWidget {
  const SmallScreenUpperControls({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 16.0),
            child: BlocBuilder<TranslationCubit, TranslationState>(
              builder: (context, state) {
                return AppIconButton(
                  backgroundColorDefault: AppTheme.lightTale.shade700,
                  backgroundColorPressed: AppTheme.tale,
                  onPressed: () {
                    if (state is TranslationUploaded) {
                      showTextPopup(context, translation, state.sentence,
                          state.translation);
                    } else if (state is TranslationAtError) {
                      showTextPopup(context, translation, state.sentence,
                          state.errorMessage);
                    }
                  },
                  child: Icon(
                    Icons.translate_rounded,
                    color: Theme.of(context).shadowColor,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocBuilder<UserAudioPlayerCubit, UserAudioPlayerState>(
              builder: (context, state) {
                return AppIconButton(
                  backgroundColorDefault: AppTheme.lightTale.shade700,
                  backgroundColorPressed: AppTheme.tale,
                  onPressed: () {
                    if (state is UserAudioLoaded) {
                      context
                          .read<UserAudioPlayerCubit>()
                          .playAudio(state.audioUrl);
                    }
                  },
                  child: Icon(
                    Icons.headset_rounded,
                    color: Theme.of(context).shadowColor,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
