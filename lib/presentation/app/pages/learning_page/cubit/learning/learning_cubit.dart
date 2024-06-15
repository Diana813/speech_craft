import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../../common/audio_helper.dart';

part 'learning_state.dart';

class LearningCubit extends Cubit<LearningState> {
  late final AudioHelper _audioHelper;
  late final Uint8List _audioBytes;

  LearningCubit() : super(LearningInitial()) {
    _initialize();
  }

  Future<void> recordUserAudio() async {
    var stream = await _audioHelper.record();
    var byteList = await stream.toList();
    _audioBytes = Uint8List.fromList(byteList.expand((x) => x).toList());
  }

  void onUserRecordingSubmitPressed() async {
    await _audioHelper.stopRecording();
    emit(AudioRecordedState(audioBytes: _audioBytes));
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
