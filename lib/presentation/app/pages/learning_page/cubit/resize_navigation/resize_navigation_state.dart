part of 'resize_navigation_cubit.dart';

final class ScreenResizedNavigationState extends Equatable {
  final bool? isLessonScreenDisplayed;

  const ScreenResizedNavigationState({this.isLessonScreenDisplayed});

  @override
  List<Object?> get props => [isLessonScreenDisplayed];
}


final class VideoIdChangedState extends ScreenResizedNavigationState {
  final String? videoId;

  const VideoIdChangedState({required this.videoId});

  @override
  List<Object?> get props => [videoId];
}
