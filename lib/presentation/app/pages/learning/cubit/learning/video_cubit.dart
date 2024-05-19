import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit() : super(const VideoLoading());

  void loadVideo(String videoId) {
    emit(const VideoLoading());
  }
}
