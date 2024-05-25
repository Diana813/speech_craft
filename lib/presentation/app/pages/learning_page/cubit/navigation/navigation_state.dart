part of 'navigation_cubit.dart';

final class NavigationState extends Equatable {
  final bool? isLessonScreenDisplayed;

  const NavigationState({this.isLessonScreenDisplayed});

  @override
  List<Object?> get props => [isLessonScreenDisplayed];
}


final class VideoIdChangedState extends NavigationState {
  final String? videoId;

  const VideoIdChangedState({required this.videoId});

  @override
  List<Object?> get props => [videoId];
}
