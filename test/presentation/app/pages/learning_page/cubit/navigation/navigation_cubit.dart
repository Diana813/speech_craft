import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speech_craft/presentation/app/pages/learning_page/cubit/resize_navigation/resize_navigation_cubit.dart';

void main() {
  group('NavigationCubit', () {
    blocTest<ScreenResizedNavigationCubit, ScreenResizedNavigationState>(
      'emits [NavigationState(isLessonScreenDisplayed: true)] when lessonScreenDisplayed(true) is called',
      build: () => ScreenResizedNavigationCubit(),
      act: (cubit) => cubit.lessonScreenDisplayed(isLessonScreenDisplayed: true),
      expect: () => [
        const ScreenResizedNavigationState(isLessonScreenDisplayed: true),
      ],
    );

    blocTest<ScreenResizedNavigationCubit, ScreenResizedNavigationState>(
      'emits [NavigationState(isLessonScreenDisplayed: false)] when lessonScreenDisplayed(false) is called',
      build: () => ScreenResizedNavigationCubit(),
      act: (cubit) => cubit.lessonScreenDisplayed(isLessonScreenDisplayed: false),
      expect: () => [
        const ScreenResizedNavigationState(isLessonScreenDisplayed: false),
      ],
    );
  });
}