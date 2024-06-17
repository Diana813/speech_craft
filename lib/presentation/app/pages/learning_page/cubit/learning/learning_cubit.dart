import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:speech_craft/data/models/success_rate_response/user_success_rate.dart';
import 'package:speech_craft/domain/use_cases/feedback_use_cases.dart';

import '../../../../../../common/audio_helper.dart';
import '../../../../../../data/models/upload_audio_request/time_range.dart';

part 'learning_state.dart';

class LearningCubit extends Cubit<LearningState> {
  final FeedbackUseCases feedbackUseCases;

  late final AudioHelper _audioHelper;
  Uint8List _audioBytes = Uint8List(0);
  UserSuccessRate? successRate;

  LearningCubit({required this.feedbackUseCases}) : super(LearningInitial()) {
    _initialize();
  }

  Future<void> recordUserAudio() async {
    var stream = await _audioHelper.record();
    var byteList = await stream.toList();
    _audioBytes = Uint8List.fromList(byteList.expand((x) => x).toList());
  }

  void onUserRecordingSubmitPressed({required TimeRange timeRange}) async {
    successRate = null;
    await _audioHelper.stopRecording();
    emit(FeedbackUploading());

    final feedbackOrFailure = await feedbackUseCases.call(
        params:
            FeedbackRequestParams(bytes: _audioBytes, timeRange: timeRange));
    feedbackOrFailure.fold((feedback) {
      successRate = feedback;
      emit(FeedbackUploaded(userSuccessRate: feedback));
    }, (failure) => emit(FeedbackAtError(errorMessage: failure.getMessage())));
  }

  void onUserResumeVideo() {
    successRate = null;
    emit(LearningInitial());
  }

  void _initialize() {
    _audioHelper = AudioHelper();
  }

  @override
  Future<void> close() {
    _audioHelper.dispose();
    return super.close();
  }
}
