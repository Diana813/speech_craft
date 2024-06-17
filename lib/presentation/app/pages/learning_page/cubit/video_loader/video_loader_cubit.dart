import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../../../data/models/pauses_response/timestamps.dart';
import '../../../../../../../domain/use_cases/video_use_cases.dart';

part 'video_loader_state.dart';

class VideoLoaderCubit extends Cubit<VideoLoaderState> {
  final String videoId;
  final UploadVideoUseCase uploadVideoUseCase;

  VideoLoaderCubit({required this.videoId, required this.uploadVideoUseCase})
      : super(VideoLoaderInitial());

  void onVideoUploading() async {
    emit(VideoUploading());
    final videoUploadedOrFailure =
        await uploadVideoUseCase.call(params: VideoUrlParams(videoId: videoId));

    videoUploadedOrFailure.fold(
      (timestamps) => emit(VideoUploaded(pauseTimestamps: timestamps)),
      (failure) =>
          emit(VideoUploadingAtError(errorMessage: failure.getMessage())),
    );
  }

  void resetVideoUploadingState(){
    emit(VideoLoaderInitial());
  }
}
