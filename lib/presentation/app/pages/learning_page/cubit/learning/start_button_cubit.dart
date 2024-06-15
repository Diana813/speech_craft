import 'package:bloc/bloc.dart';

enum StartButtonState { trainingStarted, trainingNotStarted}

class StartButtonCubit extends Cubit<StartButtonState> {
  StartButtonCubit() : super(StartButtonState.trainingNotStarted);

  void startTraining() => emit(StartButtonState.trainingStarted);
}