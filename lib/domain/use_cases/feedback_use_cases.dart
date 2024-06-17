import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:speech_craft/data/models/success_rate_response/user_success_rate.dart';
import 'package:speech_craft/domain/repositories/feedback_repository.dart';

import '../../common/use_case.dart';
import '../../data/models/upload_audio_request/time_range.dart';
import '../failures/failures.dart';

class FeedbackRequestParams extends Params {
  final Uint8List bytes;
  final TimeRange timeRange;

  FeedbackRequestParams({required this.bytes, required this.timeRange});

  @override
  List<Object?> get props => [bytes, timeRange];
}

class FeedbackUseCases extends UseCase<UserSuccessRate, FeedbackRequestParams> {
  final FeedbackRepository feedbackRepository;

  FeedbackUseCases({required this.feedbackRepository});

  @override
  Future<Either<UserSuccessRate, Failure>> call(
      {required FeedbackRequestParams params}) async {

    final uploadResult = await feedbackRepository.uploadUserAudio(
        bytes: params.bytes, timeRange: params.timeRange);

    if (uploadResult.isRight()) {
      return Right(ServerFailure());
    }

    return await feedbackRepository.getUserSuccessRate();
  }
}
