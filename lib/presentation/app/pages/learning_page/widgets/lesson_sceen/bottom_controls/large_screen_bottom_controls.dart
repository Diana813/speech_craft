import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../common/theme.dart';
import '../../../cubit/learning/control_cubit.dart';
import '../icon_button.dart';

class LargeScreenBottomControls extends StatelessWidget {

  const LargeScreenBottomControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Row(
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
              onPressed: () => context.read<ControlCubit>().playVideoSegment(),
              child: const Icon(Icons.play_arrow, color: Colors.red),
            ),
            AppIconButton(
              backgroundColorDefault: AppTheme.lightGrey.shade700,
              backgroundColorPressed: AppTheme.grey.shade200,
              onPressed: () => context.read<ControlCubit>().replayVideoSegment(),
              child: const Icon(Icons.replay, color: Colors.red),
            ),
          ]),
    );
  }
}