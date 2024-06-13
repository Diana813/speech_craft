import 'package:bloc/bloc.dart';

class StartButtonCubit extends Cubit<bool> {
  StartButtonCubit() : super(false);

  void startTraining() => emit(true);
}