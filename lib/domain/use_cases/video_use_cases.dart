import 'package:dartz/dartz.dart';

import '../../common/use_case.dart';
import '../failures/failures.dart';
import '../repositories/video_repository.dart';

class VideoUrlParams extends Params {
  final String videoId;

  VideoUrlParams({required this.videoId});

  @override
  List<Object?> get props => [videoId];
}

class UploadVideoUseCase extends UseCase<String, VideoUrlParams> {
  final VideoRepository videoRepository;

  UploadVideoUseCase({required this.videoRepository});

  @override
  Future<Either<String, Failure>> call({required VideoUrlParams params}) async {
    return videoRepository.uploadVideo(videoId: params.videoId);
  }
}
