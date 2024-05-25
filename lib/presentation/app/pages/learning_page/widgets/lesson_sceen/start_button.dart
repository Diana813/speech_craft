import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../common/strings.dart';
import '../../../../../common/theme.dart';
import '../../cubit/learning/video_player/video_player_cubit.dart';

class StartButton extends StatelessWidget {
  const StartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoPlayerCubit, VideoPlayerState>(
      builder: (context, state) {
        bool isPlayClicked = false;
        if (state is VideoPlaying) {
          isPlayClicked = state.isPlayClicked;
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                isPlayClicked ? '' : startTraning,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            IconButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
                padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(horizontal: 20),
                ),
                shadowColor: MaterialStateProperty.all<Color>(AppTheme.grey.shade700),
                elevation: isPlayClicked ? null : MaterialStateProperty.all(1.0),
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return AppTheme.grey;
                    }
                    return AppTheme.lightGrey;
                  },
                ),
              ),
              onPressed: isPlayClicked
                  ? null
                  : () {
                BlocProvider.of<VideoPlayerCubit>(context).play();
              },
              icon: Icon(
                Icons.play_arrow,
                size: 100,
                color: isPlayClicked ? Colors.grey : Colors.red,
              ),
            ),
          ],
        );
      },
    );
  }
}