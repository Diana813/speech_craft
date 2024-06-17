import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:speech_craft/data/models/success_rate_response/user_success_rate.dart';

import '../../data/models/upload_audio_request/time_range.dart';
import '../failures/failures.dart';

abstract class FeedbackRepository {
  Future<Either<int, Failure>> uploadUserAudio(
      {required Uint8List bytes, required TimeRange timeRange});

  Future<Either<UserSuccessRate, Failure>> getUserSuccessRate();
}
