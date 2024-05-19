import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speech_craft/presentation/app/pages/learning/cubit/navigation/navigation_cubit.dart';

void main() {
  group('NavigationCubit', () {
    blocTest<NavigationCubit, NavigationState>(
      'emits [NavigationState(isLessonScreenDisplayed: true)] when lessonScreenDisplayed(true) is called',
      build: () => NavigationCubit(),
      act: (cubit) => cubit.lessonScreenDisplayed(isLessonScreenDisplayed: true),
      expect: () => [
        const NavigationState(isLessonScreenDisplayed: true),
      ],
    );

    blocTest<NavigationCubit, NavigationState>(
      'emits [NavigationState(isLessonScreenDisplayed: false)] when lessonScreenDisplayed(false) is called',
      build: () => NavigationCubit(),
      act: (cubit) => cubit.lessonScreenDisplayed(isLessonScreenDisplayed: false),
      expect: () => [
        const NavigationState(isLessonScreenDisplayed: false),
      ],
    );
  });
}