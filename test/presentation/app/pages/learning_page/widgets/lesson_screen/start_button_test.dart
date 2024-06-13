import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speech_craft/common/strings.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/cubit/learning/start_button_cubit.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/cubit/learning/video_player/video_player_cubit.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/cubit/learning/video_player/video_player_state.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/widgets/lesson_sceen/start_button.dart';

class MockStartButtonCubit extends MockCubit<bool>
    implements StartButtonCubit {}

class MockVideoPlayerCubit extends MockCubit<VideoPlayerState> implements VideoPlayerCubit {}

void main() {
  testWidgets('StartButton renders correctly', (WidgetTester tester) async {
    final mockStartButtonCubit = MockStartButtonCubit();

    mockStartButtonCubit.emit(false);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BlocProvider.value(
            value: mockStartButtonCubit,
            child: const StartButton(),
          ),
        ),
      ),
    );

    expect(find.text(startTraning), findsOneWidget);

    final iconButtonFinder = find.byType(IconButton);
    expect(iconButtonFinder, findsOneWidget);
    expect(tester.widget<IconButton>(iconButtonFinder).onPressed, isNotNull);
    final iconButton = tester.widget<IconButton>(iconButtonFinder);
    final iconWidget = iconButton.icon as Icon;
    expect(iconWidget.size, 100.0);
    expect(iconWidget.color, Colors.red);
  });
}
