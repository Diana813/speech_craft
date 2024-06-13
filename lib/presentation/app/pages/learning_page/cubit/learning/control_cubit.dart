import 'package:bloc/bloc.dart';

enum ControlState { home, play, replay, listen, translate }

class ControlCubit extends Cubit<ControlState> {
  bool isRecording = false;
  bool isPlaying = false;

  ControlCubit() : super(ControlState.home);

  void goToHome() => emit(ControlState.home);

  void playVideoSegment() {
    if (!isRecording && !isPlaying) {
      emit(ControlState.play);
    }
  }

  void replayVideoSegment() {
    if (!isRecording && !isPlaying) {
      emit(ControlState.replay);
    }
  }

  void listenSegment() {
    emit(ControlState.listen);
  }

  void translateSegment(){
    emit(ControlState.translate);
  }
}
