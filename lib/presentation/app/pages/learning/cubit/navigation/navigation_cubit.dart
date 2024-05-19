import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState());

  void onSelectedItemChanged({required String videoId}) {
    emit(NavigationState(videoId: videoId));
  }

  void lessonScreenDisplayed({required bool isLessonScreenDisplayed}) {
    emit(NavigationState(
        videoId: state.videoId,
        isLessonScreenDisplayed: isLessonScreenDisplayed));
  }
}
