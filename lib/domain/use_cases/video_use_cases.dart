import 'package:dartz/dartz.dart';

import '../../common/use_case.dart';
import '../../data/models/pauses_response/timestamps.dart';
import '../failures/failures.dart';
import '../repositories/pauses_repository.dart';
import '../repositories/video_repository.dart';

class VideoUrlParams extends Params {
  final String videoId;

  VideoUrlParams({required this.videoId});

  @override
  List<Object?> get props => [videoId];
}

class UploadVideoUseCase extends UseCase<List<Timestamp>, VideoUrlParams> {
  final VideoRepository videoRepository;
  final PausesRepository pausesRepository;

  UploadVideoUseCase(
      {required this.videoRepository, required this.pausesRepository});

  @override
  Future<Either<List<Timestamp>, Failure>> call(
      {required VideoUrlParams params}) async {

    final uploadResult =
        await videoRepository.uploadVideo(videoId: params.videoId);
    print("upload result: $uploadResult");
    if (uploadResult.isRight()) {
      print("upload is right");
      return Right(ServerFailure());
    }
    return await pausesRepository.getPauses(videoId: params.videoId);
  }
}
