import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../../domain/use_cases/video_use_cases.dart';

part 'learning_state.dart';

class LearningCubit extends Cubit<LearningState> {
  final String videoId;
  final UploadVideoUseCase uploadVideoUseCase;

  LearningCubit({required this.uploadVideoUseCase, required this.videoId})
      : super(LearningInitial());

  void onVideoUploading() async {
    emit(VideoUploading());
    final videoUploadedOrFailure =
        await uploadVideoUseCase.call(params: VideoUrlParams(videoId: videoId));

    videoUploadedOrFailure.fold(
      (timestamps) => emit(VideoUploaded()),
      (failure) =>
          emit(VideoUploadingAtError(errorMessage: failure.getMessage())),
    );
  }

  void onPlayClicked(){
    emit(PlayButtonClicked());
  }
}
