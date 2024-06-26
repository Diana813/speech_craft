import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speech_craft/common/strings.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/cubit/start_button_cubit.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/cubit/video_player/video_player_cubit.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/cubit/video_player/video_player_state.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/widgets/lesson_sceen/start_button.dart';

class MockStartButtonCubit extends MockCubit<StartButtonState>
    implements StartButtonCubit {}

class MockVideoPlayerCubit extends MockCubit<VideoPlayerState> implements VideoPlayerCubit {}

void main() {
  testWidgets('StartButton renders correctly when training not started', (WidgetTester tester) async {
    final mockStartButtonCubit = MockStartButtonCubit();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BlocProvider.value(
            value: mockStartButtonCubit,
            child: const StartButton(trainingState: StartButtonState.trainingNotStarted),
          ),
        ),
      ),
    );

    expect(find.text(startTraining), findsOneWidget);

    final iconButtonFinder = find.byType(IconButton);
    expect(iconButtonFinder, findsOneWidget);
    expect(tester.widget<IconButton>(iconButtonFinder).onPressed, isNotNull);
    final iconButton = tester.widget<IconButton>(iconButtonFinder);
    final iconWidget = iconButton.icon as Icon;
    expect(iconWidget.size, 100.0);
    expect(iconWidget.color, Colors.red);
  });

  testWidgets('StartButton renders correctly when training started', (WidgetTester tester) async {
    final mockStartButtonCubit = MockStartButtonCubit();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BlocProvider.value(
            value: mockStartButtonCubit,
            child: const StartButton(trainingState: StartButtonState.trainingStarted),
          ),
        ),
      ),
    );

    expect(find.text(''), findsOneWidget);

    final iconButtonFinder = find.byType(IconButton);
    expect(iconButtonFinder, findsOneWidget);
    expect(tester.widget<IconButton>(iconButtonFinder).onPressed, isNull);
    final iconButton = tester.widget<IconButton>(iconButtonFinder);
    final iconWidget = iconButton.icon as Icon;
    expect(iconWidget.size, 100.0);
    expect(iconWidget.color, Colors.grey);
  });
}

