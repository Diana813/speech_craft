import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'resize_navigation_state.dart';

class ScreenResizedNavigationCubit extends Cubit<ScreenResizedNavigationState> {
  ScreenResizedNavigationCubit() : super(const ScreenResizedNavigationState());

  void lessonScreenDisplayed({required bool isLessonScreenDisplayed}) {
    emit(ScreenResizedNavigationState(isLessonScreenDisplayed: isLessonScreenDisplayed));
  }
}
