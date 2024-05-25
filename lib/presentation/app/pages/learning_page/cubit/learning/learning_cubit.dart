import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'learning_state.dart';

class LearningCubit extends Cubit<LearningState> {
  LearningCubit() : super(LearningInitial());


}
