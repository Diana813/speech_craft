import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:speech_craft/data/data_sources/feedback_data/feedback_remote_data_source.dart';
import 'package:speech_craft/data/models/success_rate_response/user_success_rate.dart';
import 'package:speech_craft/domain/failures/failures.dart';
import 'package:speech_craft/domain/repositories/feedback_repository.dart';

import '../exceptions/exceptions.dart';
import '../models/upload_audio_request/time_range.dart';

class FeedbackRepositoryImpl implements FeedbackRepository {
  final FeedbackRemoteDataSource feedbackRemoteDataSourceImpl;

  FeedbackRepositoryImpl({required this.feedbackRemoteDataSourceImpl});

  @override
  Future<Either<UserSuccessRate, Failure>> getUserSuccessRate() async {
    try {
      final response = await feedbackRemoteDataSourceImpl.getSuccessRate();
      return left(response);
    } on ServerException catch (_) {
      return right(ServerFailure());
    } catch (e) {
      return right(GeneralFailure());
    }
  }

  @override
  Future<Either<int, Failure>> uploadUserAudio(
      {required Uint8List bytes, required TimeRange timeRange}) async {
    try {
      final response = await feedbackRemoteDataSourceImpl.uploadAudio(
          bytes: bytes, timeRange: timeRange);
      return left(response);
    } on ServerException catch (_) {
      return right(ServerFailure());
    } catch (e) {
      return right(GeneralFailure());
    }
  }
}
