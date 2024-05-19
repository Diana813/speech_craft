part of 'navigation_cubit.dart';

final class NavigationState extends Equatable {
  final String? videoId;
  final bool? isLessonScreenDisplayed;

  const NavigationState({this.isLessonScreenDisplayed, this.videoId});

  @override
  List<Object?> get props => [videoId, isLessonScreenDisplayed];
}
